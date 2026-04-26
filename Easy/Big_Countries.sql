-- ---------------------------------------------------
-- Problem ID   : 595
-- Title        : Big Countries
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/big-countries/
-- Pattern      : WHERE Filter + OR Condition
-- Concepts     : Conditional Filtering
-- ---------------------------------------------------

-- Problem:
-- Find countries that are considered big:
-- 1. area >= 3000000
-- OR
-- 2. population >= 25000000

-- Return:
-- name, population, area

-- Approach:
-- Apply filter using OR condition
-- Select only required columns

SELECT
    name,
    population,
    area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
