{{
    config(
        materialized='table'
    )
}}
select * from {{ source('payments', 'PAYMENT') }}