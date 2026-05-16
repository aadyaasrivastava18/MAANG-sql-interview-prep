-- ---------------------------------------------------
-- Problem ID   : 3451
-- Title        : Find Invalid IP Addresses
-- Difficulty   : Hard
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/find-invalid-ip-addresses/
-- Pattern      : String Parsing + Validation Logic
-- Concepts     : SUBSTRING_INDEX, REPLACE, Data Validation
-- ---------------------------------------------------

-- Problem:
-- Find invalid IPv4 addresses.
--
-- Invalid if:
-- 1. Any octet > 255
-- 2. Any octet has leading zeros
-- 3. IP does not contain exactly 4 octets

-- Approach:
-- Count dots to validate octet count
-- Extract each octet using SUBSTRING_INDEX
-- Check:
--   - octet > 255
--   - leading zeros
-- Group invalid IPs and count occurrences

SELECT
    ip,
    COUNT(*) AS invalid_count
FROM logs
WHERE

    -- Invalid number of octets
    LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3

    OR

    -- Octet value > 255
    SUBSTRING_INDEX(ip, '.', 1) > 255
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) > 255
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) > 255
    OR SUBSTRING_INDEX(ip, '.', -1) > 255

    OR

    -- Leading zeros in first octet
    (
        SUBSTRING_INDEX(ip, '.', 1) LIKE '0%'
        AND LENGTH(SUBSTRING_INDEX(ip, '.', 1)) > 1
    )

    OR

    -- Leading zeros in second octet
    (
        SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) LIKE '0%'
        AND LENGTH(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1)) > 1
    )

    OR

    -- Leading zeros in third octet
    (
        SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) LIKE '0%'
        AND LENGTH(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1)) > 1
    )

    OR

    -- Leading zeros in fourth octet
    (
        SUBSTRING_INDEX(ip, '.', -1) LIKE '0%'
        AND LENGTH(SUBSTRING_INDEX(ip, '.', -1)) > 1
    )

GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
