
  create or replace   view ANALYTICS.DBT_NDW.price_buckets_days_on_market
  
   as (
    with listings as (

    select * from ANALYTICS.DBT_NDW.stg_property_sale_listings

),

price_buckets as (
    /* for this iteration_date, show the avg number of days on the market 
    per (pre-defined) price range */
    select distinct
        iteration_date, 
        case
            when price < 200000 then 'price_below_200000'
            when price between 200000 and 230000 then '01_price_in_low_200s'
            when price between 230001 and 250000 then '02_price_between_230001_250000'
            when price between 250001 and 260000 then '03_price_in_250s'
            when price between 260001 and 270000 then '04_price_in_260s'
            when price between 270001 and 280000 then '05_price_in_270s'
            when price between 280001 and 290000 then '06_price_in_280s'
            when price between 290001 and 300000 then '07_price_in_280s'
            when price between 300001 and 310000 then '08_price_in_300-310s'
            when price between 310001 and 310000 then '09_price_in_310s'
            ELSE 'price_above_310'
        end as price_bucket,
        
        round(avg(days_on_market), 2) as avg_days_on_market
    
    from listings
    group by iteration_date, price_bucket
),

final as (
    -- create a primary key for this model
    select 
        md5(            
            coalesce(iteration_date::varchar, '') ||
            coalesce(price_bucket::varchar, '')
        ) as id,

        iteration_date,
        price_bucket,
        avg_days_on_market
    from price_buckets
    order by iteration_date asc, price_bucket asc
)

select * from final
  );

