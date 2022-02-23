{{
  config(
    materialized='incremental'
  )
}}

{%- set yaml_metadata -%}
source_model: 'j_customers'
derived_columns:
  RECORD_SOURCE: "'RAW CUSTOMERS'"
  LOAD_DATE: DATEADD(DAY, 1, CURRENT_TIMESTAMP())
hashed_columns:
  CUSTOMER_HK: 
    - 'ID'
    - 'FIRST_NAME'
    - 'LAST_NAME'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}