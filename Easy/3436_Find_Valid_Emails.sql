-- ---------------------------------------------------
-- Problem ID   : 3436
-- Title        : Find Valid Emails
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/find-valid-emails/
-- Pattern      : REGEXP Filtering
-- Concepts     : String Validation, Pattern Matching
-- ---------------------------------------------------

-- Problem:
-- Find valid email addresses where:
-- 1. Exactly one @ symbol exists
-- 2. Ends with .com
-- 3. Username contains only:
--    letters, numbers, underscores
-- 4. Domain contains only letters

-- Approach:
-- Use REGEXP to validate email pattern

SELECT
    user_id,
    email
FROM Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
ORDER BY user_id;
