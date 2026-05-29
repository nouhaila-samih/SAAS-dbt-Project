select 
    customer_id,
    signup_date,
    country,
    plan,
    acquisition_channel,
    datediff('day', signup_date, current_date) as days_since_signup,
    case
        when plan = 'Pro' or plan = 'Business' then 'Paid'
        else 'Free'
    end as customer_type,

from {{ref('stg_customers')}}
