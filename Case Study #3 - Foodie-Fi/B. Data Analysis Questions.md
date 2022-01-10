## 🎯 SOLUTION

## B. Data Analysis Questions

#### 1. How many customers has Foodie-Fi ever had?

``Answer:``

``` MYSQL
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM subscriptions
```
<img src="https://user-images.githubusercontent.com/49824841/148810466-65c7406b-5139-45b0-b514-65768698764e.png" width="150" height="80">

#### 2. What is the monthly distribution of ``trial`` plan ``start_date`` values for our dataset - use the start of the month as the group by value

``Answer:``

``` MYSQL
SELECT MONTH(start_date) AS month_date, MONTHNAME(start_date) AS months, COUNT(*) AS count
FROM subscriptions
WHERE plan_id=0
GROUP BY months, month_date
ORDER BY FIELD(months,'January','February','March','April','May',
				'June','July','August','September','October','November','December');
```

<img src="https://user-images.githubusercontent.com/49824841/148811332-75ace994-025f-46f7-8009-c7273b74fd97.png" width="200" height="250">

#### 3. What plan ``start_date`` values occur after the year 2020 for our dataset? Show the breakdown by count of events for each ``plan_name``

``Answer:``

```MYSQL
SELECT plan_id, COUNT(*) AS events_2020
FROM subscriptions
WHERE EXTRACT(YEAR FROM start_date) >= '2020'
GROUP BY plan_id
ORDER BY plan_id
```

<img src="https://user-images.githubusercontent.com/49824841/148811855-6be3acc1-25ca-41a4-b3f6-edcc235f6496.png" width="150" height="150">

#### 4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place?

``Answer:``

- Find the number of customers who churned.
- Find the percentage of customers who churned and round it to 1 decimal place.

``` MYSQL
SELECT COUNT(*) AS churn_count, ROUND(COUNT(*) / 10, 1) AS churn_percentage
FROM subscriptions 
WHERE plan_id = 4
```

<img src="https://user-images.githubusercontent.com/49824841/148815279-e0ece226-5699-48d4-8026-e08f2952db80.png" width="200" height="50">

#### 8. How many customers have upgraded to an annual plan in 2020?

``Answer:``

``` MYSQL
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM subscriptions
WHERE plan_id = 3 AND EXTRACT( YEAR from start_date) = '2020'
```

<img src="https://user-images.githubusercontent.com/49824841/148815993-f6f29863-0501-4bb4-99fd-eb248a423428.png" width="100" height="50">

#### 11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?

``Answer:``

``` MYSQL
WITH nextplan_cte AS ( SELECT * ,
    LEAD(plan_id, 1) 
    OVER(PARTITION BY customer_id 
	ORDER BY plan_id) AS next_plan
  FROM subscriptions)

SELECT 
  COUNT(*) AS customers_downgraded
FROM nextplan_cte
WHERE EXTRACT(YEAR from start_date) = '2020'
  AND plan_id = 2 
  AND next_plan = 1;
```

<img src="https://user-images.githubusercontent.com/49824841/148816455-c0d91e4c-167f-40a4-9896-bcd9fc15ef5a.png" width="100" height="50">
