FROM xiocode/cdh-base

RUN apt-get update -yq
RUN apt-get install -yq \
    hadoop-yarn-nodemanager \
    hadoop-hdfs-datanode \
    hadoop-mapreduce \
    hadoop-client \
    hadoop-lzo

COPY conf.kong/ /etc/hadoop/conf.kong/

RUN update-alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.kong 50
RUN update-alternatives --set hadoop-conf /etc/hadoop/conf.kong

RUN mkdir -p /data/hadoop/tmp/ /data/hadoop/dfs/name /data/hadoop/dfs/data /data/hadoop/yarn/local /data/hadoop/yarn/logs
RUN chown -R hdfs:hdfs /data/hadoop/
RUN chown -R yarn:yarn /data/hadoop/yarn/
RUN chmod -R 700 /data/hadoop/dfs/name /data/hadoop/dfs/data

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/local/bin/dumb-init", "/entrypoint.sh"]

# Expose a bunch of Hadoop ports
EXPOSE 7180 7183 7182 7432 50020 50070 50010 50075 8040 8042 47314 13562 8030 8031 46664 57299 53686 50176 38904

EXPOSE 1004 1006 8020 50470 50090 50495 8485 8480 8032 8033 8088 8041 10020 19888 9160 9042 22

CMD ["tail", "-f", "/var/log/hadoop-*/*.out"]
