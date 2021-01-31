FROM jenkins/jenkins:2.263.1-lts
COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN set -x && jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
