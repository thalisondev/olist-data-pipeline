with items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from raw.products
),

translation as (
    select * from raw.category_translation
),

joined as (
    select
        coalesce(t.product_category_name_english, p.product_category_name, 'unknown') as category,
        count(distinct i.order_id) as total_orders,
        round(sum(i.price)::numeric, 2) as total_revenue,
        round(avg(i.price)::numeric, 2) as avg_price
    from items i
    left join products p on i.product_id = p.product_id
    left join translation t on p.product_category_name = t.product_category_name
    group by category
    order by total_revenue desc
)

select * from joined