-- Star systems with more than one Earth-like candidate.
-- Same criteria as 03_earth_like_candidates.sql:
--   radius 0.8 to 1.6 Earth radii, equilibrium temperature 180 to 310 K

-- 1. Every pair of Earth-like candidates in the same system (self-join).
--    pl1.pl_name < pl2.pl_name removes a planet paired with itself and keeps
--    each pair only once (e and f, not also f and e).
--    A system with 3 candidates shows 3 pairs.
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

-- 2. One row per system: number of Earth-like candidates and their names.
--    GROUP BY collects each star's candidates; HAVING keeps stars with 2 or more.
SELECT hostname AS star,
       count(*) AS earth_like_count,
       string_agg(pl_name, ', ' ORDER BY pl_name) AS planets
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.6
  AND pl_eqt  BETWEEN 180 AND 310
GROUP BY hostname
HAVING count(*) >= 2
ORDER BY earth_like_count DESC, star;
