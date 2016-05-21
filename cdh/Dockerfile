FROM xiocode/java:8

#add CDH repo
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list > /etc/apt/sources.list.d/cloudera.list

# add CM repo
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/archive.key | apt-key add -
RUN curl http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/cloudera.list > /etc/apt/sources.list.d/cloudera-manager.list

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq apt-transport-https ssh net-tools vim inetutils-ping hadoop-conf-pseudo
RUN apt-get install spark-core spark-history-server spark-python -y
RUN sudo -u hdfs hdfs namenode -format

RUN echo 'root:root' | chpasswd
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Setting up password less authentication
RUN sed -ri "s/#   PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Change the value to no; this will prevent the question when connecting with SSH to the host.
RUN sed -ri "s/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/" /etc/ssh/ssh_config

RUN service ssh restart

# SSH
EXPOSE 22
# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122

