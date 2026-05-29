// Exploration initiale
select * from saas_db.raw.subscriptions limit 20;
select * from saas_db.raw.customers limit 20;
select * from saas_db.raw.events limit 20;
select * from saas_db.raw.payments limit 20;

update saas_db.raw.events
set 

select count(*), count(distinct payment_id) as nn from saas_db.raw.payments;

select distinct plan from saas_db.raw.customers;


select
    plan,
    count(*) as nb
from saas_db.raw.customers
group by 1
order by 2 desc;

// staging

select distinct customer_id from saas_db.raw.customers order by customer_id desc limit 1;


drop view saas_db.RAW.stg_subscriptions;
drop schema saas_db.raw_staging;

create schema saas_db.intermediate;

// intermediate
use database saas_db;
use schema staging;
//select count( distinct c.customer_id) as churned from stg_customers c left join stg_subscriptions s on c.customer_id=s.customer_id where s.end_date is null;
// 1184
//select count( distinct c.customer_id) as not_churned from stg_customers c left join stg_subscriptions s on c.customer_id=s.customer_id where s.end_date is not null;
//816
select count(*) from stg_subscriptions;

use database saas_db;
use schema staging;

select c.plan, s.monthly_price from stg_customers c join stg_subscriptions s on c.customer_id=s.customer_id;


select distinct monthly_price from stg_subscriptions;


use database saas_db;
use schema staging;
select count(*) from ( select c.signup_date as signn , s.start_date as startt from stg_customers c join stg_subscriptions s on c.customer_id=s.customer_id where signn=startt) t;


use database saas_db;
use schema staging;

select distinct amount from stg_payments;

drop schema saas_db.intermediate;

select event_date from saas_db.staging.stg_events where event_date > current_date();

select * from saas_db.marts.dim_customers;
select * from saas_db.marts.fct_customer_activity;
select * from saas_db.marts.fct_payments;
select * from saas_db.marts.fct_subscriptions;


