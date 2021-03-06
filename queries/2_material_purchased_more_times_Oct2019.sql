/*WHICH MATERIAL HAS BEEN PURCHASED THE MOST TIMES IN OCTOBER 2019?*/

SELECT
  m.name
FROM
  materials m
INNER JOIN (--Subquery to select the materials with the most purchases
  SELECT
    MAX(quantity),
    material_id,
    -- Month and Year belong to the subquery because that way, we don't need to join the two tables outside of the subquery (materials,purchases)
    EXTRACT (MONTH FROM datetime) AS Month,
    EXTRACT (YEAR FROM datetime) AS Year
  FROM
    purchases
  WHERE --Including the WHERE clause inside the subquery because otherwise the subquery will return the max(quantity) of all time
    Month = 10
    AND Year = 2019) max_quant
ON
  max_quant.material_id = m.id;
