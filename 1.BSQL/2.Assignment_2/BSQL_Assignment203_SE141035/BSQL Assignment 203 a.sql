use [AdventureWorks2008R2]

--1
select ProductID, Name,Color,ListPrice
from Production.Product

--2
select ProductID, Name,Color,ListPrice
from Production.Product
where ListPrice <> 0

--3
select ProductID, Name,Color,ListPrice
from Production.Product
where Color is null

--4
select ProductID, Name,Color,ListPrice
from Production.Product
where Color is not null

--5
select ProductID, Name,Color,ListPrice
from Production.Product
where Color is not null and ListPrice <> 0

--6
select Name + ' : ' + Color as 'Name And Color'
from Production.Product
where Color is not null

--7
select 'Name: ' + Name + ' -- COLOR: ' + Color as 'Name And Color'
from Production.Product
where Color is not null

--8
select ProductID, Name
from Production.Product
where ProductID between 400 and 500

--9
select ProductID, Name, Color
from Production.Product
where Color in('black','blue')

--10
select Name, ListPrice
from Production.Product
where Name like 'S%'
order by Name

--11
select Name, ListPrice
from Production.Product
where Name like 'S%' or Name like 'A%'
order by Name

--12
select Name, ListPrice
from Production.Product
where Name like 'SPO[^K]%' 
order by Name

--13
select distinct Color
from Production.Product

--14
select distinct ProductSubcategoryID, Color
from Production.Product
where ProductSubcategoryID is not null and Color is not null
order by ProductSubcategoryID, Color desc

--15
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice
FROM Production.Product
WHERE Color IN ('Red','Black')
      AND ProductSubCategoryID = 1
      OR ListPrice BETWEEN 1000 AND 2000
ORDER BY ProductID

--16
select Name, isnull(Color,'Unknown') as Color, ListPrice
from Production.Product
