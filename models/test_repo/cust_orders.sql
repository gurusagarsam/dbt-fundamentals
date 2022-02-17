select first_name || ' ' || last_name as full_name
from {{ref('j_customers')}} as a, {{ref('j_orders')}} as b
where a.id = b.user_id