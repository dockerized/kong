FROM xiocode/cdh-base

RUN apt-get update -yq
RUN apt-get install -yq \
    hbase-master \
    hbase-regionserver \
    hbase-thrift \
    hbase-rest

COPY conf.dist/ /etc/hbase/conf.dist/

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/local/bin/dumb-init", "/entrypoint.sh"]

# Expose a bunch of Hadoop ports
EXPOSE 7180 7183 7182 7432 50020 50070 50010 50075 8040 8042 47314 13562 8030 8031 46664 57299 53686 50176 38904

EXPOSE 1004 1006 8020 50470 50090 50495 8485 8480 8032 8033 8088 8041 10020 19888 9160 9042 22

CMD ["tail", "-f", "/var/log/hbase/*.out"]
