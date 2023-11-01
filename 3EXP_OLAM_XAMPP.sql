Creation of Table:
CREATE TABLE Products (
 ProductID INT PRIMARY KEY,
 ProductName VARCHAR(50)
);
CREATE TABLE Regions (
 RegionID INT PRIMARY KEY,
 RegionName VARCHAR(50)
);
CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR(50)
);
CREATE TABLE SalesData_Fact (
 SaleID INT PRIMARY KEY,
 SalesDate DATE,
 ProductID INT,
 RegionID INT,
 CustomerID INT,
 SalesAmount DECIMAL(10, 2),
 Profit DECIMAL(10, 2),
 FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
 FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
Insertion of Value in tables:
INSERT INTO Products (ProductID, ProductName)
VALUES
 (1, 'ProductA'),
 (2, 'ProductB'),
 (3, 'ProductC');
INSERT INTO Regions (RegionID, RegionName)
VALUES
 (1, 'Region1'),
 (2, 'Region2');
INSERT INTO Customers (CustomerID, CustomerName)
VALUES
 (1, 'Customer1'),
 (2, 'Customer2'),
 (3, 'Customer3');
INSERT INTO SalesData_Fact (SaleID, SalesDate, ProductID, RegionID, CustomerID,
SalesAmount, Profit)
VALUES
 (1, '2023-07-01', 1, 1, 1, 1000.00, 200.00),
 (2, '2023-07-02', 2, 2, 2, 500.00, 100.00),
 (3, '2023-07-03', 1, 1, 3, 800.00, 150.00),
 (4, '2023-07-04', 3, 2, 1, 1200.00, 300.00),
 (5, '2023-07-05', 1, 1, 2, 600.00, 120.00),
 (6, '2023-07-06', 2, 2, 3, 700.00, 140.00);
B.1 Input and Output:
Input :
SQL commands/script
RollUp:
SELECT ProductID, SUM(SalesAmount) AS TotalSales, SUM(Profit) AS TotalProfit,
 (SUM(Profit) / SUM(SalesAmount)) * 100 AS ProfitMargin
FROM SalesData_Fact
GROUP BY ProductID;
Drill-Down:
SELECT CustomerID, ProductID, SUM(SalesAmount) AS TotalSales
FROM SalesData_Fact
GROUP BY CustomerID, ProductID;
Dice:
SELECT SalesDate, SalesAmount
FROM SalesData_Fact
WHERE ProductID = 1 AND RegionID = 1;
Slice:
SELECT SalesDate, ProductID, SalesAmount
FROM SalesData_Fact
WHERE RegionID = 1;
Pivot:
SELECT RegionID,
 MAX(CASE WHEN ProductID = 1 THEN SalesAmount ELSE NULL END) AS
ProductA_Sales,
 MAX(CASE WHEN ProductID = 2 THEN SalesAmount ELSE NULL END) AS
ProductB_Sales,
 MAX(CASE WHEN ProductID = 3 THEN SalesAmount ELSE NULL END) AS
ProductC_Sales
FROM SalesData_Fact
GROUP BY RegionID;
