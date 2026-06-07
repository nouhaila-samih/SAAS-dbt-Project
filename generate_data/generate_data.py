import pandas as pd
import random
from faker import Faker
from datetime import datetime, timedelta


fake = Faker()

# -------------------------
# CONFIG
# -------------------------
NUM_CUSTOMERS = 2000

plans = {
    "Free": 0,
    "Pro": 30,
    "Business": 100
}

channels = ["Google", "LinkedIn", "Referral", "Direct", "Twitter"]
countries = ["Morocco", "France", "Spain", "USA", "Germany"]

event_types = ["login", "create_project", "export", "invite_user", "delete_project"]

# -------------------------
# 1. CUSTOMERS
# -------------------------
customers = []

for i in range(NUM_CUSTOMERS):
    signup_date = fake.date_between(start_date='-2y', end_date='-3m')

    plan = random.choices(
        list(plans.keys()),
        weights=[0.5, 0.35, 0.15]
    )[0]

    customers.append({
        "customer_id": f"C{i+1}",
        "signup_date": signup_date,
        "country": random.choice(countries),
        "plan": plan,
        "acquisition_channel": random.choice(channels)
    })

df_customers = pd.DataFrame(customers)

# -------------------------
# 2. SUBSCRIPTIONS
# -------------------------
subscriptions = []

for c in customers:
    start_date = c["signup_date"]

    churn_prob = {
        "Free": 0.6,
        "Pro": 0.3,
        "Business": 0.1
    }[c["plan"]]

    is_churned = random.random() < churn_prob

    if is_churned:
        end_date = start_date + timedelta(days=random.randint(30, 400))
        status = "cancelled"
    else:
        end_date = None
        status = "active"

    subscriptions.append({
        "subscription_id": f"S{c['customer_id'][1:]}",
        "customer_id": c["customer_id"],
        "start_date": start_date,
        "end_date": end_date,
        "status": status,
        "monthly_price": plans[c["plan"]]
    })

df_subscriptions = pd.DataFrame(subscriptions)

# -------------------------
# 3. EVENTS (USAGE)
# -------------------------
events = []
event_id = 1

for c in customers:
    num_events = random.randint(5, 50)
    base_date = fake.date_between(start_date=c["signup_date"], end_date='today')

    for _ in range(num_events):
        events.append({
            "event_id": f"E{event_id}",
            "customer_id": c["customer_id"],
            "event_type": random.choice(event_types),
            "event_date": base_date + timedelta(days=random.randint(0, 365))
        })
        event_id += 1

df_events = pd.DataFrame(events)

# -------------------------
# 4. PAYMENTS
# -------------------------
payments = []
payment_id = 1

for sub in subscriptions:
    if sub["status"] == "active":
        num_payments = 12
    else:
        num_payments = random.randint(1, 8)

    for i in range(num_payments):
        payments.append({
            "payment_id": f"P{payment_id}",
            "customer_id": sub["customer_id"],
            "payment_date": sub["start_date"] + timedelta(days=30*i),
            "amount": sub["monthly_price"],
            "status": "paid"
        })
        payment_id += 1

df_payments = pd.DataFrame(payments)

# -------------------------
# EXPORT CSV
# -------------------------
df_customers.to_csv("customers.csv", index=False)
df_subscriptions.to_csv("subscriptions.csv", index=False)
df_events.to_csv("events.csv", index=False)
df_payments.to_csv("payments.csv", index=False)

print("Dataset generated successfully!")