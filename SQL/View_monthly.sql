CREATE VIEW vw_monthly_summary
AS

	SELECT
	YEAR(load_date) AS Year,
	MONTH(load_date) AS Month,
	DATENAME(MONTH,load_date) AS Month_Name,
	COUNT(load_id) AS Total_Shipments,
	SUM(revenue) AS Total_Revenue,
	AVG(revenue) AS Avg_Revenue_Per_Shipment
FROM loads
GROUP BY
	YEAR(load_date),
	MONTH(load_date),
	DATENAME(MONTH,load_date);