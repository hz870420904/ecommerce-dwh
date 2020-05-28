DROP TABLE IF EXISTS dwd_loading_log; --Product loading table
CREATE EXTERNAL TABLE dwd_loading_log(
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
  `action` string,
  `loading_time` string,
  `loading_way` string,
  `extend1` string,
  `extend2` string,
  `type` string,
  `type1` string
  `server_time` string)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_loading_log/';

DROP TABLE IF EXISTS dwd_display_log; --Display table
CREATE EXTERNAL TABLE dwd_display_log(
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
  `action` string,
  `productid` string,
  `order` string,
  `extend1` string,
  `category` string,
  `server_time` string)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_display_log/';

DROP TABLE IF EXISTS dwd_product_detail_log; --product detail table
CREATE EXTERNAL TABLE dwd_product_detail_log(
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
`entry` string,
`action` string,
`productid` string,
`showtype` string,
`product_staytime` string,
`loading_time` string,
`type1` string,
`category` string,
`server_time` string)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_product_detail_log/';
	
DROP TABLE IF EXISTS dwd_ad_log; --Advertisments 
CREATE EXTERNAL TABLE dwd_ad_log(
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
`entry` string,
`action` string,
`content` string,
`detail` string,
`ad_source` string,
`behavior` string,
`adtype` string,
`show_style` string,
`server_time` string)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_ad_log/';

drop table if exists dwd_notification_log; --Notification table
CREATE EXTERNAL TABLE dwd_notification_log(
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
`action` string,
`noti_type` string,
`ap_time` string,
`content` string,
`server_time` string
)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_notification_log/';

DROP TABLE IF EXISTS dwd_frontend_act_log; --Users frontend activities logs
CREATE EXTERNAL TABLE dwd_frontend_act_log(
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
`push_id` string,
`access` string,
`server_time` string)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_frontend_act_log/';

DROP TABLE IF EXISTS dwd_backend_act_log; --Users' backend activities logs
CREATE EXTERNAL TABLE dwd_backend_act_log(
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
`active_source` string,
`server_time` string
)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_backend_act_log/';

DROP TABLE IF EXISTS dwd_comment_log; --Comments history
CREATE EXTERNAL TABLE dwd_comment_log(
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
`comment_id` int,
`userid` int,
`p_comment_id` int, 
`content` string,
`addtime` string,
`other_id` int,
`like_count` int,
`reply_count` int,
`server_time` string
)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_comment_log/';

DROP TABLE IF EXISTS dwd_favorites_log;
CREATE EXTERNAL TABLE dwd_favorites_log(
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
`id` int, 
`course_id` int, 
`userid` int,
`add_time` string,
`server_time` string
)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_favorites_log/';

DROP TABLE IF EXISTS dwd_like_log;
CREATE EXTERNAL TABLE dwd_like_log(
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
`id` string, 
`userid` string, 
`target_id` string,
`type` string,
`add_time` string,
`server_time` string
)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_like_log/';

DROP TABLES IF EXISTS dwd_error_log;
CREATE EXTERNAL TABLE dwd_error_log(
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
`errorBrief` string, 
`errorDetail` string, 
`server_time` string)
PARTITIONED BY (dt string)
LOCATION '/warehouse/gmall/dwd/dwd_error_log/';
