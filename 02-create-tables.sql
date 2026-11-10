SELECT current_database();

--Checkpoint
--Before continuing, answer these questions in your own words:

--What is the difference between a database and a table?
--A database is the overall container for related data and a table stores one type of information.

--Why did we create a separate brightmart database?
-- because that is the name of the small shop that will store the records of data

--Which command did you use to connect to it?
--CREATE

--2.3 Create the customers table

CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Inserting into customers table
INSERT INTO "customers"
("first_name", "last_name", "email", "phone", "created_at")
VALUES
('Ditebogo', 'Tlhakola', 'diditlhakola@gmail.com', '0614076891', TIMESTAMP '2026-11-10 09:30:00'),
('John', 'Terry', 'johnT@gmail.com', '0734076800', TIMESTAMP '2026-11-10 09:30:00'),
('Lesley', 'Smoke', 'lesleyS@gmail.com', '0724078891', TIMESTAMP '2026-11-10 09:30:00'),
('Tumelo', 'Hans', 'Tumi@gmail.com', '0824070091', TIMESTAMP '2026-11-10 09:30:00'),
('Thabang', 'Jones', 'ThabanJones@gmail.com', '0734996891', TIMESTAMP '2026-11-10 09:30:00'),
('Mancoba', 'Cele', 'Cele33@gmail.com', '0650776891', TIMESTAMP '2026-11-10 09:30:00');

Select * from customers

--2.4 Create the products table

CREATE TABLE products (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- inserting into products table

INSERT INTO "products"
("product_name", "description", "price", "stock_quantity", "created_at")
VALUES
('LiquidFruit', 'A refreshing juice', 54.00, 60, TIMESTAMP '2026-10-10 09:30:00'),
('Atchaar', 'Mango salad', 50.00, 50, TIMESTAMP '2026-10-10 09:30:00'),
('Nivea Lotion', 'Moisturizer for men', 75.00, 100, TIMESTAMP '2026-10-10 09:30:00'),
('Colgate', 'SA''s No.1 Toothpaste', 30.00, 80, TIMESTAMP '2026-10-10 09:30:00'),
('Doritos', 'Mexican Chilli', 40.00, 90, TIMESTAMP '2026-10-10 09:30:00'),
('All Gold Tomato Sauce', 'SA''s No.1 Condiment', 30.00, 80, TIMESTAMP '2026-10-10 09:30:00');

select * from "products"


--2.5 Create the orders table

CREATE TABLE orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT chk_orders_status
        CHECK (status IN ('PENDING', 'PAID', 'SHIPPED', 'CANCELLED'))
);

-- 2.6 Create the order_items table
CREATE TABLE order_items (
    order_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0),

    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT uq_order_product
        UNIQUE (order_id, product_id)
);

-- query to see all the tables added
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

--Checkpoint
--Why do we keep customers and orders in separate tables?
--An order belongs to a customer. 
--Therefore, the orders table needs a column that identifies the customer who placed it.

--Why does orders contain customer_id?
-- Its a foreign key used to identify which customer placed the order

--What could go wrong if price were stored as text?
-- The information stored would take text values instead of correct data

--What does the CHECK (quantity > 0) rule protect against?
-- It prevents negative stock

--Why does order_items store unit_price?
--Because the product's current price may change after an order is placed
