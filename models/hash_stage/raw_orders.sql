{{
  config(
    materialized='incremental'
  )
}}

{%- set yaml_metadata -%}
source_model: 'j_orders'
derived_columns:
  RECORD_SOURCE: "'RAW ORDERS'"
  LOAD_DATE: DATEADD(DAY, 1, CURRENT_TIMESTAMP())
  EFFECTIVE_FROM: ORDER_DATE
hashed_columns:
  TRANSACTION_HK:
    - 'ID'
    - 'USER_ID'
    - 'STATUS'
    - 'ORDER_DATE'
  CUSTOMER_HK: 'ID'
  ORDER_HK: 'ID'
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