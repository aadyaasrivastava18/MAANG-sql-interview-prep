-- ---------------------------------------------------
-- Problem ID   : 627
-- Title        : Swap Sex of Employees
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/swap-sex/
-- Pattern      : UPDATE + CASE WHEN
-- Concepts     : Conditional Update
-- ---------------------------------------------------

-- Problem:
-- Swap all 'm' to 'f' and 'f' to 'm'
-- using a single UPDATE statement

-- Approach:
-- Use CASE WHEN to conditionally update values
-- 'm' becomes 'f'
-- 'f' becomes 'm'

UPDATE Salary
SET sex = CASE
            WHEN sex = 'm' THEN 'f'
            ELSE 'm'
          END;
