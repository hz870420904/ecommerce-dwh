#!/bin/bash

hive=/usr/local/hive/bin/hive
app=gmall

if [ -n $1 ]; then #input date
    do_date=$1
else 
    do_date='date -d "-1 day" +%F'
fi

sql="
LOAD DATA INPATH '/origin_data/gmall/log/topic_start/$do_date' INTO TABLE "$app".ods_start_log PARTITION(dt='$do_date');
LOAD DATA INPATH '/origin_data/gmall/log/topic_event/$do_date' INTO TABLE "$app".ods_event_log PARTITION(dt='$do_date');
"     

$hive -e "$sql"