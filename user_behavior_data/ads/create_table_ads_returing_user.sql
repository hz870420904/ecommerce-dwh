drop table if exists ads_returing_user;
create external table ads_returing_user
(
	`dt` string,
	`week` string,
	`returing_user` bigint
)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_returing_user';