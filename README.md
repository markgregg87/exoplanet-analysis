# Exoplanet Analysis

Exploring NASA's catalog of confirmed exoplanets with SQL, with Power BI and Python to come.

## Question
How have exoplanet discoveries changed over time, and which methods found them?

## Data
NASA Exoplanet Archive, Planetary Systems Composite Parameters table (pscomppars), pulled 11/13/2026.
https://exoplanetarchive.ipac.caltech.edu

## Tools
PostgreSQL 18, pgAdmin 4

## Files
- data/pscomppars.csv: 6,470 planets, 17 columns
- sql/01_create_and_load.sql: creates the planets table and loads the CSV
- sql/02_queries.sql: first exploration queries

## First findings
- 6,470 confirmed planets (as of 11/13/2026)
- Transit found 4,799 (74%); Radial Velocity found 1,205
- 2016 had the most discoveries of any year
