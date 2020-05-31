#!/bin/bash

ap=gmall
hive=/usr/local/hive/bin/hive

if [ -n "$1" ] ;then
	do_date=$1
else 
	do_date=`date -d "-1 day" +%F`  
fi 

sql=
"
insert into table "$app".ads_silent_user
select 
    '$do_date' dt,
    count(*) silent_count
from 
(
	select mid_id
	from "$app".dws_user_activity
	where dt<'$do_date'
	group by mid_id
	having count(*)=1 and min(dt)<date_add('$do_date',-14)
) t1;
"

$hive -e "$sql"