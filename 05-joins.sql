--Tutorial 6 – JOIN queries
--6.2 INNER JOIN
SELECT
    orders.order_id,
    customers.first_name,
    customers.last_name,
    orders.status
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id;

--6.3 Use table aliases
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.status
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

--6.4 Join three tables

SELECT
    o.order_id,
    c.first_name,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN products AS p
    ON oi.product_id = p.product_id;

--6.5 LEFT JOIN
--A LEFT JOIN keeps all rows from the left table and includes matching rows from the right table when they exist.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

--6.6 RIGHT JOIN and FULL OUTER JOIN
--A RIGHT JOIN keeps all rows from the right-hand table, including those without a match on the left.
--A FULL OUTER JOIN keeps matching rows and unmatched rows from both sides.
--These are useful to recognise, although LEFT JOIN and INNER JOIN are more common in everyday application queries.

--6.7 JOIN practice
--Try these without looking at the examples first
--Show each order with the customer's full name.
SELECT customers.customer_id, orders.order_id, customers.first_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

--Show each product included in each order.

--Show all customers, even those without orders.

--Show order ID, customer email, product name and quantity.

