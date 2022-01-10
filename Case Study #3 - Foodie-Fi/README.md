# [🥑 8 Week SQL Challenge](https://github.com/gayatriayu/8_Week_SQL_Challenge)


<img src="https://user-images.githubusercontent.com/49824841/148691830-bd82ed17-c644-44da-8a32-2b05e2df0aa6.png" width="450" height="450">

## 📄 Table of Contents
- Introduction
- Dataset
- Entity Relationship Diagram
- Case Study Questions
- Solution
  - A. Customer Journey
  - B. Data Analysis Questions
  - C. Challenge Payment Question

----------

## Introduction
Danny and his friends launched a new startup Foodie-Fi in 2020 and started selling monthly and annual subscriptions, giving their customers unlimited on-demand access to exclusive food videos from around the world.

This case study focuses on using subscription style digital data to answer important business questions.

## Dataset
Danny has shared the data design for Foodie-Fi.

All datasets exist within the **foodie_fi** database schema, foodie_fi has 2 tables, plans and subscriptions.

Tabel 1: **`plans`**

<img src="https://user-images.githubusercontent.com/49824841/148728502-f5fd1323-813d-419d-b58d-a53f2ff0d221.png" width="200" height="150">

Customers can choose which plans to join Foodie-Fi when they first sign up.
- **Trial**: Customers can sign up to an initial 7 day free trial, customers will automatically continue with the pro monthly subscription plan unless they cancel, downgrade to basic or upgrade to an annual pro plan at any point during the trial.
- **Basic plan**: Customers have limited access and can only stream their videos and is only available monthly at $9.90.
- **Pro plan**: Customers have no watch time limits and are able to download videos for offline viewing. Pro plans start at $19.90 a month or $199 for an annual subscription.

When customers cancel their Foodie-Fi service, they will have a `churn` plan record with a `null` price but their plan will continue until the end of the billing period.

Tabel 2: **`subscriptions`**

<img src="https://user-images.githubusercontent.com/49824841/148743395-f888fc47-2f1c-4631-9956-f9f1f8f12e3b.png" width="250" height="600">

Customer subscriptions show the exact date where their specific `plan_id` starts.

If customers downgrade from a pro plan or cancel their subscription - the higher plan will remain in place until the period is over - the `start_date` in the `subscriptions` table will reflect the date that the actual plan changes.

When customers upgrade their account from a basic plan to a pro or annual pro plan - the higher plan will take effect straightaway.

When customers churn - they will keep their access until the end of their current billing period but the `start_date` will be technically the day they decided to cancel their service.

## Entity Relationship Diagram

<img src="https://user-images.githubusercontent.com/49824841/148730800-a9257a2f-b98e-43cb-9396-9c7b10138d85.png" width="550" height="250">

## Case Study Questions

## **A. Customer Journey**

here's my [solution](https://github.com/gayatriayu/8_Week_SQL_Challenge/blob/main/Case%20Study%20%233%20-%20Foodie-Fi/A.%20Customer%20Journey.md)

Based off the 8 sample customers provided in the sample from the subscriptions table, write a brief description about each customer’s onboarding journey.

## **B. Data Analysis Questions**

here's my [solution](https://github.com/gayatriayu/8_Week_SQL_Challenge/blob/main/Case%20Study%20%233%20-%20Foodie-Fi/B.%20Data%20Analysis%20Questions.md)

1. How many customers has Foodie-Fi ever had?
2. What is the monthly distribution of `trial` plan `start_date` values for our dataset - use the start of the month as the group by value
3. What plan `start_date` values occur after the year 2020 for our dataset? Show the breakdown by count of events for each `plan_name`
4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
5. How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?
6. What is the number and percentage of customer plans after their initial free trial?
7. What is the customer count and percentage breakdown of all 5 `plan_name` values at `2020-12-31`?
8. How many customers have upgraded to an annual plan in 2020?
9. How many days on average does it take for a customer to an annual plan from the day they join Foodie-Fi?
10. Can you further breakdown this average value into 30 day periods (i.e. 0-30 days, 31-60 days etc)
11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?

## **C. Challenge Payment Question**

here's my [solution](https://github.com/gayatriayu/8_Week_SQL_Challenge/blob/main/Case%20Study%20%233%20-%20Foodie-Fi/C.%20Challenge%20Payment%20Question.md)

The Foodie-Fi team wants you to create a new `payments` table for the year 2020 that includes amounts paid by each customer in the `subscriptions` table with the following requirements:

- monthly payments always occur on the same day of month as the original start_date of any monthly paid plan
- upgrades from basic to monthly or pro plans are reduced by the current paid amount in that month and start immediately
- upgrades from pro monthly to pro annual are paid at the end of the current billing period and also starts at the end of the month period
- once a customer churns they will no longer make payments

Example outputs for this table might look like the following:

<img src="https://user-images.githubusercontent.com/49824841/148735281-6c0bb26a-0220-4d2b-9786-2d6a1f50479e.png" width="550" height="550">


