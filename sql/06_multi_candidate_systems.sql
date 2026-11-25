-- Star systems with more than one Earth-like candidate.
-- Self-join: pairs each Earth-like planet with every other Earth-like
-- planet orbiting the same star. Same criteria as 03_earth_like_candidates.sql.
-- pl1.pl_name < pl2.pl_name removes a planet paired with itself and keeps
-- each pair only once (e and f, not also f and e).

-- 1. Every pair of Earth-like candidates in the same system
--    (a system with 3 candidates shows 3 pairs)
SELECT pl1.hostname AS star,
       pl1.pl_name  AS planet_1,
       pl2.pl_name  AS planet_2
FROM planets pl1
INNER JOIN planets pl2
    ON pl1.hostname = pl2.hostname
WHERE pl1.pl_rade BETWEEN 0.8 AND 1.6
  AND pl1.pl_eqt  BETWEEN 180 AND 310
  AND pl2.pl_rade BETWEEN 0.8 AND 1.6
  AND pl2.pl_eqt  BETWEEN 180 AND 310
  AND pl1.pl_name < pl2.pl_name
ORDER BY star, planet_1, planet_2;

-- 2. Each system with more than one Earth-like candidate, listed once
SELECT DISTINCT pl1.hostname AS star
FROM planets pl1
INNER JOIN planets pl2
    ON pl1.hostname = pl2.hostname
WHERE pl1.pl_rade BETWEEN 0.8 AND 1.6
  AND pl1.pl_eqt  BETWEEN 180 AND 310
  AND pl2.pl_rade BETWEEN 0.8 AND 1.6
  AND pl2.pl_eqt  BETWEEN 180 AND 310
  AND pl1.pl_name < pl2.pl_name
ORDER BY star;
