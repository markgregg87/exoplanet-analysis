-- creates a csv file with all earthlike exoplanets. converts distance to lightyears
COPY (
	SELECT pl_name, pl_rade, pl_eqt, (sy_dist * 3.26156)::numeric(6,1) AS distance_ly,
        disc_year, discoverymethod
	FROM planets
	WHERE pl_rade BETWEEN 0.8 AND 1.6
        AND pl_eqt BETWEEN 180 AND 310
    ORDER BY sy_dist
	)
TO 'C:\SQL\exoplanet-analysis\results\earth_like_candidates.csv'
WITH (FORMAT CSV, HEADER);

-- exports the 33 earth likes with rounded values and redable headers
COPY (
	SELECT pl_name AS planet,
        pl_rade::numeric(4,2) AS radius_earths,
        pl_eqt::numeric(5,1) AS eq_temp_k,
        (sy_dist * 3.26156)::numeric(6,1) AS distance_ly,
        disc_year AS year_found,
        discoverymethod AS method
	FROM planets
    WHERE pl_rade BETWEEN 0.8 AND 1.6
        AND pl_eqt BETWEEN 180 AND 310
    ORDER BY sy_dist
	)
TO 'C:\SQL\exoplanet-analysis\results\earth_like_candidates.csv'
WITH (FORMAT CSV, HEADER);