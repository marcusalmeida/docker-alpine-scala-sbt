FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER Marcus Almeida <marcusmage@gmail.com>

ENV SCALA_VERSION=2.12.3 \
    SCALA_HOME=/usr/share/scala \
    SBT_VERSION=1.0.0 \
    SBT_HOME=/usr/share/sbt 

# Install Scala
RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash && \
    cd "/tmp" && \
    wget "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "/tmp/"*

# Install sbt
RUN cd "/tmp" && \
    wget "https://github.com/sbt/sbt/releases/download/v1.0.0/sbt-${SBT_VERSION}.tgz" && \
    tar zxf "sbt-${SBT_VERSION}.tgz" && \
    mkdir "${SBT_HOME}" && \
    mv "/tmp/sbt/"* "${SBT_HOME}" && \
    ln -s "${SBT_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "/tmp/"* && \
    sbt sbtVersion

# Remove build dependencies
RUN apk del .build-dependencies 