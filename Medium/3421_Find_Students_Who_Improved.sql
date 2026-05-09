-- ---------------------------------------------------
-- Problem ID   : 3421
-- Title        : Find Students Who Improved
-- Difficulty   : Medium
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/find-students-who-improved/
-- Pattern      : Window Functions
-- Concepts     : FIRST_VALUE, LAST_VALUE, ROW_NUMBER
-- ---------------------------------------------------

-- Problem:
-- Find students whose latest score
-- is higher than their first score
-- in the same subject.

-- Conditions:
-- 1. Student took at least 2 exams
-- 2. latest_score > first_score

-- Approach:
-- FIRST_VALUE() -> gets first exam score
-- LAST_VALUE()  -> gets latest exam score
-- ROW_NUMBER()  -> keeps latest record only
-- Compare first and latest scores

SELECT
    student_id,
    subject,
    min_scr AS first_score,
    max_scr AS latest_score
FROM (
    SELECT
        student_id,
        subject,
        score,
        exam_date,

        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date ASC
        ) AS min_scr,

        LAST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date ASC
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
        ) AS max_scr,

        ROW_NUMBER() OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date DESC
        ) AS rn

    FROM Scores
) AS t
WHERE rn = 1
  AND min_scr < max_scr;
