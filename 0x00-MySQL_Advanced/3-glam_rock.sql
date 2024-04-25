--Write a SQL script that lists all bands with Glam rock as their main style,
-- ranked by their longevity
-- Calculate the lifespan of each band and filter by Glam rock style
SELECT band_name, (2022 - formed) AS lifespan 
FROM metal_bands where style LIKE "%Glam rock%"
-- Order the result by lifespan in descending order
ORDER BY lifespan DESC;