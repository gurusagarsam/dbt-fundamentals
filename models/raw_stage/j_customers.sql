{{ config(materialized='table') }}

select DISTINCT * from {{source('cust_orders','CUSTOMERS')}}