select 
    event_id,
    customer_id,
    event_type,
    event_date
from {{source('raw','EVENTS')}}