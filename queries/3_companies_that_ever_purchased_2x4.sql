/*WE HAVE A BUILDING MATERIAL CALLED "2X4", 
GIVE ME THE NAME OF ALL CONSTRUCTION COMPANIES THAT HAVE EVER PURCHASED IT.*/
SELECT
  distict c.name
FROM
  construction_company c
RIGHT OUTER JOIN -- To keep all the purchase records and include the construction company information 
  purchase p
ON
  p.contruction_company_id = c.id 
LEFT OUTER JOIN -- To keep all the purchase record and include the materials information 
  building_material b
ON
  b.id = p.building_material_id
WHERE
  b.name = '2x4';
