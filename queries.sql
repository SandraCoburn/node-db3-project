-- Multi-Table Query Practice


-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT 
ProductName
FROM Product 
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT 
o.ID, s.CompanyName, o.OrderDate
FROM [Order] as o 
inner join Shipper as s on o.ShipVia = s.Id
where o.OrderDate < "2012-08-09"
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select [Order].Id, Product.QuantityPerUnit, Product.ProductName
from [Order]
join OrderDetail on OrderDetail.OrderId = [Order].Id
join Product on OrderDetail.ProductId = Product.Id
where [Order].Id = 10251
order by ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [Order].Id, c.CompanyName, e.LastName
from [Order] 
join Customer as c on [Order].CustomerId = c.Id
join Employee as e on [Order].EmployeeId = e.Id
