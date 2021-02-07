# Getting started

```
$ docker-compose up
```

and go to http://localhost:8080 in browser

this starts up a jenkins server and a jenkins agent

if you wish to run it with a couple of agents

```
$  docker-compose -f docker-compose.yml -f docker/docker-compose.with-agent1.yml -f docker/docker-compose.with-agent2.yml up
```

# Configuration

## Plugins

Jenkins plugins are listed in [plugins.txt](./docker/plugins.txt). You need to rebuild the docker image when this file is changed

```
$ docker-compose build jenkins
```

## Jenkins Configuration as Code (JCasC)

Jenkins Configuration as code is a jenkins plugin that allows to declare jenkins configuration in yaml files

The directory [config/jcasc](./config/jcasc) contains several file configuring different aspects of jenkins:

* [main.yaml](./config/jcasc/main.yaml): main jenkins configuration
* [nodes.yaml](./config/jcasc/nodes.yaml): define jenkins nodes
* [jobs.yaml](./config/jobs.yaml): jobs definition
* [security.yaml](./config/security.yaml): security settings
* [misc.yaml](./config/misc.yaml): other plugin configuration

These files are added to jenkins server container at `/etc/jenkins/config/jcasc/` as set by `CASC_JENKINS_CONFIG` environment variable

## Jobs

Jobs are loaded through a seed job defined in [jobs.yaml](./config/jobs.yaml) that dynamically generates all other jobs. These jobs are defined in [jobs folder](./config/jobs) in a series of groovy scripts

When starting jenkins the seed job is automatically launched as defined in [seed.groovy](./docker/init.groovy.d/seed.groovy)

### Pipeline library

A pipeline library is available globally. This pipeline library is defined in this [repository](https://github.com/aokiji/jenkins-casc-poc-library)

# Resources

* [Jenkins Jobs DSL API Reference](http://localhost:8080/plugin/job-dsl/api-viewer/index.html)
* [Jenkins Configuration as Code Documentation](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/README.md)
* [Jenkinsfile Documentation](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/)
* [Jenkins Configuration as Code local reference](http://localhost:8080/configuration-as-code/reference)
* [Groovy Language Reference](http://docs.groovy-lang.org/latest/html/documentation/#_groovy_language_specification)
