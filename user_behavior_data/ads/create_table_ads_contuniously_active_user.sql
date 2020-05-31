drop table if exists ads_consuniously_active_user;
create table ads_contuniously_active_user
(
	`dt` string;
	`active_week` string;
	`contuniouse_week` bigint
)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_consuniously_active_user/'