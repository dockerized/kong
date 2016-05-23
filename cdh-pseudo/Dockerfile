FROM xiocode/cdh-base
MAINTAINER Tony.Shao <xiocode@gmail.com>

# Base image doesn't start in root
WORKDIR /

# Install CDH package and dependencies
RUN apt-get install -y zookeeper-server && \
    apt-get install -y hadoop-conf-pseudo && \
    apt-get install -y oozie && \
    apt-get install -y python-pip && \
    apt-get install -y hue && \
    apt-get install -y hue-plugins && \
    apt-get install -y spark-core spark-history-server spark-python

# Copy updated config files
COPY conf/core-site.xml /etc/hadoop/conf/core-site.xml
COPY conf/hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml
COPY conf/mapred-site.xml /etc/hadoop/conf/mapred-site.xml
COPY conf/hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh
COPY conf/yarn-site.xml /etc/hadoop/conf/yarn-site.xml
COPY conf/fair-scheduler.xml /etc/hadoop/conf/fair-scheduler.xml
COPY conf/oozie-site.xml /etc/oozie/conf/oozie-site.xml
COPY conf/spark-defaults.conf /etc/spark/conf/spark-defaults.conf
COPY conf/hue.ini /etc/hue/conf/hue.ini

# Format HDFS
RUN sudo -u hdfs hdfs namenode -format

COPY conf/run-hadoop.sh /usr/bin/run-hadoop.sh
RUN chmod +x /usr/bin/run-hadoop.sh

RUN sudo -u oozie /usr/lib/oozie/bin/ooziedb.sh create -run && \
    wget http://archive.cloudera.com/gplextras/misc/ext-2.2.zip -O ext.zip && \
    unzip ext.zip -d /var/lib/oozie

#uninstall not necessary hue apps
RUN /usr/lib/hue/tools/app_reg/app_reg.py --remove hbase && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove impala && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove spark && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove rdbms && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove search && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove sqoop && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove zookeeper && \
    /usr/lib/hue/tools/app_reg/app_reg.py --remove security

# NameNode (HDFS)
EXPOSE 8020 50070

# DataNode (HDFS)
EXPOSE 50010 50020 50075

# ResourceManager (YARN)
EXPOSE 8030 8031 8032 8033 8088

# NodeManager (YARN)
EXPOSE 8040 8042

# JobHistoryServer
EXPOSE 10020 19888

# Hue
EXPOSE 8888

# Spark history server
EXPOSE 18080

# Technical port which can be used for your custom purpose.
EXPOSE 9999

CMD ["/usr/bin/run-hadoop.sh"]
