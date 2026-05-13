with items as (
    select * from {{ ref('stg_order_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

sellers as (
    select * from raw.sellers
),

joined as (
    select
        s.seller_id,
        s.seller_city,
        s.seller_state,
        count(distinct i.order_id) as total_orders,
        round(sum(i.price)::numeric, 2) as total_revenue,
        round(avg(i.price)::numeric, 2) as avg_price
    from items i
    left join orders o on i.order_id = o.order_id
    left join sellers s on i.seller_id = s.seller_id
    where o.order_status = 'delivered'
    group by s.seller_id, s.seller_city, s.seller_state
    order by total_revenue desc
)

select * from joined
