-- 1. Earth-size planets (0.8 to 1.25 Earth radii), closest first
SELECT pl_name, pl_rade, sy_dist, disc_year
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.25
ORDER BY sy_dist;

-- 2a. LIKE is case-sensitive: lowercase 'kepler' finds nothing
SELECT pl_name, disc_facility, disc_year
FROM planets
WHERE disc_facility LIKE '%kepler%'
ORDER BY disc_year;

-- 2b. ILIKE ignores case: finds all Kepler discoveries
SELECT pl_name, disc_facility, disc_year
FROM planets
WHERE disc_facility ILIKE '%kepler%'
ORDER BY disc_year;

-- 3a. Every discovery method, listed once
SELECT DISTINCT discoverymethod
FROM planets
ORDER BY discoverymethod;

-- 3b. Find the row with the bad "Transit" value
SELECT pl_name, discoverymethod, disc_facility
FROM planets
WHERE discoverymethod = '"Transit"';

-- 3c. Find any method containing a double quote, and its length
SELECT pl_name, discoverymethod, length(discoverymethod)
FROM planets
WHERE discoverymethod LIKE '%"%';

-- 3d. Each method with its planet count and text length
SELECT discoverymethod, count(*), length(discoverymethod)
FROM planets
GROUP BY discoverymethod
ORDER BY discoverymethod;

-- 4a. Transit or RV planets found 2024 or later, newest first
SELECT pl_name, discoverymethod, disc_year
FROM planets
WHERE (discoverymethod = 'Transit' OR discoverymethod = 'Radial Velocity')
  AND disc_year >= 2024
ORDER BY disc_year DESC, pl_name;

-- 4b. Without parentheses: AND runs first, so the year filter only applies to RV
SELECT pl_name, discoverymethod, disc_year
FROM planets
WHERE discoverymethod = 'Transit' OR discoverymethod = 'Radial Velocity'
  AND disc_year >= 2024
ORDER BY disc_year DESC, pl_name;
