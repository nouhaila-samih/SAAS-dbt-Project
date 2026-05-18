select
    customer_id,
    signup_date,
    country,
    plan,
    acquisition_channel
from {{source('raw','CUSTOMERS')}}