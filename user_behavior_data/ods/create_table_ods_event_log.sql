--Create table
drop table if exists ods_event_log;
CREATE TABLE ods_event_log (line string)
PARTITIONED BY (`dt` string)
STORED AS
  INPUTFORMAT 'com.hadoop.mapred.DeprecatedLzoTextInputFormat' --LZO compression
  OUTPUTFORMAT 'rog.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '/warehouse/gmall/ods/ods_event_log';
 