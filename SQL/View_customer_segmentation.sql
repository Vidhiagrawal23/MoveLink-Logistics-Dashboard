CREATE VIEW vw_customer_segmentation
AS
	SELECT customer_id, customer_name, total_revenue, customer_Rank,
	CASE
	WHEN customer_Rank <= 40 THEN 'Platinum'
	WHEN customer_Rank <= 120 THEN 'Gold'
	ELSE 'Silver'
	End as Customer_category
FROM
(
		SELECT 
			l.customer_id, c.customer_name, 
			ROUND(SUM(revenue),2) as total_revenue,
			Rank() Over(order by ROUND(SUM(revenue),2) desc) as customer_Rank
	FROM loads l
	JOIN customers c
	ON l.customer_id = c.customer_id
	GROUP BY l.customer_id, c.customer_name
)ranked_customer
