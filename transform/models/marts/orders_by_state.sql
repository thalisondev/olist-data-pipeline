with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

joined as (
    select
        c.customer_state,
        count(o.order_id) as total_orders,
        count(case when o.order_status = 'delivered' then 1 end) as delivered_orders,
        round(
            avg(
                extract(epoch from (o.delivered_at - o.purchased_at)) / 86400
            )::numeric, 2
        ) as avg_delivery_days
    from orders o
    left join customers c on o.customer_id = c.customer_id
    where o.delivered_at is not null
    group by c.customer_state
    order by total_orders desc
)

select * from joined