/*WE HAVE A BUILDING MATERIAL CALLED "2X4", NAME OF ALL COMPANIES THAT HAVE EVER PURCHASED IT.*/
SELECT
  distict c.name
FROM
  companies c
RIGHT OUTER JOIN -- To keep all the purchase records and include the construction company information 
  purchase p
ON
  p.company_id = c.id 
LEFT OUTER JOIN -- To keep all the purchase record and include the materials information 
  materials b
ON
  b.id = p.material_id
WHERE
  b.name = '2x4';
