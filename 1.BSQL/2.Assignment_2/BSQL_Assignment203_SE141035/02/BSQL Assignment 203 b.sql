--query 1
select count(*)
from Production.Product

--query 2
select count(*) as 'HasSubCategoryID'
from Production.Product
where ProductSubcategoryID is not null

--query 3
select ProductSubcategoryID, count(*) as CountedProducts
from Production.Product
group by ProductSubcategoryID

--query 4
select count(ProductID) - count(ProductSubcategoryID)
from Production.Product

select count(ProductID) as NoSubCat
from Production.Product
where ProductSubcategoryID is null

--query 5
select ProductID, sum(Quantity) as TheSum
from Production.ProductInventory
group by ProductID

--query 6
select ProductID, sum(Quantity) as TheSum
from Production.ProductInventory
where LocationID = 40
group by ProductID
having sum(Quantity) < 100

--query 7
select Shelf, ProductID, sum(Quantity) as TheSum
from Production.ProductInventory
where LocationID = 40
group by Shelf, ProductID
having sum(Quantity) < 100

--query 8
select AVG(Quantity) as TheAvg
from Production.ProductInventory
where LocationID = 10

--query 9
select ProductID, Shelf, AVG(Quantity) as TheAvg
from Production.ProductInventory
where LocationID = 10 and Shelf not like 'N/A'
group by  ProductID, Shelf
order by Shelf

-- query 10
select Color, Class, count(*) as TheCount, avg(ListPrice) as AvgPrice
from Production.Product
where Color is not null and Class is not null
group by GROUPING sets((Color),(Class))

-- query 11
SELECT ProductSubcategoryID
      , COUNT(Name) as Counted
	  , GROUPING(ProductSubcategoryID) as IsGrandTotal
FROM Production.Product
GROUP BY ROLLUP (ProductSubcategoryID)
order by ProductSubcategoryID
