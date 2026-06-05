-- ---------------------------------------------------
-- Problem ID   : 3497
-- Title        : Analyze Subscription Conversion
-- Difficulty   : Medium
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/analyze-subscription-conversion/
-- Pattern      : Conditional Aggregation
-- Concepts     : AVG, CASE WHEN, HAVING
-- ---------------------------------------------------

-- Problem:
-- Find users who converted from:
-- free_trial -> paid
--
-- Calculate:
-- 1. Average activity duration during free trial
-- 2. Average activity duration during paid period
--
-- Return only users who have both
-- free_trial and paid activities.

-- Approach:
-- Use conditional aggregation:
-- AVG() + CASE WHEN
--
-- Compute separate averages for:
-- free_trial activities
-- paid activities
--
-- Use HAVING to keep only converted users.

SELECT
    user_id,

    ROUND(
        AVG(
            CASE
                WHEN activity_type = 'free_trial'
                THEN activity_duration
            END
        ),
        2
    ) AS trial_avg_duration,

    ROUND(
        AVG(
            CASE
                WHEN activity_type = 'paid'
                THEN activity_duration
            END
        ),
        2
    ) AS paid_avg_duration

FROM UserActivity

GROUP BY user_id

HAVING
    SUM(activity_type = 'free_trial') > 0
    AND
    SUM(activity_type = 'paid') > 0

ORDER BY user_id;
