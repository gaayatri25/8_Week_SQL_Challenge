## 🎯 SOLUTION

## A. Customer Journey

Based off the 8 sample customers provided in the sample from the `subscriptions` table, write a brief description about each customer’s onboarding journey.

<img src="https://user-images.githubusercontent.com/49824841/148743395-f888fc47-2f1c-4631-9956-f9f1f8f12e3b.png" width="250" height="600">

**`Answer:`**

``` MYSQL
SELECT s.customer_id, s.plan_id, p.plan_name, s.start_date
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id
WHERE s.customer_id IN (1,2,11,13,15,16,18,19)
```

<img src="https://user-images.githubusercontent.com/49824841/148752464-a3d24841-ad47-4e2e-86d5-88e86460888e.png" width="400" height="550">

I'll choose 3 customers and write about their onboarding journey:

`customer 1`

<img src="https://user-images.githubusercontent.com/49824841/148754986-534183b1-0e0a-4616-8bc3-449588c9b473.png" width="400" height="100">

- Customer 1 started the free trial on 1 Aug 2020.
- Customer 1 then subscribed to the basic monthly plan on 8 Aug 2020 after the 7-days trial has ended.

`customer 6`

<img src="https://user-images.githubusercontent.com/49824841/148755729-a9029456-d5e0-4ae0-9b28-0d3df16dc687.png" width="400" height="100">

- Customer 11 started the free trial on 19 Nov 2020.
- The customer terminated subscription after free trial and churned on 26 Nov 2020 until the paid subscription ended.

`customer 16`

<img src="https://user-images.githubusercontent.com/49824841/148797996-2ef07677-f9cb-4ed3-8b09-74edca0078e9.png" width="400" height="100">

- Customer 16 started the free trial on 31 May 2020
- Customer 16 then subscribed to basic monthly on 7 June 2020
- Customer 16 then upgraded to pro annual on 21 Oct 2020

----------

here's my solution for [B. Data Analysis Questions](https://github.com/gayatriayu/8_Week_SQL_Challenge/blob/main/Case%20Study%20%233%20-%20Foodie-Fi/B.%20Data%20Analysis%20Questions.md)✨









