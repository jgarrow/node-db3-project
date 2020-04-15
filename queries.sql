-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName, c.categoryName
from Product as p
join Category as c
    on p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

-- this is returning 2323 records, but if you include o.OrderDate in the `select` and scroll through the records, 429 records are before August 9, 2012
-- I'm not sure why it's returning items after August 9th
select o.Id, s.CompanyName
from [Order] as o
join Shipper as s
    on o.ShipVia = s.Id
where o.OrderDate < '2012-08-09'
order by o.OrderDate asc

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, od.quantity
from OrderDetail as od
join Product as p
    on od.ProductId = p.Id
join Order as o
    on od.OrderId = o.Id
where o.Id = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id, e.LastName, c.CompanyName
from [Order] as o
join Customer as c
    on c.Id = o.CustomerId
join Employee as e
    on o.EmployeeId = e.Id
