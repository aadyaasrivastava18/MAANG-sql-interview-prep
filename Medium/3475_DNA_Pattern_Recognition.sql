-- ---------------------------------------------------
-- Problem ID   : 3475
-- Title        : DNA Pattern Recognition
-- Difficulty   : Medium
-- Platform     : LeetCode
-- Link         : https://leetcode.com/problems/dna-pattern-recognition/
-- Pattern      : CASE WHEN + LIKE
-- Concepts     : String Pattern Matching, Biological Sequence Analysis
-- ---------------------------------------------------

-- Problem:
-- Identify DNA sequence patterns:
--
-- 1. Starts with 'ATG'
-- 2. Ends with 'TAA', 'TAG', or 'TGA'
-- 3. Contains 'ATAT'
-- 4. Contains at least 3 consecutive G's

-- Approach:
-- Use CASE statements with LIKE pattern matching
-- Return 1 if pattern exists, otherwise 0

SELECT
    sample_id,
    dna_sequence,
    species,

    CASE
        WHEN dna_sequence LIKE 'ATG%'
        THEN 1
        ELSE 0
    END AS has_start,

    CASE
        WHEN dna_sequence LIKE '%TAA'
          OR dna_sequence LIKE '%TAG'
          OR dna_sequence LIKE '%TGA'
        THEN 1
        ELSE 0
    END AS has_stop,

    CASE
        WHEN dna_sequence LIKE '%ATAT%'
        THEN 1
        ELSE 0
    END AS has_atat,

    CASE
        WHEN dna_sequence LIKE '%GGG%'
        THEN 1
        ELSE 0
    END AS has_ggg

FROM Samples
ORDER BY sample_id;
