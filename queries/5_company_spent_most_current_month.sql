/*WHICH COMPANY SPENT THE MOST MONEY IN THE CURRENT MONTH?*/

SELECT
  c.name,
FROM
  companies c
INNER JOIN ( --Subquery to select the company that spent the most money in each month
  SELECT 
    max(p.quantity*b.price) AS max_trans_cost, -- max function to get the highest transation cost.
    p.company_id AS company_id,
    convert(month, getDATE()) AS current_month
  FROM
    purchases p
  INNER JOIN
    materials b
  ON
    p.material_id = b.id
  WHERE
    convert(month, p.datetime) = current_month) last_month_trans_cost_t
ON
  c.id = last_month_trans_cost_t.company_id;
