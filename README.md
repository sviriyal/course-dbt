## Week 1 Project

Question 1: How many users do we have?

130

```sql
select count(distinct user_id) from SVIRIYALAHEALTHJOYCOM.STG_POSTGRES_USERS;
```

Question 2: On average, how many orders do we receive per hour?

7.5

```sql
with hourly_orders as (
    select
        date(created_at) as order_date,
        hour(created_at) as hour_of_order,
        count(distinct order_id) as order_count
    from SVIRIYALAHEALTHJOYCOM.STG_POSTGRES_ORDERS
    group by 1, 2
)

select avg(order_count) from hourly_orders
```
Question 3: On average, how long does an order take from being placed to being delivered?

3.89 days on average from order placement to delivery

```sql
select avg(datediff(day,created_at,delivered_at)) as AVG_Fulfillment
from SVIRIYALAHEALTHJOYCOM.STG_POSTGRES_ORDERS
```
Question 4: How many users have only made one purchase? Two purchases? Three+ purchases?

ORDER_COUNT	
1 order - 25 Users
2 orders -	28 Users
3+ orders -	71 Users

```sql
with user_order_count as (

select user_id, count(*) as order_count
from SVIRIYALAHEALTHJOYCOM.STG_POSTGRES_ORDERS
group by 1

)

select '1 order' as Order_Count, count(distinct user_id) as Users
from user_order_count
where order_count = 1

union all

select '2 orders', count(distinct user_id)
from user_order_count
where order_count = 2

union all

select '3+ orders', count(distinct user_id)
from user_order_count
where order_count >= 3
```
Question 5: On average, how many unique sessions do we have per hour?

16.3 sessions on average per hour

```sql
with hourly_sessions as (
    select
        date(created_at) as session_date,
        hour(created_at) as hour_of_session,
        count(distinct session_id) as session_count
    from SVIRIYALAHEALTHJOYCOM.STG_POSTGRES_EVENTS
    group by 1, 2
)

select avg(session_count) from hourly_sessions
```

> Please note that this sets some environment variables so if you create some new terminals please load them again.

## License
GPL-3.0
