/*WE HAVE A BUILDING MATERIAL CALLED '2X4', 
NAME OF ALL COMPANIES THAT HAVE PRUCHASED THE MATERIAL '2X4' TODAY,
SORTED BY THE PURCHASES WITH MOST UNITS AT THE TOP*/

SELECT
  distict c.name,
  convert(date, getDATE()) AS today, --Getting today's date
  convert(date, p.datetime) AS day,
FROM
  companies c
RIGHT OUTER JOIN --To keep all the purchase records and include the construction company information 
  purchases p
ON
  p.company_id = c.id 
LEFT OUTER JOIN --To keep all the purchase records and include the materials information 
  materials b
ON
  b.id = p.material_id
WHERE
  b.name = '2x4'
  AND day = today -- Indicating that we only want the records of today
ORDER BY
  p.quantity DESC; -- Sorting with the most units at the top
