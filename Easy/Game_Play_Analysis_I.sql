-- ---------------------------------------------------
-- Problem ID   : 511
-- Title        : Game Play Analysis I
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/game-play-analysis-i/
-- Pattern      : GROUP BY + MIN()
-- Concepts     : Aggregation, Earliest Date
-- ---------------------------------------------------

-- Problem:
-- Find the first login date for each player.

-- Approach:
-- Group records by player_id
-- Use MIN(event_date) to get earliest login date

SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
