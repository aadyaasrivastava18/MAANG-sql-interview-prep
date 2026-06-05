-- ---------------------------------------------------
-- Problem ID   : 620
-- Title        : Not Boring Movies
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/not-boring-movies/
-- Pattern      : Filtering + Sorting
-- Concepts     : MOD(), WHERE, ORDER BY
-- ---------------------------------------------------

-- Problem:
-- Find movies with:
-- 1. Odd-numbered IDs
-- 2. Description not equal to 'boring'
-- Return results ordered by rating descending.

-- Solution (Recommended)
-- Uses MOD() which is ANSI SQL compliant
-- and works across most SQL databases.

SELECT *
FROM Cinema
WHERE MOD(id, 2) = 1
  AND description <> 'boring'
ORDER BY rating DESC;

-- Alternative Solution
-- MySQL-specific modulo operator

/*
SELECT *
FROM Cinema
WHERE id % 2 != 0
  AND description != 'boring'
ORDER BY rating DESC;
*/
