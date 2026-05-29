create DATABASE saas_db;


create SCHEMA saas_db.raw;

create WAREHOUSE saas_wh
with WAREHOUSE_SIZE = 'SMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE ;