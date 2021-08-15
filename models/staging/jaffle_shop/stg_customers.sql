with customers as (
    select 
      id as customer_id,
      first_name,
      last_name
    from "RAW"."JAFFLE_SHOP"."CUSTOMERS"
  
 )
 select * from customers