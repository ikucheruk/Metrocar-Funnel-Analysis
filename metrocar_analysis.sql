
-- METROCAR ANALYTICS PROJECT
-- Author: IRYNA KUCHERUK
-- Database: PostgreSQL
-- Description: SQL queries used for user funnel, cancellation, and platform performance analysis.


-- User Funnel (based on aggregated data from funnel_analysis)

SELECT
funnel_step, funnel_name,
SUM(number_of_users) AS total_users
FROM funnel_analysis
GROUP BY funnel_step, funnel_name
ORDER BY funnel_step;


-- Drop-off by Hour of Day: Ride Request Cancellations

SELECT
EXTRACT(HOUR FROM request_ts) AS hour,
 	COUNT(*) AS total_requests,
 	SUM(CASE WHEN cancel_ts IS NOT NULL THEN 1 ELSE 0 END) AS cancelled_requests,
 	SUM(CASE WHEN dropoff_ts IS NOT NULL THEN 1 ELSE 0 END) AS completed_requests
FROM ride_requests
GROUP BY EXTRACT(HOUR FROM request_ts)
ORDER BY hour;


-- Drop-off by Day of Week: Ride Request Cancellations

SELECT
 TO_CHAR(request_ts, 'Day') AS day_of_week,
 EXTRACT(DOW FROM request_ts) AS day_num,
 COUNT(*) AS total_requests,
 SUM(CASE WHEN cancel_ts IS NOT NULL THEN 1 ELSE 0 END) AS cancelled_requests,
 SUM(CASE WHEN dropoff_ts IS NOT NULL THEN 1 ELSE 0 END) AS completed_requests
FROM ride_requests
GROUP BY day_of_week, day_num
ORDER BY day_num;


-- Who Cancels Rides More Often — Drivers or Passengers?

SELECT
CASE
  WHEN cancel_ts IS NOT NULL AND accept_ts IS NULL THEN 'User_cancelled_before_accept'
  WHEN cancel_ts IS NOT NULL AND accept_ts IS NOT NULL THEN 'Driver_cancelled_after_accept'
  ELSE 'Completed_or_NotCancelled'
END AS cancel_reason,
COUNT(*) AS count_requests
FROM ride_requests
GROUP BY cancel_reason;


-- Waiting Time for Completed Rides

SELECT
ride_id,
request_ts,
accept_ts,
EXTRACT(EPOCH FROM (accept_ts - request_ts)) / 60 AS wait_time_min
FROM ride_requests
WHERE accept_ts IS NOT NULL
AND cancel_ts IS NULL
LIMIT 1000;


-- Time Until Cancellation by User

SELECT
 ride_id,
 request_ts,
 cancel_ts,
 EXTRACT(EPOCH FROM (cancel_ts - request_ts)) / 60 AS wait_time_min
FROM ride_requests
WHERE cancel_ts IS NOT NULL
 AND accept_ts IS NULL
LIMIT 1000;


-- Time Until Cancellation by Driver

SELECT
 ride_id,
 request_ts,
 accept_ts,
 EXTRACT(EPOCH FROM (accept_ts - request_ts)) / 60 AS wait_time_min
FROM ride_requests
WHERE cancel_ts IS NOT NULL
 AND accept_ts IS NOT NULL
LIMIT 1000;


-- Platform Efficiency: Number of Downloads

SELECT platform,
COUNT(*) as downloads
FROM app_downloads ad
GROUP BY platform;


-- Platform Efficiency: Number of Users and Rides

SELECT
platform,
SUM(number_of_users) AS users,
SUM(number_of_rides) AS rides
FROM funnel_analysis
GROUP BY platform;


-- Age Group Activity: Number of Rides by Platform

SELECT
 platform,
 age_range,
 SUM(number_of_users) AS users,
 SUM(number_of_rides) AS rides
FROM funnel_analysis
GROUP BY platform, age_range


-- Age Group Activity: Most Active in Completing Rides

SELECT
 s.age_range,
 COUNT(DISTINCT r.ride_id) AS total_rides,
 COUNT(DISTINCT r.user_id) AS active_users
FROM signups s
JOIN ride_requests r ON s.user_id = r.user_id
WHERE r.dropoff_ts IS NOT NULL
GROUP BY s.age_range
ORDER BY total_rides DESC;


 -- Revenue by Age Group

SELECT
 s.age_range,
 ROUND(SUM(t.purchase_amount_usd)::numeric, 2) AS total_revenue
FROM signups s
JOIN ride_requests r ON s.user_id = r.user_id
JOIN transactions t ON r.ride_id = t.ride_id
WHERE t.charge_status = 'Approved'
GROUP BY s.age_range
ORDER BY total_revenue DESC;
