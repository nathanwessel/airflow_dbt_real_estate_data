select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id
from ANALYTICS.DBT_NDW.beds_baths_median_price
where id is null



      
    ) dbt_internal_test