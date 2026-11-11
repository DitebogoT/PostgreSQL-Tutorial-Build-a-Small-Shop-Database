--7.1 UPDATE – change existing data
SELECT product_id, product_name, price
FROM products
WHERE product_name = 'Doritos';

-- Changing/Updating the price of doritos
UPDATE products
SET price = 68.50
WHERE product_name = 'Doritos';

--Verifying the change
SELECT product_name, price
FROM products
WHERE product_name = 'Doritos';

--7.2 Update more than one column
UPDATE products
SET
    stock_quantity = 45,
    description = 'Flaming Hot Doritos'
WHERE product_name = 'Doritos';

--7.3 ALTER TABLE – change the table structure
ALTER TABLE customers
ADD COLUMN city VARCHAR(80);

--rename column
ALTER TABLE customers
RENAME COLUMN phone TO phone_number;

--changing datatype
ALTER TABLE customers
ALTER COLUMN city TYPE VARCHAR(100

-- removing a column in a table
ALTER TABLE customers
DROP COLUMN city;

--7.4 DELETE – remove selected rows

select * from customers
-- identifying the customer
SELECT customer_id, first_name, last_name, email
FROM customers
WHERE email = 'Cele33@gmail.com';

--remove the customer
DELETE FROM customers
WHERE email = 'Cele33@gmail.com';

--7.5 Use transactions for safer changes
BEGIN;

UPDATE products
SET price = 68.50
WHERE product_name = 'Doritos';

SELECT product_name, price
FROM products
WHERE product_name = 'Doritos';

COMMIT;

--Checkpoint exercise
--Increase the price of one product.
--Add a city column to customers.
--Set a city for one customer.
--Find that customer using a WHERE condition.
--Practise a transaction and decide whether to commit or roll it back.