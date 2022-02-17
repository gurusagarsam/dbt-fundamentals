
-- Use the `ref` function to select from other models

select *
from {{ ref('j_customers') }}
where id = 1