select amt from {{ ref('cust_orders') }} 
where amt < 0