#!/bin/bash

if [ -n "$1" ];then
	do_date=$1
else
	do_date=`date -d "-1 day" +%F`
fi

hive=/usr/local/hive/bin/hive
app=gmall

sql="
insert into table "$app".ads_lost_user
select
     '$do_date',
     count(*)
from 
(
    select mid_id
    from "$app".dws_user_activity_day
    group by mid_id
    having max(dt)<=date_add('$do_date',-7)
)t1;
"

$hive -e "$sql"