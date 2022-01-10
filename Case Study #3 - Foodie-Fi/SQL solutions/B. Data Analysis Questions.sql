-- B. Data Analysis Questions

-- 1
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM subscriptions

-- 2
SELECT MONTH(start_date) AS month_date, MONTHNAME(start_date) AS months, COUNT(*) AS count
FROM subscriptions
WHERE plan_id=0
GROUP BY months, month_date
ORDER BY FIELD(months,'January','February','March','April','May',
				'June','July','August','September','October','November','December');
                
-- 3
SELECT plan_id, COUNT(*) AS events_2020
FROM subscriptions
WHERE EXTRACT(YEAR FROM start_date) >= '2020'
GROUP BY plan_id
ORDER BY plan_id

-- 4
SELECT COUNT(*) AS churn_count, ROUND(COUNT(*) / 10, 1) AS churn_percentage
FROM subscriptions 
WHERE plan_id = 4

-- 8
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM subscriptions
WHERE plan_id = 3 AND EXTRACT( YEAR from start_date) = '2020'

-- 11
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
 