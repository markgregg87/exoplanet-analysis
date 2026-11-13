CREATE TABLE planets (
    pl_name          text PRIMARY KEY,
    hostname         text,
    discoverymethod  text,
    disc_year        integer,
    disc_facility    text,
    sy_snum          integer,
    sy_pnum          integer,
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

COPY planets
FROM 'C:\SQL\exoplanet-analysis\data\pscomppars.csv'
WITH (FORMAT CSV, HEADER);
