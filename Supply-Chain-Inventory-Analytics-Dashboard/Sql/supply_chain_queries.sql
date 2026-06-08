USE supply_chain_db;

-- ============================================
-- Query 1: Total Revenue
-- ============================================
SELECT
ROUND(SUM(`Revenue generated`),2) AS Total_Revenue
FROM SupplyChain;

-- ============================================
-- Query 2: Revenue by Product Type
-- ============================================
SELECT
`Product type`,
ROUND(SUM(`Revenue generated`),2) AS Revenue
FROM SupplyChain
GROUP BY `Product type`
ORDER BY Revenue DESC;

-- ============================================
-- Query 3: Top 10 Revenue Generating Products
-- ============================================
SELECT
SKU,
ROUND(SUM(`Revenue generated`),2) AS Revenue
FROM SupplyChain
GROUP BY SKU
ORDER BY Revenue DESC
LIMIT 10;

-- ============================================
-- Query 4: Top 10 Products by Stock Levels
-- ============================================
SELECT
SKU,
SUM(`Stock levels`) AS Stock_Level
FROM SupplyChain
GROUP BY SKU
ORDER BY Stock_Level DESC
LIMIT 10;

-- ============================================
-- Query 5: Low Stock Products
-- ============================================
SELECT
SKU,
SUM(`Stock levels`) AS Stock_Level
FROM SupplyChain
GROUP BY SKU
ORDER BY Stock_Level ASC
LIMIT 10;

-- ============================================
-- Query 6: Supplier Performance Analysis
-- ============================================
SELECT
`Supplier name`,
ROUND(AVG(`Lead times`),2) AS Avg_Lead_Time,
ROUND(AVG(`Defect rates`),2) AS Avg_Defect_Rate,
ROUND(SUM(`Revenue generated`),2) AS Revenue
FROM SupplyChain
GROUP BY `Supplier name`
ORDER BY Revenue DESC;

-- ============================================
-- Query 7: Revenue by Location
-- ============================================
SELECT
Location,
ROUND(SUM(`Revenue generated`),2) AS Revenue
FROM SupplyChain
GROUP BY Location
ORDER BY Revenue DESC;

-- ============================================
-- Query 8: Inventory Health Analysis
-- ============================================
SELECT
SKU,
SUM(`Stock levels`) AS Stock,
SUM(`Number of products sold`) AS Sales,
ROUND(
SUM(`Stock levels`) * 1.0 /
NULLIF(SUM(`Number of products sold`),0),
2
) AS Inventory_Sales_Ratio
FROM SupplyChain
GROUP BY SKU
ORDER BY Inventory_Sales_Ratio DESC;

-- ============================================
-- Query 9: Shipping Cost by Carrier
-- ============================================
SELECT
`Shipping carriers`,
ROUND(AVG(`Shipping costs`),2) AS Avg_Shipping_Cost
FROM SupplyChain
GROUP BY `Shipping carriers`
ORDER BY Avg_Shipping_Cost DESC;

-- ============================================
-- Query 10: Shipping Time by Carrier
-- ============================================
SELECT
`Shipping carriers`,
ROUND(AVG(`Shipping times`),2) AS Avg_Shipping_Time
FROM SupplyChain
GROUP BY `Shipping carriers`
ORDER BY Avg_Shipping_Time ASC;

-- ============================================
-- Query 11: Transportation Mode Analysis
-- ============================================
SELECT
`Transportation modes`,
COUNT(*) AS Total_Shipments,
ROUND(SUM(`Revenue generated`),2) AS Revenue
FROM SupplyChain
GROUP BY `Transportation modes`
ORDER BY Revenue DESC;

-- ============================================
-- Query 12: Route Performance
-- ============================================
SELECT
Routes,
ROUND(SUM(`Revenue generated`),2) AS Revenue
FROM SupplyChain
GROUP BY Routes
ORDER BY Revenue DESC;

-- ============================================
-- Query 13: Defect Rate by Product Type
-- ============================================
SELECT
`Product type`,
ROUND(AVG(`Defect rates`),2) AS Avg_Defect_Rate
FROM SupplyChain
GROUP BY `Product type`
ORDER BY Avg_Defect_Rate DESC;

-- ============================================
-- Query 14: Manufacturing Cost Analysis
-- ============================================
SELECT
`Product type`,
ROUND(AVG(`Manufacturing costs`),2) AS Avg_Manufacturing_Cost
FROM SupplyChain
GROUP BY `Product type`
ORDER BY Avg_Manufacturing_Cost DESC;

-- ============================================
-- Query 15: Executive Summary Query
-- ============================================
SELECT
COUNT(DISTINCT SKU) AS Total_Products,
COUNT(DISTINCT `Supplier name`) AS Total_Suppliers,
ROUND(SUM(`Revenue generated`),2) AS Total_Revenue,
SUM(`Number of products sold`) AS Total_Products_Sold,
SUM(`Stock levels`) AS Total_Stock,
ROUND(AVG(`Lead times`),2) AS Avg_Lead_Time,
ROUND(AVG(`Defect rates`),2) AS Avg_Defect_Rate
FROM SupplyChain;