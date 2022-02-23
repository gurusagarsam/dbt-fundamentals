{%- set source_model = "raw_orders" -%}
{%- set src_pk = "ORDER_HK" -%}
{%- set src_nk = ["ID","USER_ID","ORDER_DATE","STATUS"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "'HUB ORDERS'" -%}

{{ dbtvault.hub(src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model) }}                