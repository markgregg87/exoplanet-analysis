SELECT COUNT(*)       AS all_rows,
       COUNT(pl_rade) AS rows_with_radius
FROM planets;

SELECT discoverymethod,
       COUNT(*) AS planets
FROM planets
GROUP BY discoverymethod
ORDER BY planets DESC;

SELECT disc_year,
       COUNT(*) AS planets
FROM planets
GROUP BY disc_year
ORDER BY disc_year;