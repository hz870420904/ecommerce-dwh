#!/bin/bash
if [ -n "$1" ];then
	do_date=$1
else
	do_date=`date -d "-1 day" +%F`
fi

hive=/usr/local/hive/bin/hive
app=gmall


sql="
insert into table "$app".ads_returning_user
select 
       '$do_date' dt,
       concat(date_add(next_day('$do_date','MO'),-7),'_',date_add(next_day('$do_date','MO'),-1)) week,
       count(*)
from 
(
    select t1.mid_id
    from 
    (
        select mid_id
        from "$app".dws_user_activity_week
        where week_dt=concat(date_add(next_day('$do_date','MO'),-7),'_',date_add(next_day('$do_date','MO'),-1))
    )t1
    left join
    (
        select mid_id
        from "$app".dws_new_user_day
        where create_date<=date_add(next_day('$do_date','MO'),-1) and create_date>=date_add(next_day('$do_date','MO'),-7)
    )t2
    on t1.mid_id=t2.mid_id
    left join
    (
        select mid_id
        from "$app".dws_user_activity_week
        where week_dt=concat(date_add(next_day('$do_date','MO'),-7*2),'_',date_add(next_day('$do_date','MO'),-7-1))
    )t3
    on t1.mid_id=t3.mid_id
    where t2.mid_id is null and t3.mid_id is null
)t4;
"

$hive -e "$sql"