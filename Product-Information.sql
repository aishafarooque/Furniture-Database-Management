/*Customer Table*/
CREATE TABLE Customer (Customer_ID INTEGER, 
Customer_Name char(50), Customer_Address char(100), Customer_City char(50), Customer_State char(10), 
Customer_Postal_Code varchar(15), Customer_Email varchar(100), Customer_Username char(50), 
Customer_Password varchar(50), 
Primary Key (Customer_ID));

/*Order Table*/
CREATE TABLE Orders (Order_ID INTEGER, 
Order_Date DATE, Customer_ID INTEGER, Primary Key (Order_ID),
Foreign Key (Customer_ID) References Customer);

/*Product Line*/
CREATE TABLE Product_Line (Product_Line_ID INTEGER, 
Product_Line_Name char(50), Primary Key (Product_Line_ID));

/*Product Table*/
CREATE TABLE Product (Product_ID INTEGER, 
Product_Name char(30), Product_Finish char(50), 
Product_Standard_Price INTEGER,
Product_Photo varchar(50), Product_Line_ID INTEGER, 
Primary Key (Product_ID), 
Foreign Key (Product_Line_ID) References Product_Line);

/*Sales Territories*/
CREATE TABLE Sales_Territories (Territory_ID INTEGER, Territory_Name char(50), 
Primary Key (Territory_ID));

/*Sales Person*/
CREATE TABLE Salesperson (Salesperson_ID INTEGER,
Salesperson_Name char(50), Salesperson_Phone char(10), Salesperson_Email varchar(50), 
Salesperson_Username char(50), Salesperson_Password varchar(50), Territory_ID INTEGER,
Primary Key (Salesperson_ID), Foreign Key (Territory_ID) References Sales_Territories);

/*Price Updates*/
CREATE TABLE Price_Updates (Price_Update_ID INTEGER,
Date_Changed DATE, 
Old_Price INTEGER,
New_Price INTEGER, Primary Key (Price_Update_ID));

/*Does Business In*/
CREATE TABLE Does_Business_In (Customer_ID INTEGER, Territory_ID INTEGER,
Foreign Key (Customer_ID) References Customer, 
Foreign Key (Territory_ID) References Sales_Territories);

/*Order Line*/
CREATE TABLE Order_Line (Order_ID INTEGER, Product_ID INTEGER, Ordered_Quantity INTEGER, 
Sales_Price INTEGER, Foreign Key (Order_ID) References Orders, 
Foreign Key (Product_ID) References Product);

/*Product Line Sales Comparison Report*/
CREATE VIEW vw_Sales 
AS 
SELECT P.Product_ID, P.Product_Standard_Price, O.Ordered_Quantity
FROM Product P, Order_Line O;

SELECT * FROM vw_Sales;

/*Total Values for Product Report*/
CREATE VIEW vw_Values 
AS
SELECT O.Order_ID, P.Product_ID
FROM Orders O, Product P;
SELECT * FROM vw_Values;

/*Data for Customer Report*/
CREATE VIEW vw_Customer
AS
SELECT C.Customer_ID, P.Product_ID, P.Product_Name, P.Product_Standard_Price 
FROM Customer C, Product P;

SELECT * FROM vw_Customer;

/*Customer by States Shipment Report*/
CREATE VIEW vw_States 
AS
SELECT C.Customer_ID, C.Customer_Address, C.Customer_City,
C.Customer_State, C.Customer_Postal_Code
FROM Customer C;

SELECT * FROM vw_States;

/*Past Purchase History Report*/
CREATE VIEW vw_Purchase_History 
AS
SELECT C.Customer_ID, R.Order_Date, O.Ordered_Quantity, O.Sales_Price, P.Product_Name
FROM Customer C, Order_Line O, Product P, Orders R;

SELECT * FROM vw_Purchase_History;

/*Inserting values into tables*/
--Customer Table
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125',  'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#');
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', NULL, NULL, NULL);
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_City, Customer_State, Customer_Postal_Code, Customer_Email, Customer_UserName, Customer_Password)
VALUES (16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', NULL, NULL, NULL);

SELECT * FROM Customer C ORDER BY C.Customer_ID;

--Salespersons
INSERT INTO Salesperson (Salesperson_ID, Salesperson_Name, Salesperson_Phone, Salesperson_Email, Salesperson_Username, Salesperson_Password, Territory_ID)
VALUES (1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#',1);
INSERT INTO Salesperson (Salesperson_ID, Salesperson_Name, Salesperson_Phone, Salesperson_Email, Salesperson_Username, Salesperson_Password, Territory_ID)
VALUES (2, 'Robert Lewis', '8139264006', '', '', '', 2);
INSERT INTO Salesperson (Salesperson_ID, Salesperson_Name, Salesperson_Phone, Salesperson_Email, Salesperson_Username, Salesperson_Password, Territory_ID)
VALUES (3, 'William Strong', '5053821212', '', '', '', 3);
INSERT INTO Salesperson (Salesperson_ID, Salesperson_Name, Salesperson_Phone, Salesperson_Email, Salesperson_Username, Salesperson_Password, Territory_ID)
VALUES (4, 'Julie Dawson', '4355346677', '', '', '', 4);
INSERT INTO Salesperson (Salesperson_ID, Salesperson_Name, Salesperson_Phone, Salesperson_Email, Salesperson_Username, Salesperson_Password, Territory_ID)
VALUES (5, 'Jacob Winslow', '2238973498', '', '', '', 5);

SELECT * FROM Salesperson;

--Sales Territories
INSERT INTO Sales_Territories (Territory_ID, Territory_Name)
VALUES (1, 'SouthEast');
INSERT INTO Sales_Territories (Territory_ID, Territory_Name)
VALUES (2, 'SouthWest');
INSERT INTO Sales_Territories (Territory_ID, Territory_Name)
VALUES (3, 'NorthEast');
INSERT INTO Sales_Territories (Territory_ID, Territory_Name)
VALUES (4, 'NorthWest');
INSERT INTO Sales_Territories (Territory_ID, Territory_Name)
VALUES (5, 'Central');

SELECT * FROM Sales_Territories;

--Does Business In
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (1, 1);
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (2, 2);
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (3, 3);
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (4, 4);
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (5, 5);
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (6, 1);
INSERT INTO Does_Business_In (Customer_ID, Territory_ID)
VALUES (7, 2);

SELECT * FROM Does_Business_In;

--Product
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (1, 'End Table', 'Cherry', 175, 'table.jpg', 1);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (2, 'Coffee Table', 'Natural Ash', 200, '', 2);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (3, 'Computer Desk', 'Natural Ash', 375, '', 2);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (4, 'Entertainment Center', 'Natural Maple', 650, '', 3);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (5, 'Writers Desk', 'Cherry', 325, '', 1);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (6, '8-Drawer Desk', 'White Ash', 750, '', 2);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (7, 'Dining Table', 'Natural Ash', 800, '', 2);
INSERT INTO Product (Product_ID, Product_Name, Product_Finish, Product_Standard_Price, Product_Photo, Product_Line_ID)
VALUES (8, 'Computer Desk', 'Walnut', 250, '', 3);

SELECT * FROM Product;

--Product Line
INSERT INTO Product_Line (Product_Line_ID, Product_Line_Name)
VALUES (1, 'Cherry Tree');
INSERT INTO Product_Line (Product_Line_ID, Product_Line_Name)
VALUES (2, 'Scandinavia');
INSERT INTO Product_Line (Product_Line_ID, Product_Line_Name)
VALUES (3, 'Country Look');

SELECT * FROM Product_line;

--Orders
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1001, '21/Aug/16', 1);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1002, '21/Jul/16', 8);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1003, '22/ Aug/16', 15);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1004, '22/Oct/16', 5);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1005, '24/Jul/16', 3);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1006, '24/Oct/16', 2);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1007, '27/ Aug/16', 5);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1008, '30/Oct/16', 12);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1009, '05/Nov/16', 4);
INSERT INTO Orders (Order_ID, Order_Date, Customer_ID)
VALUES (1010, '05/Nov/16', 1);

SELECT * FROM Orders;

--Order Line
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1001, 1, 2, 175);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1001, 2, 2, 200);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1001, 4, 1, 650);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1002, 3, 5, 375);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1003, 3, 3, 375);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1004, 6, 2, 750);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1004, 8, 2, 250);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1005, 4, 4, 650);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1006, 4, 1, 650);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1006, 5, 2, 325);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1006, 7, 2, 800);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1007, 1, 3,175);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1007, 2, 2, 200);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1008, 3, 3, 375);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1008, 8, 3, 250);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1009, 4, 2, 650);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1009, 7, 3, 800);
INSERT INTO Order_Line (Order_ID, Product_ID, Ordered_Quantity, Sales_Price)
VALUES (1010, 8, 10, 250);

SELECT * FROM Order_Line;

--Price Updates
DESCRIBE Price_Updates;

/*Part 3*/

--1. Which products have a standard price of less than $ 275? 
SELECT P.Product_Name, P.Product_Standard_Price
FROM Product P
WHERE P.Product_Standard_Price < 275;

--2. List the unit price, product name, and product ID for all products in the Product table. 
SELECT P.Product_Standard_Price, P.Product_Name, P.Product_ID
FROM Product P;

--3. What is the average standard price for all products in inventory? 
SELECT AVG(P.Product_Standard_Price)
FROM Product P, Order_Line O
WHERE O.Product_ID = P.Product_ID;

--4. How many different items were Ordered on Orders number 1004?
SELECT COUNT(*)
FROM  Order_Line O
WHERE O.Order_ID = 1004;

--5. Which Orders have been placed since 10/24/2010? 
SELECT *
FROM Orders O
WHERE O.Order_Date > '24/Sep/10';

--6. What furniture does COSC3380 carry that isnt made of cherry? 
SELECT *
FROM Product P
WHERE NOT P.Product_Finish = 'Cherry';

--7. List product name, finish, and standard price for all desks and all tables that cost more than $ 300 in the Product table. 
SELECT P.Product_Name, P.Product_Finish, P.Product_Standard_Price
FROM Product P
WHERE P.Product_Standard_Price > 300;


--8. Which products in the Product table have a standard price between $ 200 and $ 300? 
SELECT *
FROM Product P
WHERE P.Product_Standard_Price BETWEEN 200 AND 300;

--9. List customer, city, and state for all customers in the Customer table whose address is Florida, Texas, California,
--or Hawaii. List the customers alphabetically by state and alphabetically by customer within each state. 
SELECT C.Customer_ID, C.Customer_Name, C.Customer_City, C.Customer_State
FROM Customer C
WHERE C.Customer_State = 'FL' OR C.Customer_State = 'TX' OR C.Customer_State = 'CA' OR C.Customer_State = 'HI'
ORDER BY C.Customer_State;

--10.Count the number of customers with addresses in each state to which we ship. 
SELECT C.Customer_State, COUNT(*)
FROM Customer C
GROUP BY (C.Customer_State);

--11. Count the number of customers with addresses in each city to which we ship. List the cities by state. 
SELECT C.Customer_City, C.Customer_State, COUNT(*)
FROM Customer C
GROUP BY C.Customer_City, C.Customer_State;

--12. Find only states with more than one customer. 
SELECT C.Customer_State
FROM Customer C
GROUP BY C.Customer_State
HAVING COUNT(C.Customer_State) > 1;

--13. List, in alphabetical Orders, the product finish and the average standard price for each finish for selected 
--finishes having an average standard price less than 750. 
SELECT P.Product_Finish, AVG(P.Product_Standard_Price)
FROM Product P
GROUP BY P.Product_Finish
HAVING AVG(P.Product_Standard_Price) < 750
ORDER BY P.Product_Finish ASC;

--14. What is the total value of Orders placed for each furniture product? 
SELECT P.Product_Name, SUM(P.Product_Standard_Price)
FROM Product P, Order_Line O
WHERE O.Product_ID = P.Product_ID
GROUP BY P.Product_Name;
