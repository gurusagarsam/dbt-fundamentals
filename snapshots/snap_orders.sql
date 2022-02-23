{% snapshot orders_snapshot %}

{{
    config(
      target_database='DBT_RAW',
      target_schema='DBT_SJ',
      unique_key='id',
      strategy='timestamp',
      updated_at='LOAD_DATE',
    )
}}

select * from {{ ref('raw_orders') }}

{% endsnapshot %}