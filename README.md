# Getting started

```
$ docker-compose up
```

and go to http://localhost:8080 in browser

this starts up a jenkins server and a jenkins agent

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

These files are added to jenkins server container at `/etc/jenkins/config/jcasc/` as set by `CASC_JENKINS_CONFIG` environment variable

# Resources

* [Jenkins DSL Documentation](https://jenkinsci.github.io/job-dsl-plugin/)
* [Jenkins Configuration as Code Documentation](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/README.md)
* [Jenkinsfile Documentation](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/)
* [Jenkins Configuration as Code local reference](http://localhost:8080/configuration-as-code/reference)
