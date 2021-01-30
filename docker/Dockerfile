FROM jenkins/jenkins:2.263.1-lts
ENV JAVA_OPTS='-Xmx600m'
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN set -x && jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
