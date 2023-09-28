#SELECT CLAUSE 
SELECT * FROM Orders$
SELECT [Order ID]
FROM
Orders$

SELECT [Order ID] As ID, Segment As SEG,Sales
FROM
Orders$

SELECT 
[Order ID] As ID, 
Segment    As SEG,
Sales      AS Total_Sales,
Profit     AS Total_Profit
FROM
Orders$


#WithouT AS
SELECT 
[Order ID]  ID, 
Segment SEG,
Sales   Total_Sales,
Profit  Total_Profit
FROM
Orders$

#WHERE CLAUSE--Filter the data ?It filter the row
SELECT 
[Order ID] As ID, 
Segment    As SEG,
Sales      AS Total_Sales,
Profit     AS Total_Profit
FROM
Orders$
Where Segment='Corporate'

#AND Condition
SELECT 
[Order ID] As ID, 
Segment    As SEG,
Sales      AS Total_Sales,
Profit     AS Total_Profit
FROM
Orders$
Where Segment='Corporate' AND Sales > 1000 AND Profit > 1000


#OR CONDITION
SELECT 
[Order ID] As ID, 
Segment    As SEG,
Sales      AS Total_Sales,
Profit     AS Total_Profit
FROM
Orders$
Where Segment='Corporate' OR Segment ='Home Office'

#IN CONDITION--- Write multiple condition With "IN" Condition replace of OR
SELECT 
[Order ID] As ID, 
Segment    As SEG,
Sales      AS Total_Sales,
Profit     AS Total_Profit
FROM
Orders$
Where Segment IN ('Corporate','Home Office') 

#NOT IN
SELECT 
[Order ID] As ID, 
Segment    As SEG,
Sales      AS Total_Sales,
Profit     AS Total_Profit
FROM
Orders$
Where Segment NOT IN ('Corporate','Home Office') 



Select * from Orders$
SELECT
Sales
FROM Orders$
WHERE Region IN ('South','West')


#Sequence should follow

SELECT
[State]
WHERE Country IN ('United States')
FROM Oreders$





#Date - 20 july 2023
#DDL  Command Data define language
#Interview point of question 
#Under DDL
#1)CREATE 
#2)INSERT

#NVARCHAR---String values
#CHAR SE VARCHAR GYA TOH OPTIMIZE HUA


Create Table SUNSTONE
( ID nvarchar(255) ,Name nvarchar(50), City nvarchar(255) , Sales int )

SELECT * FROM SUNSTONE

#INSERT 
INSERT INTO SUNSTONE 
(ID,Name,City,Sales)
VALUES
(1,'Aditi','Bhilai',100)


INSERT INTO SUNSTONE 
(ID,Name,City,Sales)
VALUES
(2,'Aditi','Bhilai',100),
(3,'Nath','Bhilai',100)




#NULL And Is not null use with where clause

#Date- 27-07-23

#DELETE Commands (#dml coomand data manupulation command)-EFFECT ROW
SELECT * FROM SUNSTONE

DELETE FROM SUNSTONE WHERE NAME = "Nath"

#DROP Command -- ddl command DATA DEFINATION LANGUAGE  (it delete wholw complete structure pura table delete ho jyga)

DROP TABLE SUNSTONE

#Update --- dml---EFFECT ROW-

UPDATE SUNSTONE 
SET Sales = 150 WHERE Name ='Aditi'

#HW - Like operator where k sath kam karta hai -regular expression 

#ALTER - DDL--(Alter and modify the structure of table to mofiy columns )

ALTER TABLE SUNSTONE
ADD Marks int

#ALTER DROP COMBINATION --- Yaha coloumn mention karna pdega
ALTER TABLE SUNSTONE
DROP COLUMN Marks

#TRUNCATE--sare values delete kar dega -- structure wahi rahega like column lekin uske andar ka record delete kar dega

#HW Which is faster DROP/DELETE/TRUNCATE

#Grant--- give access priveleges (DCL COMMAND DAta control languge) ---(kisko kya permission dene hai)
#REVOKE --- (Back permisiion)---

#TCL COMMAND (transactional control command)

#ROLLBACK ---(TCL COMMAND)----  UNDO the transaction (jaise google pay se paise bech m atak jata hai toh  rollbackuse hota hai
#SAVEPOINT ---(TCL COMMAND)---- SAVEPOINT Within a transaction (eg agar download 50% m ruk gya toh phr se 50% se resume hoga)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----Aggregate Function = It help to perform arthmatic operation in numerical column
----Arthmatic operation include:
---SUM()
---MAX()
---MIN()
---AVG()
---COUNT()

---SUM() = It bacically sum the non null values 
SELECT * FROM Orders$


---SUM Function = calculate the sum of numeric value

---GROUP BY = It aggregate the value
----It take dimenstion/Qualitative data 
----Group By should main data source name not rename name after alias
---It alaways comes after FROM


SELECT 
City,
Region As REGION,
SUM(SALES) AS Total_Sales
FROM Orders$
GROUP BY City,Region


----Ques1= Give me sum of sales and sum of profit by region
---Jaisa hum select k bad dalenge wahi rank follow karega soorder k dhyan rhkna hai 
SELECT
Region,
SUM(SALES)  AS Total_Sales,
SUM(Profit) As Total_Profit
FROM Orders$
GROUP BY Region

---Problem Statemnet = Total Sales and Profit by Region and Category & Region East And West & Profit>10000
SELECT 
Category,
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
GROUP BY Category,Region
HAVING  Region IN ('East' , 'West') AND SUM(Profit)>10000


------------------------------Think to Remember---------------------------------
-------------------Aggregate function not work with where clause-----------------
SELECT 
Category,
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
WHERE Region IN ('East' , 'West') AND SUM(Profit)>10000
GROUP BY Category,Region

--------------It will work because we do not use any aggregate funcion ar where ka kam existing data mai filter karna hota hai-------
SELECT 
Category,
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
WHERE Region IN ('East' , 'West')
GROUP BY Category,Region


----------------------***************************************------------------------

---HAVING = It also work as a filter
---But it work with aggregate column
---It comes after Group BY


----Order By ---Sort the data ---It comes after Having 
SELECT 
Category,
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
WHERE Region IN ('East' , 'West')
GROUP BY Category,Region
ORDER BY Region ASC, Total_Profit DESC

----Real life mai ORDER BY ko 1,2 column index se likhte hai 
SELECT 
Category,
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
WHERE Region IN ('East' , 'West')
GROUP BY Category,Region
ORDER BY 2 DESC,3 DESC

-----OR We can write---
SELECT 
Category,
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
WHERE Region IN ('East' , 'West')
GROUP BY Category,Region
ORDER BY 2 ,3 DESC



---Problem Statement

SELECT
Region,
Category,
SUM(Sales) AS Total_Sales,
AVG(Profit) AS Total_Profit
FROM Orders$
GROUP BY Region, Category
HAVING Region IN ('East','West') AND AVG(Sales)>1000 And Sum(Profit) >1000

---Condition satisfy nhi ho raha tha karke avg profit 10 liya otherwise 1000 ke upar koi data he nhi h
SELECT 
Region,
Category,
SUM(Sales)  AS Total_Sales,
AVG(Profit) AS Total_Profit
FROM Orders$
GROUP BY 
Category,Region
HAVING
Region IN ('West','South') AND SUM(Sales) > 1000 AND AVG(Profit) > 10

---Negative Profit 
SELECT 
Region,
Category,
SUM(Sales)  AS Total_Sales,
AVG(Profit) AS Total_Profit
FROM Orders$
GROUP BY
Category,Region
HAVING 
AVG(Profit)<0
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
Region,
Category,
SUM(Sales) AS Total_Sales,
AVG(Profit) AS Total_Profit
FROM Orders$
GROUP BY Region, Category
HAVING Region IN ('East','West') AND AVG(Sales)>1000 And Sum(Profit) >1000



---------------Send To Sir------------------------------------------
SELECT * FROM Orders$

----GROUP BY-----
Select
Region,
SUM(Profit)  Profit, 
SUM(Sales)   Total_Sales 
From Orders$ 
Group by Region


SELECT 
City As CITY,
REGION As Region,
SUM(SALES) As TOTAL_SALES
FROM
Orders$
GROUP BY
City, REGION

----HAVING CLAUSE----
SELECT 
REGION As Region,
Category,
SUM(SALES) AS Total_Sales,
SUM(Profit) As Total_Profit
FROM
Orders$
WHERE Region IN ('EAST','WEST') ---AND Profit > 1000
Group by
REGION,
Category
HAVING SUM(Profit) > 10000 

----ORDER BY CLAUSE----
SELECT 
Category,
Region,
SUM(Sales)  AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders$
WHERE Region IN ('East' , 'West')
GROUP BY Category,Region
ORDER BY Region, Total_Profit DESC


SELECT 
REGION As Region,
Category,
SUM(SALES) AS Total_Sales,
SUM(Profit) As Total_Profit
FROM
Orders$
WHERE Region IN ('EAST','WEST') ---AND Profit > 1000
Group by
REGION,
Category
HAVING SUM(Profit) > 10000 
Order by 1,2,3,4


------------------------------------------------------------------------------
CREATE TABLE Car
( CarID INT,
  CarName VARCHAR(100) );

INSERT INTO Car VALUES (101, 'Mercedes-Benz');
INSERT INTO Car VALUES (201, 'BMW');
INSERT INTO Car VALUES (301, 'Ferrari');
INSERT INTO Car VALUES (401, 'Lamborghini');
INSERT INTO Car VALUES (501,'Porsche');

SELECT * FROM Car

CREATE TABLE CarDescription
(  CarID INT,
   CarDescription VARCHAR(800) );

INSERT INTO CarDescription VALUES (101,'Luxury vehicle from the German automotive');
INSERT INTO CarDescription VALUES (201,'Luxury motorcycle from the German automotive');
INSERT INTO CarDescription VALUES (301,'Luxury sports car from the Italian manufacturer');

SELECT * FROM CarDescription;
SELECT C.CarID, C.CarName, CD.CarDescription
FROM CAR C
LEFT OUTER JOIN
CarDescription CD
ON 
C.CARID = CD.CarID

SELECT * FROM Orders$
SELECT TOP 25 
[Order ID] ,Sales,Profit
FROM Orders$

SELECT DISTINCT [Order ID] 
FROM Orders$

SELECT COUNT(DISTINCT [Order ID]) AS Count_ID 
FROM Orders$

SELECT DISTINCT TOP 5 [Order ID] 
AS Count_Oreder_ID
FROM Orders$

SELECT DISTINCT TOP 15 [Order ID] , Segment,  Sales
AS Count_Order_ID
FROM Orders$
WHERE Profit>100

SELECT DISTINCT TOP (15)  
[Order Id], 
[Segment], 
[Category],
[Profit]
FROM
Orders$
WHERE 
Profit >1000

SELECT DISTINCT TOP (15)  
[Order Id], 
DISTINCT [Segment], 
[Category],
[Profit]
FROM
Orders$
WHERE 
Profit >1000

SELECT  [Order ID], [Ship Date], [Order Date]  
FROM Dbo.Orders$
Order By [Ship Date] Desc
OFFSET 10 rows;

Create Table Employee_1
       ( ID int, Employee_Name nvarchar(255), Department nvarchar(255), Salary int, Gender nvarchar(255) );


Insert into Employee_1
( [ID], [Employee_Name], [Department], [Salary], Gender ) Values (1, 'John' , 'HR' , 1000, 'Male' )

Insert into Employee_1
 ( [ID], [Employee_Name], [Department], [Salary], Gender ) Values (2, 'Amrit' ,'MARKETING', 2000,'Male' )

Insert into Employee_1
 ( [ID], [Employee_Name], [Department], [Salary], Gender ) Values (3, 'Alex' , 'HR' , 3000 ,'Male')

Insert into Employee_1
 ( [ID], [Employee_Name], [Department], [Salary], Gender ) Values (4, 'Garima' , 'MARKETING' , 4000, 'Male')

Insert into Employee_1
( [ID], [Employee_Name], [Department], [Salary], Gender) Values (5, 'Varun' , 'IT' ,5000, 'Male' )

SELECT *
FROM Customers
WHERE Age = (SELECT MIN(Age) FROM Customers)

---Sub query
SELECT [Employee_Name],(Salary) As Max_Salary
FROM 
Employee_1
WHERE Salary = (SELECT MAX(SALARY) FROM Employee_1)


---not equal sub query ---find top employee
SELECT [Employee_Name], Salary
FROM
Employee_1 
WHERE SALARY =
(
SELECT MAX(SALARY)
FROM
Employee_1
WHERE Salary <> (SELECT MAX(SALARY) FROM Employee_1));


SELECT TOP 1 [Employee_Name], Salary
FROM
Employee_1 
WHERE SALARY =
(
SELECT MAX(SALARY)
FROM
Employee_1
HAVING Salary <> (SELECT MAX(SALARY)))


SELECT  Employee_Name, Salary
FROM Employee_1
ORDER BY Salary DESC
OFFSET 1 ROW LIMIT 1


SELECT * FROM Car
SELECT * FROM CarDescription


CREATE PROCEDURE Sp_Top5 
AS
BEGIN
SELECT TOP 5 [Order ID], Segment, Sales
From 
Orders
order by 3 DESC

END

Create Procedure SP_Top10
As
Begin
SELECT Top 10 [Order ID], SEGMENT, Sales
FROM
Orders$ 
order by 3 Desc
END 


----Reduce the resdusability
---Remove complexity
---Security of data 


---Store procedure is a sql code  that can be reused over and over again 

--Method to call store procedure

EXECUTE SP_Top10
SP_Top10

---Alter procedure
Alter procedure SP_Top10




---Sp_Rename 'Sp_Top10' , 'Sp_Top15'

---Store procedure with parameter ---hw



---Views
--View- it use for security purpose it is simple virtuAL Table yeh physical store nhi hota h 

Create View HR_SAL
As
SELECT *
FROM
Employee_1
Where Department ='HR'

Create Procedure HR_SAL_EMP
As
Begin
SELECT *
FROM
Employee_1
Where Department ='HR'
End

SELECT * FROM HR_SAL

--VIEW MAI CRUD OPERATION AVAILAIBLE HAI
---LKN PROCEDURE PRE DEFINE H ISME ALTER KARNA PADEGA
---Storage bhi nhi le rha

---View limited data h 


---Merit of view
---little storage temproray storage hota h
---Ease of business user

---TWO TABLE

Simple table --- single table
complex view - Multiple table basically use in join
distinct k sath nhi bana sakte



