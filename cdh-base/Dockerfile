FROM xiocode/java:8

#add CDH repo
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list > /etc/apt/sources.list.d/cloudera.list

# add CM repo
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/cloudera.list > /etc/apt/sources.list.d/cloudera-manager.list

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq apt-transport-https
