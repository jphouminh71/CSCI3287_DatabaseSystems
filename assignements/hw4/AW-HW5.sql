-- Question One, show amount of rows in each table
use information_schema;
SELECT table_name AS 'TableName', table_rows as 'RowCount'
FROM TABLES
LIMIT 19;

-- Question Two
SELECT table_name AS 'tableName', column_name, column_key AS 'PrimaryKey'
FROM columns
WHERE column_key = 'PRI';

-- Question Three 
-- They naming convention they used is by adding a prefix of having 'Fact' or 'Dim' before the actual table name. 

-- Question Four
-- The defined relationship is useful for when an employee happens to be a manager and has employees under them
-- example, parent employee key would refer to an employees specific manager. 

-- Question Five 
-- What are the three types of models of bikes sold by AdventureWorks?
-- Mountain Bikes, Road Bikes, Touring Bikes

-- Question Six
-- Compare and rank the total counts of the bikes sold by AdventureWorks for each of the years 2001 – 2004 by color.
-- What was the most popular in these four years? 
-- In 2001, Red was the most popular 
-- In 2002, Red was also the most popular
-- In 2003, Black was the most popular 
-- In 2004, Black was also the most popular 
SELECT DT.CalendarYear AS 'SaleYear', DP.color AS 'Color', COUNT(DP.color) AS 'CountForColor' 
FROM DimProduct DP JOIN DimProductSubcategory DPS JOIN DimTime DT JOIN FactInternetSales FIS
ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
AND DPS.EnglishProductSubcategoryName LIKE '%bikes%'
AND FIS.orderDateKey = DT.Timekey
AND FIS.productkey = DP.productkey
GROUP BY 1,2 
ORDER BY 1,3 DESC;


-- Question Seven
-- List and compare the total sales volume (in dollars) of bikes sold (all model types) by customer state/province by year. 
-- Which 4 states/provinces showed the highest sales volume for each of the years from 2001 – 2004?
-- In 2001 (DESC) :  California, NewSouthWales, Victoria, England
-- In 2002 (DESC) :  California, NewSouthWales, British Columbia, England
-- In 2003 (DESC) :  California, England, NewSouthWales, Victoria
-- In 2004 (DESC) :  California, England, NewSouthWales, Washington
SELECT DT.CalendarYear AS 'Year' , DG.StateProvinceName AS 'Location' , SUM(FIS.SalesAmount) AS 'SumOfSalesInProvince'
FROM FactInternetSales FIS JOIN DimCustomer DC JOIN DimGeography DG JOIN DimProductSubcategory DPS JOIN DimProduct DP JOIN DimTime DT
ON FIS.CustomerKey = DC.CustomerKey
AND DC.GeographyKey = DG.GeographyKey
AND DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
AND FIS.ProductKey = DP.ProductKey
AND DPS.EnglishProductSubcategoryName LIKE '%bikes%'
AND DT.TimeKey = FIS.OrderDateKey
GROUP BY 1,2
ORDER BY 1,3 DESC; 


-- Question Eight
-- For the year 2002, which model of bike yielded the highest margin for AdventureWorks? 
-- Provide your SQL query, and your answer set along with your answer to the question.
SELECT DT.CalendarYear AS 'In 2002', MAX(FIS.UnitPrice - FIS.ProductStandardCost) AS 'MARGIN' , DP.ModelName AS 'ModelName'
FROM FactInternetSales FIS JOIN DimTime DT JOIN DimProduct DP
ON DP.ProductKey = FIS.ProductKey
AND FIS.OrderDateKey = DT.TimeKey
AND DP.ModelName in ('Road-150', 'Road-650', 'Mountain-100', 'Road-550-w', 'Road-250', 'Mountain-200')
AND DT.CalendarYear = 2002
GROUP BY 3
ORDER BY 2 DESC;