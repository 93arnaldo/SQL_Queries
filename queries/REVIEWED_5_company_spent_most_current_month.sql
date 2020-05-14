/*WHICH CONSTRUCTION COMPANY SPENT THE MOST MONEY IN THE CURRENT MONTH*/

SELECT
  c.name,
FROM
  construction_company c
INNER JOIN ( --Subquery to select the company that spent the most money in each month
  SELECT 
    max(p.quantity*b.price) AS max_trans_cost, -- max function to get the highest transation cost.
    p.contruction_company_id AS company_id,
    convert(month, getDATE()) AS current_month
  FROM
    purchase p
  INNER JOIN
    building_material b
  ON
    p.building_material_id = b.id
  WHERE
    convert(month, p.datetime) = current_month) last_month_trans_cost_t
ON
  c.id = last_month_trans_cost_t.company_id;