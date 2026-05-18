{{config(
    materialized='view'
)}}


select
    p.customer_id,
    p.payment_id,
    p.payment_date,
    date_trunc('month', p.payment_date) as payment_month,
    p.amount,
    c.plan
from {{ ref('stg_payments') }} p
join {{ ref('stg_customers') }} c
    on p.customer_id = c.customer_id