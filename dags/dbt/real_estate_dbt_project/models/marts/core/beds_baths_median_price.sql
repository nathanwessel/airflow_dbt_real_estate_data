with listings as (
    select * from {{ ref('stg_property_sale_listings') }}
),

final as (
    /* for this number of beds/baths and iteration_date,
    show the median price */
    select distinct 
        -- create a primary key for this model
        md5(
            coalesce(num_bedrooms, 0) ||
            coalesce(num_bathrooms, 0) ||
            coalesce(iteration_date::varchar, '') 
        ) as id,
        
        num_bedrooms, 
        num_bathrooms, 
        iteration_date, 
    
        median(price) as median_price
    
    from listings
    group by num_bedrooms, num_bathrooms, iteration_date
    order by num_bedrooms asc, num_bathrooms asc, iteration_date asc
)

select * from final