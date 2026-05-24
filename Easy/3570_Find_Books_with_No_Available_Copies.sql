-- ---------------------------------------------------
-- Problem ID   : 3570
-- Title        : Find Books with No Available Copies
-- Difficulty   : Easy
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/find-books-with-no-available-copies/
-- Pattern      : JOIN + GROUP BY + HAVING
-- Concepts     : Aggregation, Active Records, Inventory Logic
-- ---------------------------------------------------

-- Problem:
-- Find books that:
-- 1. Are currently borrowed
-- 2. Have zero available copies
--
-- A book is currently borrowed if:
-- return_date IS NULL

-- Approach:
-- Join books with borrowing records
-- Keep only active borrowings
-- Count current borrowers
-- Compare borrower count with total copies
-- If equal -> no copies available

SELECT
    l.book_id,
    l.title,
    l.author,
    l.genre,
    l.publication_year,
    COUNT(b.book_id) AS current_borrowers

FROM library_books AS l
JOIN borrowing_records AS b
    ON l.book_id = b.book_id

WHERE b.return_date IS NULL

GROUP BY
    l.book_id,
    l.title,
    l.author,
    l.genre,
    l.publication_year,
    l.total_copies

HAVING COUNT(b.book_id) = l.total_copies

ORDER BY
    current_borrowers DESC,
    l.title ASC;
