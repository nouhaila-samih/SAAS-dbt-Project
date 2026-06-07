# Saas Customer Analytics Pipeline

## Project Overview

This project simulates a SaaS analytics environment using synthetic customer subscription and product usage data.

The goal is to build a modern analytics engineering pipeline using Snowflake and dbt to model business KPIs such as:

- Customer lifecycle stage [Never active, active, at risk, churned]
- Subscription duration
- Product Usage Activity
- Revenue per customer

The project follows a layered dbt architecture with staging and marts models.

## Business Context

The fictional company "NexaFlow" is a SaaS platform that provides productivity and analytics tools to customers through subscription plans.

Users can:
- Subscribe to different pricing plans
- Log into the platform
- Create projects
- Export reports
- Invite team members

The analytics team wants to track customer behavior, subscription retention, and revenue performance.

## Tech Stack

- Snowflake (Data Warehouse)
- dbt (Data Transformation)
- Python (Synthetic Data Generation)

## Data Model

### Raw Layer
- customers
- subscriptions
- events
- payments

### Staging Layer
- stg_customers
- stg_subscriptions
- stg_events
- stg_payments

### Mart Layer

#### Dimension Tables
- dim_customers

#### Fact Tables
- fct_customer_activity
- fct_payments
- fct_subscriptions

## dbt Features

The project includes:
- Modular staging and marts layers
- dbt tests
- dbt documentation
- Source references
- Macros and customised tests
- Reusable transformations
- SQL scripting
- Layered analytics modeling

## How to Run

### 1. Upload CSV files to Snowflake
Load raw data into Snowflake raw tables.

### 2. Run dbt models and docs

```bash
dbt run

dbt test

dbt docs generate

dbt docs serve

```

## Future Improvements

- Add cohort retention analysis
- Add incremental dbt models
- Add BI dashboard integration
- Simulate more realistic user behavior