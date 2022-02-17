{{ config(materialized='table') }}

select * from "DBT_RAW"."JAFFLE_SHOP"."CUSTOMERS"