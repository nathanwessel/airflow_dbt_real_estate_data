select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select iteration_date
from ANALYTICS.DBT_NDW.distinct_num_baths_per_iteration
where iteration_date is null



      
    ) dbt_internal_test