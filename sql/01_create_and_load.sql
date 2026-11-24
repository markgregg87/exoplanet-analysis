-- Creates the planets table and loads NASA's exoplanet data into it.
-- Source: NASA Exoplanet Archive, Planetary Systems Composite Parameters
-- (pscomppars), one row per confirmed planet. Column units are in the README.

CREATE TABLE planets (
    pl_name          text PRIMARY KEY,  -- planet name (unique)
    hostname         text,              -- host star name
    discoverymethod  text,
    disc_year        integer,
    disc_facility    text,              -- telescope or observatory
    sy_snum          integer,           -- number of stars in the system
    sy_pnum          integer,           -- number of planets in the system
    pl_orbper        numeric,
    pl_orbsmax       numeric,
    pl_rade          numeric,
    pl_bmasse        numeric,
    pl_eqt           numeric,
    pl_insol         numeric,
    st_teff          numeric,
    st_rad           numeric,
    st_mass          numeric,
    sy_dist          numeric
);

-- Loads the CSV. Change the path to where the file is saved on your machine.
COPY planets
FROM 'C:\SQL\exoplanet-analysis\data\pscomppars.csv'
WITH (FORMAT CSV, HEADER);