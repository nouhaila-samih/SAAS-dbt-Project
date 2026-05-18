{{config(
    materialized='view'
)}}


select 
    c.customer_id,
    c.signup_date,
    c.country,
    c.plan,
    s.monthly_price,
    s.subscription_id,
    s.start_date,
    s.end_date,
    datediff('month',s.start_date,coalesce(s.end_date,current_date)) as sub_duration_months,
    case 
        when s.end_date is null then 1
        else 0
    end as is_active
    from {{ref('stg_customers')}} c 
    left join {{ref('stg_subscriptions')}} s
    on c.customer_id = s.customer_id
