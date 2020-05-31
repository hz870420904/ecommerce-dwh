drop table if exists ads_retene_user;
create external table ads_retene_user
(
	`create_date` string,
	`retention_day` string,
	`retention_users` bigint
)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_retene_user/'
