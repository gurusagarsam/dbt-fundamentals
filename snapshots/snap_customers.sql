{% snapshot customers_snapshot %}

{{
    config(
      target_database='DBT_RAW',
      target_schema='DBT_SJ',
      unique_key='CUSTOMER_ID',
      strategy='check',
      check_cols='all',
    )
}}

select * from {{ ref('cust_orders') }}

{% endsnapshot %}