CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL

);

CREATE TABLE orderr (
    order_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE quantity (
    order_id INT,
    product_id INT,
    quality SMALLINT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orderr(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);