#!/bin/bash
#Start and stop zookeeper cluster
case $1 in
"start"){
 for i in kafka01 kafka02 kafka03
 do 
    ssh $i "/usr/local/zk/bin/zkServer.sh start"
    done
};;
"status"){
 for i in kafka01 kafka02 kafka03
 do 
    ssh $i "/usr/local/zk/bin/zkServer.sh status"
 done
};;
"stop"){
 for i in kafka01 kafka02 kafka03
 do 
   ssh $i "/usr/local/zk/bin/zkServer.sh stop"
 done
};;
esac
