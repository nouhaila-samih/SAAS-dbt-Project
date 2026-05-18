
{{config(
    materialized='view'
)}}


select
    customer_id,
    count(event_id) as total_events,
    min(event_date) as first_event_date,
    max(event_date) as last_event_date,
    datediff('day', max(event_date), current_date) as days_since_last_event
from {{ ref('stg_events') }}
group by customer_id