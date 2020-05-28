#!/bin/bash
#Start and stop flume consumer group, consumes Kafka data into hdfs
case $1 in
"start"){
  for i in h03
  do
    echo "-------start log collector $i --------"
    ssh $i "nohup /usr/local/flume/bin/flume-ng agent --conf-file /usr/local/flume/conf/fl-hdfs.conf --conf /usr/local/flume/conf --name a2 -Dflume.root.logger=INFO,LOGFILE >/usr/local/flume/log.txt   2>&1 &  "
  done
};;
"stop"){
  for i in h03
  do
    echo "------ stop log collector $i -------"
    ssh $i "ps -ef | grep fl-hdfs | grep -v grep | awk '{print \$2}' | xargs kill"
  done

};;
esac

