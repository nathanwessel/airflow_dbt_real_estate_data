
    
    

select
    addr_iteration_date_id as unique_field,
    count(*) as n_records

from ANALYTICS.DBT_NDW.stg_property_sale_listings
where addr_iteration_date_id is not null
group by addr_iteration_date_id
having count(*) > 1


