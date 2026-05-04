-- ---------------------------------------------------
-- Problem ID   : 608
-- Title        : Tree Node
-- Difficulty   : Medium
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/tree-node/
-- Pattern      : CASE WHEN + Subquery
-- Concepts     : Hierarchical Data, Classification
-- ---------------------------------------------------

-- Problem:
-- Classify each node as:
-- Root  -> if p_id IS NULL
-- Leaf  -> if node has no children
-- Inner -> otherwise

-- Approach:
-- Root: p_id IS NULL
-- Leaf: id not present as any p_id (no children)
-- Inner: all remaining nodes

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (
            SELECT p_id
            FROM Tree
            WHERE p_id IS NOT NULL
        ) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;
