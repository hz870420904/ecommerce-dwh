#!/bin/bash

app=gmall
hive=/usr/local/hive/bin/hive

if [ -n "$1" ] ;then
	do_date=$1
else 
	do_date=`date -d "-1 day" +%F`  
fi 

sql="
insert overwrite table "$app".ads_retene_user
select 
	create_date,
	retention_day,
	count(*) retention_users
from "$app".dws_retene_user
where dt='do_date'
group by create_date, retention_day;
"

$hive -e "$sql"