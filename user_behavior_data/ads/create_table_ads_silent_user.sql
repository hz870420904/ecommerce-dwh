drop table if exists ads_silent_user;
create external table ads_silent_user
(
	`dt` string,
	`silent_user` bigint
)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_silent_user';