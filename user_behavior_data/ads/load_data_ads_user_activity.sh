#!/bin/bash

ap=gmall
hive=/usr/local/hive/bin/hive

if [ -n "$1" ] ;then
	do_date=$1
else 
	do_date=`date -d "-1 day" +%F`  
fi 

sql="
set hive.exec.dynamic.partition.mode=nonstrict;
  
insert into table "$app".ads_user_activity
select 
	'$do_date' dt,
	day_activity.activity,
	week_activity.activity,
	month_activity.activity,
	if(date_add(next_day('$do_date','MO'),-1)='$do_date','Y','N'),
	if(last_day('$do_date')='$do_date','Y','N')
from (
	select 
		'$do_date' dt,
		count(*) activity
	from "$app".dws_user_activity_day
	where dt='$do_date'
	) day_activity
    join (
    select
 		'$do_date' dt,
 		count(*) activity
    from "$app".dws_user_activity_week
    where week_dt=concat(date_add(next_day('$do_date','MO'),-7),'_' ,date_add(next_day('$do_date','MO'),-1))
    ) week_activity on day_activity.dt=week_activity.dt
    join (
    select
    	'$do_date' dt
    	count(*) activity
    from "$app".dws_user_activity_month
    where month=date_format('$do_date','yyyy-MM')
    ） month_activity on day_activity.dt=month_activity.dt;
"
$hive -e "$sql" 
    
	