-- ---------------------------------------------------
-- Problem ID   : 1050
-- Title        : Actors and Directors Who Cooperated At Least Three Times
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
-- Pattern      : GROUP BY + HAVING
-- Concepts     : Aggregation, Frequency Count
-- ---------------------------------------------------

-- Problem:
-- Find all (actor_id, director_id) pairs
-- where they have worked together at least 3 times.

-- Approach:
-- Group by actor_id and director_id
-- Count number of collaborations
-- Filter pairs with count >= 3

SELECT
    actor_id,
    director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;
