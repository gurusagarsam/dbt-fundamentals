{%- set source_model = "raw_cust" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_nk = "ID" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "'HUB CUSTOMER'" -%}

{{ dbtvault.hub(src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model) }}