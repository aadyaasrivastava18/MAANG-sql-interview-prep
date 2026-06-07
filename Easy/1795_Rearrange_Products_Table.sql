-- ---------------------------------------------------
-- Problem ID   : 1795
-- Title        : Rearrange Products Table
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/rearrange-products-table/
-- Pattern      : UNPIVOT using UNION ALL
-- Concepts     : Data Transformation, Normalization
-- ---------------------------------------------------

-- Problem:
-- Convert the Products table from:
--
-- product_id | store1 | store2 | store3
--
-- into:
--
-- product_id | store | price
--
-- Ignore stores where the product is unavailable
-- (price is NULL).

-- Approach:
-- Convert each store column into rows
-- using UNION ALL.
-- Filter out NULL prices.

SELECT
    product_id,
    'store1' AS store,
    store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT
    product_id,
    'store2' AS store,
    store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT
    product_id,
    'store3' AS store,
    store3 AS price
FROM Products
WHERE store3 IS NOT NULL;
