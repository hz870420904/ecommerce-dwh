drop table if exists ods_start_log;
CREATE EXTERNAL TABLE ods_start_log (line string)
PARTITIONED BY (`dt` string)
STORED AS 
 INPUTFORMAT 'com.hadoop.mapred.DeprecatedLzoTextInputFormat' --LZO compression
 OUTPUTFORMAT 'rog.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '/warehouse/gmall/ods/ods_start_log'; --Where to put this table

--Daily load data into ods_start_log, this will move HDFS data into ODS layer of the warehouse
--Date need to change every time


