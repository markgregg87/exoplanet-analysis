-- Discovery overview: how many planets are known, how they were found,
-- and how discoveries have changed over time.

-- 1. Total confirmed planets, and how many have a measured radius
SELECT count(*)       AS all_planets,
       count(pl_rade) AS planets_with_radius
FROM planets;

-- 2. Planets found by each discovery method, with percent of the total
SELECT discoverymethod,
       count(*) AS planets,
       round(count(*) * 100.0 / (SELECT count(*) FROM planets), 1) AS pct_of_total
FROM planets
GROUP BY discoverymethod
ORDER BY planets DESC;

-- 3. Planets discovered each year
SELECT disc_year,
       count(*) AS planets
FROM planets
GROUP BY disc_year
ORDER BY disc_year;
