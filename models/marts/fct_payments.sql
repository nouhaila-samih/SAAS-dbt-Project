select
    payment_id,
    customer_id,
    payment_date,
    date_trunc('month', p.payment_date) as payment_month,
    amount,
from {{ ref('stg_payments') }} p