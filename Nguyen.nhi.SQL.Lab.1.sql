# 1. Write a query to get Product name and quantity/unit.
Select northwind.products.product_name, northwind.products.quantity_per_unit from northwind.products;

# 2. Write a query to get current Product list (Product ID and name).
Select northwind.products.product_name, northwind.products.product_code from northwind.products;

# 3. Write a query to get discontinued Product list (Product ID and name).
Select northwind.products.product_name, product_code, discontinued 
from northwind.products 
where northwind.products.discontinued = 1;

# 4. Write a query to get most expense and least expensive Product list (name and unit price).
Select product_name, list_price from northwind.products
where list_price in (select max(list_price) from northwind.products) 
or list_price in (select min(list_price) from northwind.products);

# 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.  
Select product_code, product_name, list_price 
from northwind.products where northwind.products.list_price < 20;

# 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  
Select product_code, product_name, list_price 
from northwind.products where northwind.products.list_price <= 25 and northwind.products.list_price >= 15;

# 7. Write a query to get Product list (name, unit price) of above average price.
Select product_name, list_price 
from northwind.products where list_price > (select avg(list_price) from northwind.products); 

# 8. Write a query to get Product list (name, unit price) of ten most expensive products.  
Select product_name, list_price 
from northwind.products order by list_price desc limit 10; 

# 9. Write a query to count current and discontinued products. 
Select count(product_name) from northwind.products group by discontinued;

# 10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  
Select northwind.products.product_name, northwind.order_details.quantity, northwind.inventory_transactions.quantity 
from northwind.products, northwind.order_details, northwind.inventory_transactions 
where northwind.order_details.quantity > northwind.inventory_transactions.quantity; 
