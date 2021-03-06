{% set sqls = "
create or replace external table CITI_BIKES_EXT(
	TRIPDURATION NUMBER(38,0) AS (TO_NUMBER(IFF((IS_NULL_VALUE(GET(VALUE, 'c1'))) OR ((LOWER(CAST(GET(VALUE, 'c1') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c1')))),
	STARTTIME TIMESTAMP_NTZ(9) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c2'))) OR ((LOWER(CAST(GET(VALUE, 'c2') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c2')) AS TIMESTAMP_NTZ(9))),
	STOPTIME TIMESTAMP_NTZ(9) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c3'))) OR ((LOWER(CAST(GET(VALUE, 'c3') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c3')) AS TIMESTAMP_NTZ(9))),
	START_STATION_ID NUMBER(38,0) AS (TO_NUMBER(IFF((IS_NULL_VALUE(GET(VALUE, 'c4'))) OR ((LOWER(CAST(GET(VALUE, 'c4') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c4')))),
	START_STATION_NAME VARCHAR(500) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c5'))) OR ((LOWER(CAST(GET(VALUE, 'c5') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c5')) AS VARCHAR(500))),
	START_STATION_LATITUDE FLOAT AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c6'))) OR ((LOWER(CAST(GET(VALUE, 'c6') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c6')) AS FLOAT)),
	START_STATION_LONGITUDE FLOAT AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c7'))) OR ((LOWER(CAST(GET(VALUE, 'c7') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c7')) AS FLOAT)),
	END_STATION_ID VARCHAR(50) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c8'))) OR ((LOWER(CAST(GET(VALUE, 'c8') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c8')) AS VARCHAR(50))),
	END_STATION_NAME VARCHAR(500) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c9'))) OR ((LOWER(CAST(GET(VALUE, 'c9') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c9')) AS VARCHAR(500))),
	END_STATION_LATITUDE VARCHAR(50) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c10'))) OR ((LOWER(CAST(GET(VALUE, 'c10') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c10')) AS VARCHAR(50))),
	END_STATION_LONGITUDE VARCHAR(50) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c11'))) OR ((LOWER(CAST(GET(VALUE, 'c11') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c11')) AS VARCHAR(50))),
	BIKEID NUMBER(38,0) AS (TO_NUMBER(IFF((IS_NULL_VALUE(GET(VALUE, 'c12'))) OR ((LOWER(CAST(GET(VALUE, 'c12') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c12')))),
	MEMBERSHIP_TYPE VARCHAR(100) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c13'))) OR ((LOWER(CAST(GET(VALUE, 'c13') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c13')) AS VARCHAR(100))),
	USERTYPE VARCHAR(100) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c14'))) OR ((LOWER(CAST(GET(VALUE, 'c14') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c14')) AS VARCHAR(100))),
	BIRTH_YEAR VARCHAR(100) AS (CAST(IFF((IS_NULL_VALUE(GET(VALUE, 'c15'))) OR ((LOWER(CAST(GET(VALUE, 'c15') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c15')) AS VARCHAR(100))),
	GENDER NUMBER(38,0) AS (TO_NUMBER(IFF((IS_NULL_VALUE(GET(VALUE, 'c16'))) OR ((LOWER(CAST(GET(VALUE, 'c16') AS VARCHAR))) = 'null'), null, GET(VALUE, 'c16')))))
location=@STG_CITIBIKES/
auto_refresh=false
file_format=dbt_raw.dbt_sj.CSV_FILE_FORMAT
" %}
{{ create_ddl( sqls ,True) }}