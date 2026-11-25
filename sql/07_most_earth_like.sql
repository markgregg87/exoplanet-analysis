-- Ranks the Earth-like candidates by how close they are to Earth
-- in both size and temperature.
-- Score = fraction off from Earth's radius + fraction off from Earth's
-- equilibrium temperature (Earth: 1.0 Earth radii, about 255 K).
-- Dividing each difference by Earth's value puts both on the same scale,
-- so neither one outweighs the other. Lower score = more Earth-like.
-- This is a simple project score, not the published Earth Similarity Index.

SELECT pl_name,
       pl_rade,
       pl_eqt,
       round(abs(pl_rade - 1), 3)                          AS radius_off,
       round(abs(pl_eqt - 255) / 255, 3)                   AS temp_off,
       round(abs(pl_rade - 1) + abs(pl_eqt - 255) / 255, 3) AS score
FROM planets
WHERE pl_rade BETWEEN 0.8 AND 1.6
  AND pl_eqt  BETWEEN 180 AND 310
ORDER BY score;



