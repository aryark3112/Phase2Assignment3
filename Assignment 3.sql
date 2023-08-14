CREATE DATABASE Assignment3DbJoin
USE Assignment3DbJoin

---PART 1---
CREATE TABLE CompanyInfo (
Cld INT PRIMARY KEY,
CName VARCHAR(50)
)
INSERT INTO CompanyInfo (Cld, CName)
VALUES
(1, 'SamSung'),
(2, 'HP'),
(3, 'Apple'),
(4, 'Dell'),
(5, 'Toshiba'),
(6, 'Redmi')

CREATE TABLE ProductInfo (
PId INT PRIMARY KEY,
PName VARCHAR(50),
PPrice DECIMAL(10, 2),
PMDate DATE,
CId INT,
FOREIGN KEY (CId) REFERENCES CompanyInfo(Cld)
)
INSERT INTO ProductInfo (PId, PName, PPrice, PMDate, CId)
VALUES
(101, 'Laptop', 55000.90, '2023-12-12', 1),
(102, 'Laptop', 35000.90, '2023-12-12', 2),
(103, 'Mobile', 15000.90, '2023-12-12', 2),
(104, 'Laptop', 13500.90, '2023-12-12', 3),
(105, 'Mobile', 65000.90, '2023-12-12', 3),
(106, 'Laptop', 35000.90, '2023-12-12', 5),
(107, 'Mobile', 35000.90, '2023-12-12', 5),
(108, 'Earpod', 1000.90, '2023-12-12', 3),
(109, 'Laptop', 85000.90, '2023-12-12', 6),
(110, 'Mobile', 55000.70, '2023-12-12', 1)

SELECT CName, PId, PName, PPrice, PMDate
FROM CompanyInfo JOIN ProductInfo ON CompanyInfo.Cld = ProductInfo.CId
ORDER BY CName

SELECT PName, CName
FROM ProductInfo JOIN CompanyInfo ON ProductInfo.CId = CompanyInfo.Cld
ORDER BY PName

SELECT CName, PName FROM CompanyInfo
CROSS JOIN ProductInfo ORDER BY CName, PName

---PART 2---

CREATE TABLE Products (
PId INT PRIMARY KEY,
PQ INT,
PPrice DECIMAL(10, 2),
Discount DECIMAL(5, 2)
)
INSERT INTO Products (PId, PQ, PPrice, Discount)
VALUES
(1, 5, 100.00, 10.00),
(2, 10, 200.00, 15.00),
(3, 3, 150.00, 5.00)

SELECT PId,PQ,PPrice,Discount, 
PPrice * PQ AS TotalPrice,
PPrice * PQ - (PPrice * PQ * Discount / 100) AS PriceAfterDiscount
FROM Products
