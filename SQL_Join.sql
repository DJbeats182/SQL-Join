
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT  p.name as "Product Name", c.Name as Category
 FROM products as p
 INNER JOIN categories as c 
 ON p.CategoryID = c.CategoryID
 WHERE c.name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.name, p.Price, r.Rating
 FROM products as p 
 INNER JOIN reviews as r 
 ON p.ProductID = r.ProductID
 WHERE r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) as Total
FROM sales as s 
INNER JOIN employees as e
ON s.EmployeeID = e.EmployeeID 
GROUP BY e.EmployeeID
ORDER BY Total desc
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name as 'Department Name', categories.Name as 'Category Name'
FROM departments  
INNER JOIN categories  
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, Sum(s.quantity) as "Total Units Sold", 
Sum(s.quantity * s.PricePerUnit) as "Total Price Per Unit"
FROM products as p
INNER JOIN sales as s
ON p.ProductID = s.ProductID
WHERE Name LIKE "%Hotel California%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.rating, reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE Name LIKE "%Visio TV%" AND reviews.rating = 1;

/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID, e.FirstName, e.LastName, p.Name, Sum(s.quantity) as "Total Units Sold"
FROM employees as e 
INNER JOIN sales as s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products as p 
ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.FirstName;
