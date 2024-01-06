create user "aa"@"localhost" identified by "456";
create database company;
use company;
create table Products (product_id int,product_name varchar(50), price int);
insert into products values(1001,"iPhone11Pro",40000),
(1002,"iPhone11",25000),
(1003,"iPhone12Pro",80000),
(1004,"iPhone12",40000),
(1005,"iPhone13Pro",120000),
(1006,"iPhone13",80000),
(1007,"iPhone14Pro",150000),
(1008,"iPhone14",120000),
(1009,"iPhone15Pro",170000),
(1010,"iPhone15",150000);
select * from Products;
CREATE TABLE sale(sale_id INT,product_id INT,quantity_sold INT,sale_date DATE);

INSERT INTO sale(sale_id, product_id, quantity_sold, sale_date)
VALUES
  (1, 1001, 1, '2024-01-01'),
  (2, 1002, 2, '2024-01-02'),
  (3, 1003, 3, '2024-01-03'),
  (4, 1004, 1, '2024-01-04'),
  (5, 1001, 5, '2024-01-04'),
  (6, 1002, 3, '2024-01-05'),
  (7, 1003, 6, '2024-01-06'),
  (8, 1004, 2, '2024-01-06'),
  (9, 1005, 2, '2024-01-07'),
  (10, 1006, 3, '2024-01-08'),
  (11, 1007, 3, '2024-01-09'),
  (12, 1008, 1, '2024-01-09'),
  (13, 1009, 2, '2024-01-10'),
  (14, 1005, 6, '2024-01-11'),
  (15, 1010, 2, '2024-01-11');
  select * from sale;
  select * from Products order by Price DESC;
   select * from Products order by Price asc;
  
  update Products set price = "160000" where product_id="1010"
  delete from sale where sale_id = 14;
  /*List the product names and prices of products with prices greater than 50,000:*/
  SELECT product_name, price FROM Products WHERE price > 50000;
  
  /*product details along with the total revenue generated for each product:*/
  SELECT p.*, s.product_id, SUM(s.quantity_sold * p.price) AS total_revenue
FROM Products p
JOIN sale s ON p.product_id = s.product_id
GROUP BY p.product_id;

/* total quantity sold for each product:*/
SELECT product_id, SUM(quantity_sold) AS total_quantity_sold
FROM sale
GROUP BY product_id;

select * from Products inner join sale on Products.product_id = sale.product_id;
select * from Products left join sale on Products.product_id = sale.product_id;
select * from Products right join sale on Products.product_id = sale.product_id;

/*List the products that have not been sold:*/
SELECT p.*
FROM Products p
LEFT JOIN sale s ON p.product_id = s.product_id
WHERE s.product_id IS NULL;

/*average quantity sold per sale:*/
SELECT AVG(quantity_sold) AS avg_quantity_sold FROM sale;

grant all on company.sale to "aa"@"localhost";
revoke all on company.sale from "aa"@"localhost";



  
  
  
  
  
  