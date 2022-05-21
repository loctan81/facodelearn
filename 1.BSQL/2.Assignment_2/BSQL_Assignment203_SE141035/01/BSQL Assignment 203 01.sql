use [AdventureWorks2008R2]

--query 1
select ProductID, Name,Color,ListPrice
from Production.Product

--query 2
select ProductID, Name,Color,ListPrice
from Production.Product
where ListPrice <> 0

--query 3
select ProductID, Name,Color,ListPrice
from Production.Product
where Color is null

--query 4
select ProductID, Name,Color,ListPrice
from Production.Product
where Color is not null

--query 5
select ProductID, Name,Color,ListPrice
from Production.Product
where Color is not null and ListPrice <> 0

--query 6
select Name + ' : ' + Color as 'Name And Color'
from Production.Product
where Color is not null

--query 7
select 'Name: ' + Name + ' -- COLOR: ' + Color as 'Name And Color'
from Production.Product
where Color is not null

--query 8
select ProductID, Name
from Production.Product
where ProductID between 400 and 500

--query 9
select ProductID, Name, Color
from Production.Product
where Color in('black','blue')

--query 10
select Name, ListPrice
from Production.Product
where Name like 'S%'
order by Name

--query 11
select Name, ListPrice
from Production.Product
where Name like 'S%' or Name like 'A%'
order by Name

--query 12
select Name, ListPrice
from Production.Product
where Name like 'SPO[^K]%' 
order by Name

--query 13
select distinct Color
from Production.Product

--query 14
select distinct ProductSubcategoryID, Color
from Production.Product
where ProductSubcategoryID is not null and Color is not null
order by ProductSubcategoryID, Color desc

--query 15
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice
FROM Production.Product
WHERE Color IN ('Red','Black')
      AND ProductSubCategoryID = 1
      OR ListPrice BETWEEN 1000 AND 2000
ORDER BY ProductID

--query 16
select Name, isnull(Color,'Unknown') as Color, ListPrice
from Production.Product
