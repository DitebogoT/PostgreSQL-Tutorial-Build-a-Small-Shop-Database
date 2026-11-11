--Tutorial 8 – SUM, AVG and other aggregate queries
--8.2 SUM – calculate a total

--Calculate the total of all the order items
SELECT
    SUM(quantity * unit_price) AS total_order_value
FROM order_items;

--8.3 AVG – calculate an average
SELECT
    AVG(price) AS average_product_price
FROM products;

--8.4 COUNT – count records (Counts the total number of customers)
SELECT COUNT(*) AS total_customers
FROM customers;

-- count the total number of products
SELECT COUNT(*) AS total_products
FROM products;

--8.5 MIN and MAX
SELECT
    MIN(price) AS cheapest_price,
    MAX(price) AS most_expensive_price
FROM products;

--8.6 GROUP BY – calculate totals per group
SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
ORDER BY order_id;

--8.7 Combine JOIN and GROUP BY (Shows each customer's name and the total value of their orders)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

--8.8 HAVING – filter grouped results
SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
HAVING SUM(quantity * unit_price) > 500;