-- ---------------------------------------------------
-- Problem ID   : 3521
-- Title        : Find Product Recommendation Pairs
-- Difficulty   : Medium
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/find-product-recommendation-pairs/
-- Pattern      : Self Join + Market Basket Analysis
-- Concepts     : Co-Purchase Analysis, Aggregation
-- ---------------------------------------------------

-- Problem:
-- Find product pairs frequently purchased together.
--
-- Conditions:
-- 1. product1_id < product2_id
-- 2. At least 3 distinct customers purchased both
--
-- Return:
-- Product pair
-- Categories
-- Customer count

-- Approach:
-- Self join ProductPurchases on user_id
-- Generate unique product pairs
-- Count distinct customers per pair
-- Join ProductInfo to fetch categories

SELECT
    p1.product_id AS product1_id,
    p2.product_id AS product2_id,
    i1.category AS product1_category,
    i2.category AS product2_category,
    COUNT(DISTINCT p1.user_id) AS customer_count

FROM ProductPurchases p1

JOIN ProductPurchases p2
    ON p1.user_id = p2.user_id
   AND p1.product_id < p2.product_id

JOIN ProductInfo i1
    ON p1.product_id = i1.product_id

JOIN ProductInfo i2
    ON p2.product_id = i2.product_id

GROUP BY
    p1.product_id,
    p2.product_id,
    i1.category,
    i2.category

HAVING COUNT(DISTINCT p1.user_id) >= 3

ORDER BY
    customer_count DESC,
    product1_id ASC,
    product2_id ASC;
