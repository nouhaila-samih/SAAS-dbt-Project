with date_spine as (

    select dateadd(day, seq4(), '2023-01-01') as date_day
    from table(generator(rowcount => 2000))

)

select
    date_day as date,
    year(date_day) as year,
    month(date_day) as month,
    week(date_day) as week,
    quarter(date_day) as quarter,
    dayname(date_day) as day_name

from date_spine