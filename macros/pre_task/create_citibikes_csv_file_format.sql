-- Run any SQL in a Macro

{% macro create_citibikes_csv_file_format(database_name="DBT_RAW",schema_name="DBT_SJ",file_format_name="CSV_FILE_FORMAT") %}

    CREATE OR REPLACE FILE FORMAT database_name.schema_name.file_format_name
    TYPE = 'CSV'
    COMPRESSION = 'AUTO'
    FIELD_DELIMITER = ','
    RECORD_DELIMITER = '\n'
    SKIP_HEADER = 0
    FIELD_OPTIONALLY_ENCLOSED_BY = '\042'
    TRIM_SPACE = FALSE
    ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
    ESCAPE = 'NONE'
    ESCAPE_UNENCLOSED_FIELD = '\134'
    DATE_FORMAT = 'AUTO'
    TIMESTAMP_FORMAT = 'AUTO'
    NULL_IF = ('');

{% endmacro %}