-- Total Revenue per Pharmacy
SELECT p.name AS Pharmacy,
       SUM(s.total_amount) AS Total_Revenue,
       COUNT(s.sale_id) AS Total_Sales
FROM Sales s
JOIN Pharmacy p ON s.pharmacy_id = p.pharmacy_id
GROUP BY p.name
ORDER BY Total_Revenue DESC;

-- Top 10 Selling Medicines
SELECT m.name AS Medicine,
       SUM(si.quantity) AS Units_Sold,
       SUM(si.quantity * si.price) AS Revenue
FROM Sale_Items si
JOIN Medicine m ON si.medicine_id = m.medicine_id
GROUP BY m.name
ORDER BY Units_Sold DESC
LIMIT 10;

-- Supplier Contribution to Inventory Cost
SELECT sup.name AS Supplier,
       SUM(ms.supply_price * m.stock_quantity) AS Total_Supply_Cost
FROM Medicine_Supplier ms
JOIN Supplier sup ON ms.supplier_id = sup.supplier_id
JOIN Medicine m ON ms.medicine_id = m.medicine_id
GROUP BY sup.name
ORDER BY Total_Supply_Cost DESC;

-- Sales Breakdown by Medicine Type
SELECT m.type AS Medicine_Type,
       SUM(si.quantity) AS Total_Units_Sold,
       SUM(si.quantity * si.price) AS Total_Revenue
FROM Sale_Items si
JOIN Medicine m ON si.medicine_id = m.medicine_id
GROUP BY m.type
ORDER BY Total_Revenue DESC;

-- Monthly Sales Trend
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS Month,
       SUM(s.total_amount) AS Revenue,
       COUNT(s.sale_id) AS Sales_Count
FROM Sales s
GROUP BY Month
ORDER BY Month;

-- Medicines Running Low on Stock (for alerts)
SELECT name, brand, stock_quantity
FROM Medicine
WHERE stock_quantity < 200
ORDER BY stock_quantity ASC;

-- High-Value Sales (for monitoring big orders)
SELECT s.sale_id, c.first_name, c.last_name, p.name AS Pharmacy,
       s.sale_date, s.total_amount, e.first_name AS Employee
FROM Sales s
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Pharmacy p ON s.pharmacy_id = p.pharmacy_id
JOIN Employee e ON s.employee_id = e.employee_id
WHERE s.total_amount > 20
ORDER BY s.total_amount DESC;

-- Expiring Medicines in Next 6 Months
SELECT name, brand, expiry_date,
       DATEDIFF(expiry_date, CURDATE()) AS Days_Left
FROM Medicine
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
ORDER BY expiry_date;

-- Employee Sales Performance
SELECT e.first_name, e.last_name,
       SUM(s.total_amount) AS Revenue,
       COUNT(s.sale_id) AS Sales_Count,
       AVG(s.total_amount) AS Avg_Sale
FROM Employee e
LEFT JOIN Sales s ON e.employee_id = s.employee_id
GROUP BY e.employee_id
ORDER BY Revenue DESC;


-- Customers with Highest Spending (for a table or leaderboard)
SELECT c.first_name, c.last_name,
       SUM(s.total_amount) AS Total_Spent,
       COUNT(s.sale_id) AS Purchases
FROM Customer c
JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY Total_Spent DESC
LIMIT 10;