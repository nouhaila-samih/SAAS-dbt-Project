select 
    subscription_id,
    customer_id,
    start_date,
    end_date,
    status,
    monthly_price
from {{source('raw','SUBSCRIPTIONS')}}