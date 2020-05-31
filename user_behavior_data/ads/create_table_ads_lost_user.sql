drop table if exists ads_lost_user;
create external table ads_lost_user( 
    `dt` string,
    `lost_user` bigint
) 
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_lost_user';