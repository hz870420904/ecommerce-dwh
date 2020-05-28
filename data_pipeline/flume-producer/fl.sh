#!/bin/bash

#Start and stop flume log collector on all log servers
case $1 in
"start"){
  for i in s02 s01
  do 
    echo "-------start log collector $i --------"
    ssh $i "nohup /usr/local/flume/bin/flume-ng agent --conf /usr/local/flume/conf --conf-file /usr/local/flume/conf/log-collector.conf --name a1 -Dflume.root.logger=INFO,console >/usr/local/flume/test/log.txt 2>&1 & "
  done 
};;
"stop"){
  for i in s02 s01
  do
    echo "------ stop log collector $i -------"
    ssh $i "ps -ef | grep log-collector | grep -v grep | awk '{print \$2}' | xargs kill"
  done

};;
esac
