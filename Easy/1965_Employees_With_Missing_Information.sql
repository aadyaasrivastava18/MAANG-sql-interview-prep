-- ---------------------------------------------------
-- Problem ID   : 1965
-- Title        : Employees With Missing Information
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/employees-with-missing-information/
-- Pattern      : LEFT JOIN + UNION
-- Concepts     : Missing Data Detection, NULL Handling
-- ---------------------------------------------------

-- Problem:
-- Find employee IDs where:
-- 1. Name is missing
-- OR
-- 2. Salary is missing

-- Approach:
-- First query:
-- Find employees present in Employees table
-- but missing in Salaries table

-- Second query:
-- Find employees present in Salaries table
-- but missing in Employees table

-- Combine both using UNION
-- Sort final result by employee_id

SELECT
    e.employee_id
FROM Employees e
LEFT JOIN Salaries s
    ON e.employee_id = s.employee_id
WHERE s.salary IS NULL

UNION

SELECT
    s.employee_id
FROM Salaries s
LEFT JOIN Employees e
    ON s.employee_id = e.employee_id
WHERE e.name IS NULL

ORDER BY employee_id;
