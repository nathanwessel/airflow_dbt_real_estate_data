select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select _AIRBYTE_PROPERTY_SALE_LISTINGS_HASHID
from raw.realty_mole_property_api.property_sale_listings
where _AIRBYTE_PROPERTY_SALE_LISTINGS_HASHID is null



      
    ) dbt_internal_test