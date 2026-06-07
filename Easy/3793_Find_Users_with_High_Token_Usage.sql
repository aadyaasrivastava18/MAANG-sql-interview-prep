-- ---------------------------------------------------
-- Problem ID   : 3793
-- Title        : Find Users with High Token Usage
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/find-users-with-high-token-usage/
-- Pattern      : Aggregation + HAVING
-- Concepts     : COUNT, AVG, MAX, Group Filtering
-- ---------------------------------------------------

-- Problem:
-- For each user:
-- 1. Count total prompts submitted
-- 2. Calculate average tokens per prompt
--
-- Include only users who:
-- 1. Submitted at least 3 prompts
-- 2. Have at least one prompt whose token count
--    exceeds their own average token usage

-- Approach:
-- Group by user_id
-- Calculate:
--   COUNT(*) -> prompt count
--   AVG(tokens) -> average token usage
--   MAX(tokens) -> highest token usage
--
-- Use HAVING to filter qualifying users.

SELECT
    user_id,
    COUNT(*) AS prompt_count,
    ROUND(AVG(tokens), 2) AS avg_tokens

FROM prompts

GROUP BY user_id

HAVING
    COUNT(*) >= 3
    AND MAX(tokens) > AVG(tokens)

ORDER BY
    avg_tokens DESC,
    user_id ASC;
