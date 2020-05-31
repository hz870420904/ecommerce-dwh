drop table if exists ads_user_activity;
create external table ads_user_activity(
	`date` string,
	`day_activity` bigint,
	`week_activity` bigint,
	`month_activity` bigint,
	`is_weekend` bigint,
	`id_month_end` bigint)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_user_activity/'
;

