-- ---------------------------------------------------
-- Problem ID   : 596
-- Title        : Classes With at Least 5 Students
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/classes-with-at-least-5-students/
-- Pattern      : GROUP BY + HAVING
-- Concepts     : Aggregation, Filtering Groups
-- ---------------------------------------------------

-- Problem:
-- Find all classes that have at least five students enrolled.

-- Approach:
-- Group records by class
-- Count students in each class
-- Keep only classes with count >= 5

SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
