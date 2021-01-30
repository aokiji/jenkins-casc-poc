#!/usr/bin/env bash

# based on https://github.com/edx/jenkins-configuration/blob/master/healthcheck.sh
# Run a curl against the Jenkins instance installed in a Dockerfile
# to do a basic health check

CURL_MAX_TIME=15
ATTEMPTS=25
SLEEP_TIME=10

for ATTEMPT in $(seq ${ATTEMPTS}); do
    echo "Attempt ${ATTEMPT} of ${ATTEMPTS}"
    echo "Curling against the Jenkins server"
    echo "Should expect a 200 within ${CURL_MAX_TIME} seconds"
    STATUS_CODE=$(curl -sL -w "%{http_code}" --user user:user http://jenkins:8080 -o /dev/null \
        --max-time ${CURL_MAX_TIME})

    if [[ "$STATUS_CODE" == "200" ]]; then
        echo "Jenkins has come up and ready to use after ${ATTEMPT} of ${ATTEMPTS} attempts"
        SECRET=$(curl -L -s -u admin:admin -H "Jenkins-Crumb:dac7ce5614f8cb32a6ce75153aaf2398" -X GET $JENKINS_URL/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp | sed "s/.*<application-desc main-class=\"hudson.remoting.jnlp.Main\"><argument>\([a-z0-9]*\).*/\1/")
        if [ -z "$SECRET" ]; then
          echo "Couldnt find out secret"
          exit 1
        else
          echo "SECRET: $SECRET"
          echo $SECRET > /tmp/secret
        fi
        exec "$@"
    else
        echo "Jenkins did not return a correct status code yet"
        echo "Returned: $STATUS_CODE"
        sleep ${SLEEP_TIME}
    fi
done

echo "Jenkins still hasn't returned a 200 status code ${ATTEMPTS} attempts"
exit 1

