/*LIST OF CONSTRUCTION COMPANIES THAT HAS SPENT MORE THAN $10,000 IN A SINGLE DAY*/
SELECT
  distinct c.name, -- Including distinct name because we could have that a company spent more than 10000  more than once in a day. It also depends on what we want to know, perhaps we want to know how many times.
  (p.quantity*b.price) AS trans_cost,
  date_trunc ('day', p.datetime) AS day
FROM
  building_material b
RIGHT OUTER JOIN
  purchase p
ON
  p.building_material_id = b.id
LEFT OUTER JOIN
  construction_company c
ON
  p.construction_company_id = c.id
HAVING
  trans_cost > 1000000
GROUP BY
  day;
