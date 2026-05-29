with calculated_events as (
    select
        c.customer_id,
        count(e.event_id) as total_events,
        min(e.event_date) as first_event_date,
        max(e.event_date) as last_event_date,
        datediff(
            'day',
            max(e.event_date),
            current_date
        ) as days_since_last_event

    from {{ ref('stg_customers') }} c
        left join {{ ref('stg_events') }} e
        on c.customer_id = e.customer_id

    group by c.customer_id
),
customer_events as (

    select *, 


        case
            when last_event_date is null then 'Never active'
            when days_since_last_event <= 30 then 'Active'
            when days_since_last_event <= 90 then 'At Risk'
            else 'Churned'
        end as lifecycle_stage

    from calculated_events

),

total_amount as (

    select
        customer_id,
        sum(amount) as total_payments
    from {{ ref('stg_payments') }}
    group by customer_id
)

select
    c.*,
    t.total_payments
from customer_events c
left join total_amount t
    on c.customer_id = t.customer_id