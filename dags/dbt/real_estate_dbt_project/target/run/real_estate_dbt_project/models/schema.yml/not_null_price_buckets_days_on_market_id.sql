select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id
from ANALYTICS.DBT_NDW.price_buckets_days_on_market
where id is null



      
    ) dbt_internal_test