-- Exports the Earth-like candidates to results/earth_like_candidates.csv,
-- closest first, with rounded values and readable column headers.
-- Uses the same criteria as 03_earth_like_candidates.sql.
-- Change the output path to a folder on your machine.

COPY (
    SELECT pl_name                           AS planet,
           pl_rade::numeric(4,2)             AS radius_earths,
           pl_eqt::numeric(5,1)              AS eq_temp_k,
           (sy_dist * 3.26156)::numeric(6,1) AS distance_ly,
           disc_year                         AS year_found,
           discoverymethod                   AS method
    FROM planets
    WHERE pl_rade BETWEEN 0.8 AND 1.6
      AND pl_eqt BETWEEN 180 AND 310
    ORDER BY sy_dist
)
TO 'C:\SQL\exoplanet-analysis\results\earth_like_candidates.csv'
WITH (FORMAT CSV, HEADER);
