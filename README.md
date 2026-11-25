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
- sql/02_discovery_overview.sql: total planets, planets and percent by discovery method, discoveries by year
- sql/03_earth_like_candidates.sql: Earth-like candidates, missing data, and how the candidates were found
- sql/04_export_earth_like.sql: exports the Earth-like candidates to a CSV
- sql/05_planet_size_stats.sql: average vs. median radius, radius quartiles
- sql/06_multi_candidate_systems.sql: pairs of Earth-like candidates in the same system, and a one-row-per-system summary with counts and planet names
- sql/07_most_earth_like.sql: ranks Earth-like candidates by how close they are to Earth in size and temperature
- results/earth_like_candidates.csv: the 33 Earth-like candidates, closest first

## Findings
- 6,470 confirmed planets (as of 11/13/2026)
- Transit found 4,799 (74%); Radial Velocity found 1,205
- 2016 had the most discoveries of any year
- 33 planets are Earth-like in both size (0.8-1.6 Earth radii) and equilibrium temperature (180-310 K), about 0.5% of all planets
- Transit found more of them (19 vs. 14), but all 10 closest were found by radial velocity. Transit surveys like Kepler looked at distant stars; radial velocity works best on bright, nearby stars.
- Closest Earth-like candidate: Proxima Cen b, 4.2 light-years
- Transit found 4,798 (74.2%); Radial Velocity found 1,205 (18.6%); Microlensing found 294 (4.5%)
- Median planet radius is 2.86 Earth radii, but the average is 5.85. A minority of large gas giants pulls the average up, so the median better describes a typical planet.
- Radius quartiles: 25% of planets are under 1.85 Earth radii, and 25% are over 11.9 (about Jupiter-sized)
- 6 star systems have more than one Earth-like candidate. TRAPPIST-1 has three (e, f, and g); GJ 1002, GJ 1061, Kepler-1649, Teegarden's Star, and TOI-700 have two each.
- Ranked by combined closeness to Earth's size and temperature, Wolf 1069 b (1.08 Earth radii, 250 K) and TRAPPIST-1 e (0.92 Earth radii, 250 K) are nearly tied as the most Earth-like candidates.

## Earth-like criteria
A planet counts as an Earth-like candidate if it passes two filters: size and temperature.

- **Radius 0.8 to 1.6 Earth radii**
  - Upper limit: Rogers (2015) found that most planets at 1.6 Earth radii and larger are too low in density to be made of rock and iron alone. They likely have thick gas layers (mini-Neptunes).
  - The Habitable Worlds Catalog uses the same 1.6 upper limit for its conservative sample (0.5 to 1.6 Earth radii).
  - Lower limit: 0.8 is stricter than the catalog's 0.5, to stay closer to Earth's size. Smaller planets have weaker gravity and may not hold an atmosphere (like Mars).
- **Equilibrium temperature 180 to 310 K**
  - Earth's equilibrium temperature is about 255 K. This range is a rough window around that value, chosen for this project, not a published standard.
  - Equilibrium temperature ignores the atmosphere. Venus would pass this filter, but its surface is about 735 K.
  - Formal catalogs use the habitable zone (starlight received) instead. A future version of this project may compare pl_insol against habitable zone limits.

These are screening filters, so the results are candidates, not habitable planets.

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

## References
- Rogers, L. A. (2015). Most 1.6 Earth-Radius Planets Are Not Rocky. The Astrophysical Journal, 801, 41. https://arxiv.org/abs/1407.4457
- PHL @ UPR Arecibo. The Habitable Worlds Catalog. https://phl.upr.edu/hwc
