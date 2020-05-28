#!/bin/bash
#Start the log data generator
for i in s01 s02
do 
 ssh $i "java -classpath /usr/local/dataGenerator-0.0.1-SNAPSHOT-jar-with-dependencies.jar com.hz870420904.logFile.dataGenerator.App $1 $2"
done
