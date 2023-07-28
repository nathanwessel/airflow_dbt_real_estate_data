
    
    

select
    id as unique_field,
    count(*) as n_records

from ANALYTICS.DBT_NDW.beds_baths_median_price
where id is not null
group by id
having count(*) > 1


