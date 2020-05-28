#!/bin/bash
#Start and stop Kafka cluster
case $1 in
"start"){
  for i in kafka01 kafka02 kafka03
  do 
     echo "--------------Kafka start $1---------------"
     ssh $i "export JMX_PORT=9988 && /usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties"
  done
};;

"stop"){
    for i in kafka01 kafka02 kafka03
    do
        echo "---------------Kafka stop $1------------"
        ssh $i "/usr/local/kafka/bin/kafka-server-stop.sh stop"
    done
};;
esac
