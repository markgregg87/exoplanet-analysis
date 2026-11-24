-- Planet size statistics: what a typical planet looks like.
-- Radius is in Earth radii. avg() and percentile_cont() skip planets with no radius.

-- 1. Average vs. median radius
--    A few very large planets pull the average up, so the median
--    better describes a typical planet.
SELECT round(avg(pl_rade), 2) AS avg_radius,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY pl_rade) AS median_radius
FROM planets;

-- 2. Radius quartiles (25th, 50th, 75th percentile)
SELECT percentile_cont(array[0.25, 0.5, 0.75])
       WITHIN GROUP (ORDER BY pl_rade) AS radius_quartiles
FROM planets;
