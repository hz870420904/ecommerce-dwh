#!/bin/bash
app=gmall
hive=/usr/local/hive/bin/hive

if[ -n "$1" ] ;then
  do_date=$1
else
  do_date='date -d "-1 day" +%F'
fi

sql=
"
insert overwrite table "$app".dwd_base_event_log
PARTITION (dt='$do_date')
select 
mid_id,
user_id,
version_code,
version_name,
lang,
`source`,
os,
area,
model,
brand,
sdk_version,
gmail,
height_width,
app_time,
network,
lng,
lat,
event_name,
event_json,
server_time --common fields
FROM
(SELECT 
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[0] as mid_id
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[1] as user_id
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[2] as verdsion_code
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[3] as verdsion_name
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[4] as lang
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[5] as `source`
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[6] as os
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[7] as area
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[8] as model
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[9] as brand
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[10] as sdk_version
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[11] as gmail
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[12] as app_time
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[13] as network
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[14] as lng
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[15] as lat
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[16] as ops
SPLIT(base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la'), "\t")[17] as server_time
FROM "$app".ods_event_log
WHERE dt='$do_date' AND base_analizer(line, 'mid,uid,vc,vn,l,sr,os,ar,md,ba,sv,g,hw,t,nw,ln,la')<>'') sdk_log
LATERAL VIEW flat_analizer(sdk_log.ops) tmp_k as event_name, evenr_json;
"

$hive -e "$sql"
