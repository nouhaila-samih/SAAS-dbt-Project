CREATE TABLE saas_db.raw.customers (
    customer_id STRING,
    signup_date DATE,
    country STRING,
    plan STRING,
    acquisition_channel STRING
);

CREATE TABLE saas_db.raw.subscriptions (
    subscription_id STRING,
    customer_id STRING,
    start_date DATE,
    end_date DATE,
    status STRING,
    monthly_price NUMBER
);

CREATE TABLE saas_db.raw.events (
    event_id STRING,
    customer_id STRING,
    event_type STRING,
    event_date DATE
);

CREATE TABLE saas_db.raw.payments (
    payment_id STRING,
    customer_id STRING,
    payment_date DATE,
    amount NUMBER,
    status STRING
);