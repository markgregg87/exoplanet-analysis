# Exoplanet Analysis

Exploring NASA's catalog of confirmed exoplanets with SQL, with Power BI and Python to come.

## Questions
- How have exoplanet discoveries changed over time, and which methods found them?
- Which known planets are most Earth-like, and how close are they?

## Data
NASA Exoplanet Archive, Planetary Systems Composite Parameters table (pscomppars), pulled 11/13/2026.
https://exoplanetarchive.ipac.caltech.edu

## Tools
PostgreSQL 18, pgAdmin 4

## Files
- data/pscomppars.csv: 6,470 planets, 17 columns
- sql/01_create_and_load.sql: creates the planets table and loads the CSV
- sql/02_queries.sql: first exploration queries
- sql/03_watchlist.sql: watchlist table of planets to follow
- sql/04_select_where.sql: filtering, text matching, and sorting queries
- sql/05_earth_like.sql: Earth-like planet analysis

## Findings
- 6,470 confirmed planets (as of 11/13/2026)
- Transit found 4,799 (74%); Radial Velocity found 1,205
- 2016 had the most discoveries of any year
- 33 planets are Earth-like in both size (0.8-1.6 Earth radii) and equilibrium temperature (180-310 K), about 0.5% of all planets
- Transit found more of them (19 vs. 14), but all 10 closest were found by radial velocity. Transit surveys like Kepler looked at distant stars; radial velocity works best on bright, nearby stars.
- Closest Earth-like candidate: Proxima Cen b, 4.2 light-years

## Caveats
- 540 planets have no equilibrium temperature and 50 have no radius, so they couldn't be checked.
- Equilibrium temperature is calculated from starlight alone and ignores atmosphere (Earth's is about 255 K, versus about 288 K actual).
- Small, cool planets are the hardest to detect, so these counts reflect what has been found, not what exists.

## Column units
- pl_rade: Earth radii; pl_bmasse: Earth masses
- pl_eqt: equilibrium temperature, Kelvin
- pl_orbper: orbital period, days; pl_orbsmax: distance from star, AU
- pl_insol: starlight received, Earth = 1
- st_teff: star temperature, Kelvin; st_rad, st_mass: Sun = 1
- sy_dist: distance, parsecs (1 pc = 3.26 light-years)
