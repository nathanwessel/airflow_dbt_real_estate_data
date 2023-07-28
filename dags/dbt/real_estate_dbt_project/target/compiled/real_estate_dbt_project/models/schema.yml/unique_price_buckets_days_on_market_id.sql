
    
    

select
    id as unique_field,
    count(*) as n_records

from ANALYTICS.DBT_NDW.price_buckets_days_on_market
where id is not null
group by id
having count(*) > 1


