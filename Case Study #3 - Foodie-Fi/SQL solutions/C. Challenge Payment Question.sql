
CREATE TABLE payments
AS ( SELECT s.customer_id, s.plan_id, p.plan_name, s.start_date AS payment_date, p.price AS amount, 
ROW_NUMBER() OVER(PARTITION BY customer_id ) AS payment_order
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id
WHERE s.plan_id NOT IN (0,4))



