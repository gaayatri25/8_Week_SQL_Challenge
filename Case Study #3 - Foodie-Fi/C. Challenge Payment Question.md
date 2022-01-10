## 🎯 SOLUTION

The Foodie-Fi team wants you to create a new ``payments`` table for the year 2020 that includes amounts paid by each customer in the ``subscriptions`` table with the following requirements:

- monthly payments always occur on the same day of month as the original start_date of any monthly paid plan
- upgrades from basic to monthly or pro plans are reduced by the current paid amount in that month and start immediately
- upgrades from pro monthly to pro annual are paid at the end of the current billing period and also starts at the end of the month period
- once a customer churns they will no longer make payments

``Answer:``

1. Create table ``payments`` :

``` MYSQL
CREATE TABLE payments
AS ( SELECT s.customer_id, s.plan_id, p.plan_name, s.start_date AS payment_date, p.price AS amount, 
ROW_NUMBER() OVER(PARTITION BY customer_id ) AS payment_order
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id
WHERE s.plan_id NOT IN (0,4))
```

2. Select from table ``payments``  :

``` MYSQL
SELECT *
FROM payments
```

<img src="https://user-images.githubusercontent.com/49824841/148819455-c66df529-c54f-4ce9-88bf-ca1e2acd7d05.png" width="350" height="350">
