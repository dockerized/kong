FROM xiocode/java:8

#add CDH repo
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list > /etc/apt/sources.list.d/cloudera.list

# add CM repo
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/cloudera.list > /etc/apt/sources.list.d/cloudera-manager.list

# LZO Repo
COPY cloudera-gplextras.list /etc/apt/sources.list.d/

RUN apt-get update -yq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq ssh apt-transport-https

# https://github.com/Yelp/dumb-init
RUN curl -fLsS -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 && chmod +x /usr/local/bin/dumb-init

RUN apt-get clean && rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN mkdir /var/run/sshd && \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
