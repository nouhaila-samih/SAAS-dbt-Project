select
    payment_id,
    customer_id,
    payment_date,
    amount,
    status
from {{source('raw','PAYMENTS')}}