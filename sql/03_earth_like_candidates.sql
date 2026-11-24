-- Earth-like candidates: planets similar to Earth in both size and temperature.
-- Criteria (sources in the README):
--   radius 0.8 to 1.6 Earth radii
--   equilibrium temperature 180 to 310 K

-- 1. All Earth-like candidates, closest first (distance converted to light-years)
SELECT pl_name, pl_rade, pl_eqt,
       (sy_dist * 3.26156)::numeric(6,1) AS distance_ly,
       disc_year, discoverymethod
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.6
  AND pl_eqt BETWEEN 180 AND 310
ORDER BY sy_dist;

-- 2. How many planets couldn't be checked (no temperature or no radius)
SELECT count(*) - count(pl_eqt)  AS missing_temp,
       count(*) - count(pl_rade) AS missing_radius
FROM planets;

-- 3. How the Earth-like candidates were found
SELECT discoverymethod,
       count(*) AS candidates
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.6
  AND pl_eqt BETWEEN 180 AND 310
GROUP BY discoverymethod
ORDER BY candidates DESC;
