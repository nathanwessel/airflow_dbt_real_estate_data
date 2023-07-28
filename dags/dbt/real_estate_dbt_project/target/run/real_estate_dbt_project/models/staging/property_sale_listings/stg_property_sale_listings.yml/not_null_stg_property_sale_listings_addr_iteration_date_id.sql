select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select addr_iteration_date_id
from ANALYTICS.DBT_NDW.stg_property_sale_listings
where addr_iteration_date_id is null



      
    ) dbt_internal_test