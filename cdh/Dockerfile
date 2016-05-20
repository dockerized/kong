FROM xiocode/java:8

#add CDH repo
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list > /etc/apt/sources.list.d/cloudera.list

# add CM repo
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/cloudera.list > /etc/apt/sources.list.d/cloudera-manager.list

#RUN apt-get update
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq oracle-j2sdk1.8
#ENV JAVA_HOME /usr/lib/jvm/java-7-oracle-cloudera
#ENV PATH $JAVA_HOME/bin:$PATH

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq supervisor cloudera-manager-server-db cloudera-manager-daemons cloudera-manager-server apt-transport-https ssh net-tools vim inetutils-ping

RUN echo 'root:root' | chpasswd
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Setting up password less authentication
RUN sed -ri "s/#   PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Change the value to no; this will prevent the question when connecting with SSH to the host.
RUN sed -ri "s/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/" /etc/ssh/ssh_config

RUN service ssh restart

COPY hadoop.conf /etc/supervisor/conf.d/

# SSH Ports
EXPOSE 22

# Zookeeper Ports
EXPOSE 2181

# CM Ports
EXPOSE 7180 7182 7183

#HDFS Ports
EXPOSE 50010 50020 50070 50075 50090
# History Server Port
EXPOSE 19888
#Yarn Ports
EXPOSE 8030 8031 8032 8033 8040 8041 8042
#Yarn MapReduce Port
EXPOSE 8088

# HUE
EXPOSE 8888


CMD ["supervisord", "-n"]
