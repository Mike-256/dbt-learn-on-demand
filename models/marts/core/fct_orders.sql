
with orders as (
  select * from {{ref('stg_orders')}}
),

payment as (
   select * from {{ref('stg_payment')}}
),

Customer_pay as (  
   
    select 
        orders.order_id,
        orders.customer_id,
        payment.amount,        
   from Customers
   left join payment using (order_id)
   
)
select * from Customer_pay