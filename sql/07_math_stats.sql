-- 1. Percent of planets found by each discovery method
--    count per method / total from a subquery, times 100
SELECT discoverymethod,
       count(*) AS planets,
       round(count(*) * 100.0 / (SELECT count(*) FROM planets), 1) AS pct_of_total
FROM planets
GROUP BY discoverymethod
ORDER BY planets DESC;

-- 2. Average vs. median planet radius (Earth radii)
--    percentile_cont(0.5) = median; avg and percentile_cont skip NULLs
SELECT round(avg(pl_rade), 2) AS avg_radius,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY pl_rade) AS median_radius
FROM planets;

-- 3. Quartiles of planet radius (25th, 50th, 75th percentile)
SELECT percentile_cont(array[0.25, 0.5, 0.75])
       WITHIN GROUP (ORDER BY pl_rade) AS radius_quartiles
FROM planets;