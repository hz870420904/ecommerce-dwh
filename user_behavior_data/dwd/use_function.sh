#Add .jar to hive class path
add jar /usr/local/hive/hiveFunction-0.0.1-SNAPSHOT-jar-with-dependencies.jar
#Create temporary function related to UDF and UDTF
create temporary function base_analizer as 'com.hz870420904.udf.BaseFieldUDF'

create temporary function flat_analizer as 'com.hz870420904.udtf.EventJsonUDTF'
