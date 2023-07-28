
    
    

select
    id as unique_field,
    count(*) as n_records

from ANALYTICS.DBT_NDW.distinct_num_bedrooms_per_iteration
where id is not null
group by id
having count(*) > 1


