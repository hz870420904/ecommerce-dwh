#!/bin/bash

app=gmall
hive=/usr/local/hive/bin/hive

if [ -n "$1" ] ;then
	do_date=$1
else 
	do_date=`date -d "-1 day" +%F`  
fi 

sql="
insert into table dws_new_user
select  
    ud.mid_id,
    ud.user_id , 
    ud.version_code , 
    ud.version_name , 
    ud.lang , 
    ud.source, 
    ud.os, 
    ud.area, 
    ud.model, 
    ud.brand, 
    ud.sdk_version, 
    ud.gmail, 
    ud.height_width,
    ud.app_time,
    ud.network,
    ud.lng,
    ud.lat,
    '$do_date'
from dws_user_activity_day ud left join dws_new_user nm on ud.mid_id=nm.mid_id
where ud.dt='$do_date' and nm.mid_id is null;"

$hive -e "$sql"