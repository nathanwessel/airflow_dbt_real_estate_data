with listings as (
    select * from ANALYTICS.DBT_NDW.stg_property_sale_listings
),

final as (
    /* for this iteration_date, 
    show the count of each distinct number of bathrooms */
    select distinct 
         -- create a primary key for this model
        md5(
            coalesce(iteration_date::varchar, '') ||
            coalesce(num_bathrooms, 0)
        ) as id,

        iteration_date, 
        num_bathrooms, 
        
        count(*) as count
    
    from listings
    group by iteration_date, num_bathrooms
    order by iteration_date asc, num_bathrooms asc
)

select * from final