FROM jenkins/inbound-agent
USER root
RUN apt-get update \
      && apt-get install -y cmake g++ libboost-test1.67-dev \
      && rm -rf /var/lib/apt/lists/*
USER jenkins
