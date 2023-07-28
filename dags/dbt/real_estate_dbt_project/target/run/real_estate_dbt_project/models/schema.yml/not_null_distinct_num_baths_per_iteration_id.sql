select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id
from ANALYTICS.DBT_NDW.distinct_num_baths_per_iteration
where id is null



      
    ) dbt_internal_test