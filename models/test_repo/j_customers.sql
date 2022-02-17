{{ config(materialized='table') }}

select * from {{source('cust_orders','CUSTOMERS')}}