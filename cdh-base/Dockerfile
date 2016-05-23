FROM xiocode/java:8

#add CDH repo
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list > /etc/apt/sources.list.d/cloudera.list

# add CM repo
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/cloudera.list > /etc/apt/sources.list.d/cloudera-manager.list

# LZO Repo
RUN echo 'deb [arch=amd64] http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras trusty-gplextras5 contrib
deb-src http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras trusty-gplextras5 contrib' > /etc/apt/sources.list.d/cloudera-gplextras.list

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq apt-transport-https
RUN apt-get clean && rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

