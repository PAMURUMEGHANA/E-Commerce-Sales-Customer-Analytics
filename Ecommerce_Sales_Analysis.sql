-- ============================================
-- E-Commerce Sales Analysis
-- SQL Project
-- ============================================

USE ecommerce_analytics;

-- 1. Total Records
SELECT COUNT(*) AS Total_Records
FROM ecommerce_analytics.ecommerce_sales;

-- 2. Total Revenue
SELECT SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales;

-- 3. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_analytics.ecommerce_sales;

-- 4. Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM ecommerce_analytics.ecommerce_sales;

-- 5. Total Quantity
SELECT SUM(Quantity) AS Total_Quantity
FROM ecommerce_analytics.ecommerce_sales;

-- 6. Average Order Value
SELECT ROUND(
    SUM(Sales_Amount) / COUNT(DISTINCT Order_ID), 2
) AS Average_Order_Value
FROM ecommerce_analytics.ecommerce_sales;

-- 7. Top 10 Products by Revenue
SELECT Product, SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 8. Category Performance
SELECT Category,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Quantity) AS Total_Quantity,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- 9. Top 10 Customers
SELECT Customer_ID, Customer_Name,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 10. Top 10 Cities
SELECT City,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY City
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 11. Monthly Sales Trend
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;

-- 12. State-wise Sales
SELECT State,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY State
ORDER BY Total_Revenue DESC;

-- 13. Order Status Analysis
SELECT Order_Status,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY Order_Status
ORDER BY Total_Orders DESC;

-- 14. Payment Mode Analysis
SELECT Payment_Mode,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY Payment_Mode
ORDER BY Total_Revenue DESC;

-- 15. Top 10 Products by Quantity
SELECT Product,
       SUM(Quantity) AS Total_Quantity,
       SUM(Sales_Amount) AS Total_Revenue
FROM ecommerce_analytics.ecommerce_sales
GROUP BY Product
ORDER BY Total_Quantity DESC
LIMIT 10;