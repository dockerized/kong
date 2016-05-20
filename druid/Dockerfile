FROM buildpack-deps:trusty-curl

ENV DRUID_VERSION 0.9.0

RUN wget http://static.druid.io/artifacts/releases/druid-${DRUID_VERSION}-bin.tar.gz && \
    tar -xzf druid-${DRUID_VERSION}-bin.tar.gz -C /usr/local && \
    rm -rf druid-${DRUID_VERSION}-bin.tar.gz && \
    wget http://static.druid.io/artifacts/releases/mysql-metadata-storage-${DRUID_VERSION}.tar.gz && \
    tar -xzf mysql-metadata-storage-${DRUID_VERSION}.tar.gz -C /usr/local/druid-${DRUID_VERSION}/extensions/

WORKDIR /usr/local/druid-${DRUID_VERSION}

