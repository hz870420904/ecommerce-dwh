#!/bin/bash

if [ -n "$1" ];then
	do_date=$1
else
	do_date=`date -d "-1 day" +%F`
fi

hive=/opt/module/hive/bin/hive
app=gmall

sql="

insert into table "$app".contuniously_active_user
(
select
	'$do_date',
	concat(date_add(next_day('$do_date','MO'),-7*3),'_',date_add(next_day('$do_date','MO'),-1)),
	count(*)
from 
(
	select mid_id
	from "$app".dws_user_activity_week
	where 
		week_dt>=concat(date_add(next_day('$do_date','MO'),-7*3),'_',date_add(next_day('$do_date','MO'),-7*2-1))
		and
		week_dt<=concat(date_add(next_day('$do_date','MO')-7),'_',date_add(next_day('$do_date','MO'),-1))
	group by mid_id
	having count(*)=3
) t1;
"
$hive -r "sql"