{{ config(
    materialized="table"
)}}
 
with customers as (
  select * from {{ref('stg_customers')}}
),

orders as (
   select * from {{ref('stg_orders')}}
),

 Customer_orders as (
   
   select 
     Customer_id,
     min(order_date) as first_order_date,
     max(order_date) as most_recent_order_date,
     count(order_id) as number_of_orders
   
   from orders
    group by 1
   
 ),
 
 final as (
    select 
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        Customer_orders.first_order_date,
        Customer_orders.most_recent_order_date,
        coalesce(Customer_orders.number_of_orders, 0) as  number_of_orders
   from Customers
   left join customer_orders using (customer_id)
   
)
select * from final
