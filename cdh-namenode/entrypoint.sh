#!/bin/sh

update-alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.kong 50
update-alternatives --set hadoop-conf /etc/hadoop/conf.kong

service hadoop-hdfs-datanode start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

