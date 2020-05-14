-- WHICH BUILDING MATERIAL HAS BEEN PURCHASED THE MOST TIMES.


-- FIRST APPROACH.
/*Works, but not very efficient, because the ORDER BY will need to sort ALL the database first
and then limit the results to one row. If the DB is huge, it can take a lot of time and resources.*/
SELECT
  m.name
FROM
  materials m
INNER JOIN
  purchases p
ON
  m.id = p.material_id
ORDER BY
  p.quantity DESC
LIMIT
  1;

-- SECOND APPROACH.
/*Much more efficient. With a subquery select the material that has been purchased the most first.
Then join the resulted table with the building_material table and select the name of the material. */ 
SELECT
  m.name
FROM
  materials m
INNER JOIN (
  SELECT
    MAX(quantity),
    material_id
  FROM
    purchases) max_quant
ON
  max_quant.material_id = materials.id;
