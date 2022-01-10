SELECT s.customer_id, s.plan_id, p.plan_name, s.start_date
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id
WHERE s.customer_id IN (1,2,11,13,15,16,18,19)

