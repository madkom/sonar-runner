FROM relateiq/oracle-java8
MAINTAINER Dariusz Gafka

ENV SONAR_RUNNER_VERSION 2.4

WORKDIR /usr/local
RUN apt-get update -y -qq && \
    apt-get install unzip -y -qq && \
    wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/$SONAR_RUNNER_VERSION/sonar-runner-dist-$SONAR_RUNNER_VERSION.zip && \
    unzip sonar-runner-dist-$SONAR_RUNNER_VERSION.zip && \
    rm sonar-runner-dist-$SONAR_RUNNER_VERSION.zip && \
    apt-get remove unzip -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /usr/local/sonar-runner-$SONAR_RUNNER_VERSION/bin:$PATH

VOLUME /data

ENTRYPOINT ["sonar-runner"]