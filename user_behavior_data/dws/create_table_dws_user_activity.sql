drop table id exists dws_user_activity_day;
create external table dws_user_activity_day
(
	`mid_id` string,
    `user_id` string, 
    `version_code` string, 
    `version_name` string, 
    `lang` string, 
    `source` string, 
    `os` string, 
    `area` string, 
    `model` string, 
    `brand` string, 
    `sdk_version` string, 
    `gmail` string, 
    `height_width` string,
    `app_time` string,
    `network` string,
    `lng` string,
    `lat` string
)
partitioned by (dt string)
stored as parquet
location '/warehouse/gmall/dws/dws_user_activity_day'
;

drop table if exists dws_user_activity_week;
create external table dws_user_activity_week( 
    `mid_id` string,
    `user_id` string, 
    `version_code` string, 
    `version_name` string, 
    `lang` string, 
    `source` string, 
    `os` string, 
    `area` string, 
    `model` string, 
    `brand` string, 
    `sdk_version` string, 
    `gmail` string, 
    `height_width` string,
    `app_time` string,
    `network` string,
    `lng` string,
    `lat` string
    `monday_date` string,
    `sunday_date` string
) 
PARTITIONED BY (`wk` string)
stored as parquet
location '/warehouse/gmall/dws/dws_user_activity_week/'
;

drop table if exists dws_user_activity_month;
create external table dws_user_activity_month( 
   `mid_id` string,
    `user_id` string, 
    `version_code` string, 
    `version_name` string, 
    `lang` string, 
    `source` string, 
    `os` string, 
    `area` string, 
    `model` string, 
    `brand` string, 
    `sdk_version` string, 
    `gmail` string, 
    `height_width` string,
    `app_time` string,
    `network` string,
    `lng` string,
    `lat` string
) 
PARTITIONED BY (`mn` string)
stored as parquet
location '/warehouse/gmall/dws/dws_user_activity_month/'
;