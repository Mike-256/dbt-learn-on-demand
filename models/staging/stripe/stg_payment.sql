with pay as (
    select 
        ID as payment_id,
        ORDERID as order_id,
        STATUS as payment_status,
        paymentmethod as payment_method,
        amount / 100 as amount,
        created as created_at
    from "RAW"."STRIPE"."PAYMENT"
)
select * from pay