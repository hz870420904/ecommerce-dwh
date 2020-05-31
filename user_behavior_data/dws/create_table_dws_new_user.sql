drop table if exists dws_new_user;
create external table des_new_user
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
    `lat` string,
    `create_date`  string 
)
stored as parquet
location '/warehouse/gmall/dws/dws_new_user/';