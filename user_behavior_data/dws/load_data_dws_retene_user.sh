#!/bin/bash


app=gmall
hive=/usr/local/hive/bin/hive

if [ -n "$1" ] ;then
	do_date=$1
else 
	do_date=`date -d "-1 day" +%F`  
fi 
sql="
insert overwrite table "$app".dws_retene_user
partition(dt='$do_date')

select
	ru.mid_id,
	ru.user_id,
	ru.version_code,
	ru.version_name,
	ru.lang,
	ru.source,
	ru.os,
	ru.area,
	ru.model,
	ru.brand,
	ru.sdk_version,
	ru.gmail,
	ru.height_width,
	ru.app_time,
	ru.network,
	ru.lng,
	ru.lat,
	ru.create_date,
	1 retention_day
from "$app".dws_user_activity ua join "$app".dws_retenr_user ru on ua.mid_id=ru.mid_id
where ua.dt='$do_date' and ru.create_date=date_add('$do_date',-1);

union all

select
	ru.mid_id,
	ru.user_id,
	ru.version_code,
	ru.version_name,
	ru.lang,
	ru.source,
	ru.os,
	ru.area,
	ru.model,
	ru.brand,
	ru.sdk_version,
	ru.gmail,
	ru.height_width,
	ru.app_time,
	ru.network,
	ru.lng,
	ru.lat,
	ru.create_date,
	2 retention_day
from "$app".dws_user_activity ua join "$app".dws_retenr_user ru on ua.mid_id=ru.mid_id
where ua.dt='$do_date' and ru.create_date=date_add('$do_date',-2);

union all

select
	ru.mid_id,
	ru.user_id,
	ru.version_code,
	ru.version_name,
	ru.lang,
	ru.source,
	ru.os,
	ru.area,
	ru.model,
	ru.brand,
	ru.sdk_version,
	ru.gmail,
	ru.height_width,
	ru.app_time,
	ru.network,
	ru.lng,
	ru.lat,
	ru.create_date,
	3 retention_day
from "$app".dws_user_activity ua join "$app".dws_retenr_user ru on ua.mid_id=ru.mid_id
where ua.dt='$do_date' and ru.create_date=date_add('$do_date',-3);

union all

select
	ru.mid_id,
	ru.user_id,
	ru.version_code,
	ru.version_name,
	ru.lang,
	ru.source,
	ru.os,
	ru.area,
	ru.model,
	ru.brand,
	ru.sdk_version,
	ru.gmail,
	ru.height_width,
	ru.app_time,
	ru.network,
	ru.lng,
	ru.lat,
	ru.create_date,
	5 retention_day
from "$app".dws_user_activity ua join "$app".dws_retenr_user ru on ua.mid_id=ru.mid_id
where ua.dt='$do_date' and ru.create_date=date_add('$do_date',-5);

union all

select
	ru.mid_id,
	ru.user_id,
	ru.version_code,
	ru.version_name,
	ru.lang,
	ru.source,
	ru.os,
	ru.area,
	ru.model,
	ru.brand,
	ru.sdk_version,
	ru.gmail,
	ru.height_width,
	ru.app_time,
	ru.network,
	ru.lng,
	ru.lat,
	ru.create_date,
	7 retention_day
from "$app".dws_user_activity ua join "$app".dws_retenr_user ru on ua.mid_id=ru.mid_id
where ua.dt='$do_date' and ru.create_date=date_add('$do_date',-7);
"

$hive -e "$sql"

