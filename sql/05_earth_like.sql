-- checks how many planets are similar and size and temp to earth
SELECT pl_name, pl_rade, pl_eqt, (sy_dist * 3.26156)::numeric(6,1) AS distance_ly,
	disc_year, discoverymethod
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.6
	AND pl_eqt BETWEEN 180 AND 310
ORDER BY sy_dist;

-- checks how many planets dont have a temp or radius
SELECT count(*) - count(pl_eqt) AS missing_temp,
       count(*) - count(pl_rade) AS missing_radius
FROM planets;

-- How were the 33 Earth-like candidates found?
SELECT discoverymethod, count(*)
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.6
  AND pl_eqt BETWEEN 180 AND 310
GROUP BY discoverymethod;