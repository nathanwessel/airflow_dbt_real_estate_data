select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select _AIRBYTE_EMITTED_AT
from raw.realty_mole_property_api.property_sale_listings
where _AIRBYTE_EMITTED_AT is null



      
    ) dbt_internal_test