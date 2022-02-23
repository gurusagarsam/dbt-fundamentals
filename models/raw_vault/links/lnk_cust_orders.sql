{%- set source_model = ["hub_cust", "hub_orders"] -%}
{%- set src_pk = "LINK_CUSTOMER_ORDER_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "ORDER_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "'LINK CUST ORDERS'" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}