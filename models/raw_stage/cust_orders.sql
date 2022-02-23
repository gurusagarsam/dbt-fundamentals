{{
    config(
        materialized='table'
    )
}}

select DISTINCT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,USER_ID AS CUSTOMER_ID,b.ID as ORDER_ID,ORDER_DATE,b.STATUS as ORDER_STATUS,PAYMENTMETHOD, AMOUNT,c.STATUS as PAYMENT_STATUS
from    {{ref('j_customers')}} as a, 
        {{ref('j_orders')}} as b,
        {{ ref('j_payments') }} as c
where a.id = b.user_id
  and c.orderid = b.id
order by ORDER_DATE desc