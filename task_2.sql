CREATE DATABASE Shop

USE Shop

CREATE TABLE Sellers(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Surname NVARCHAR(50),
City NVARCHAR(50)
)

CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Surname NVARCHAR(50),
City NVARCHAR(50)
)

CREATE TABLE Orders(
Id INT PRIMARY KEY IDENTITY,
OrderDate DATETIME NOT NULL,
Amount DECIMAL NOT NULL,
State BIT NOT NULL,
CustomerID INT FOREIGN KEY REFERENCES Customers(Id),
SellerID INT FOREIGN KEY REFERENCES Sellers(Id)
)

INSERT INTO Sellers (Name, Surname, City)
VALUES 
('John', 'Doe', 'New York'),
('Jane', 'Smith', 'Los Angeles'),
('Michael', 'Brown', 'Chicago'),
('Emily', 'Davis', 'Houston');


INSERT INTO Customers (Name, Surname, City)
VALUES 
('Alice', 'Johnson', 'New York'),
('Robert', 'Williams', 'Los Angeles'),
('David', 'Jones', 'Chicago'),
('Sarah', 'Miller', 'Houston');


INSERT INTO Orders (OrderDate, Amount, State, CustomerID, SellerID)
VALUES 
('2023-01-01 10:00:00', 100.00, 1, 1, 1),
('2023-02-01 11:00:00', 200.00, 0, 2, 2),
('2023-03-01 12:00:00', 900.00, 1, 3, 1)

SELECT SUM(Amount), Name FROM ORDERS 
JOIN Customers ON Customers.Id = Orders.CustomerID 
GROUP BY CustomerID, Name
HAVING SUM(Amount)>1000

SELECT * FROM Sellers
JOIN Customers ON Sellers.City= Customers.City

SELECT * FROM Orders
WHERE OrderDate BETWEEN 2024-01-10 AND GETDATE()

SELECT COUNT(SellerID), Name FROM Orders
JOIN Sellers ON Orders.SellerID = Sellers.Id
GROUP BY SellerID,Name
HAVING COUNT(CustomerID) > 10

SELECT COUNT(CustomerID), Name FROM ORDERS 
JOIN Customers ON Customers.Id = Orders.CustomerID 
GROUP BY CustomerID, Name 
ORDER BY COUNT(CustomerID) DESC




