DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS reviews;

CREATE TABLE products(
  product_id SERIAL PRIMARY KEY
  ,product_name TEXT NOT NULL
  ,price FLOAT NOT NULL
  ,img_url TEXT NOT NULL
);

CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY 
  ,first_name TEXT NOT NULL
  ,last_name TEXT NOT NULL
  ,email TEXT UNIQUE NOT NULL
  ,street_address TEXT NOT NULL
  ,city TEXT NOT NULL
  ,state TEXT NOT NULL
  ,zip VARCHAR(5)
  ,password TEXT /* REMEMBER HASH */ 
);

CREATE TABLE orders(
  invoice_id SERIAL PRIMARY KEY
  ,customer_id INTEGER REFERENCES customers(customer_id)
  ,product INTEGER REFERENCES products(product_id)
  ,quantity INTEGER
  ,price FLOAT
);

CREATE TABLE reviews(
  review_id SERIAL PRIMARY KEY
  ,title TEXT NOT NULL
  ,review TEXT NOT NULL
  ,customer INTEGER REFERENCES customers(customer_id)
  ,product_id INTEGER
  ,star_rating INTEGER 
  ,recommend VARCHAR(3) 
  ,concerns TEXT 
  ,skin_type TEXT 
  ,age INTEGER 
);

INSERT INTO products (product_name, price, img_url )
VALUES 
('seven_piece', 69.00, 'http://wwww.?????????.com'),
('five_piece', 49.00, 'http://wwww.?????????.com'),
('free_gift1', 0.00, 'http://wwww.?????????.com' ),
('free_gift2', 0.00, 'http://wwww.?????????.com' );

INSERT INTO customers (first_name, last_name, email, street_address, city, state, zip, password)
VALUES 
('Maria', 'DeGrande', 'mariadegrande7@gmail.com', '5 Jersey City Ave', 'Lavallette', 'NJ', 08735, '########'),
('Jennifer', 'Lee', 'jgrande7@gmail.com', '151 Fairview Ave', 'Longvalley', 'NJ', 07853, '########'),
('Allison', 'Dob', 'allison@gmail.com', '4601 Carnes Rd', 'Roseburg', 'OR', 97471, '########'),
('Lisa', 'Margotta', 'dob.lisaa@gmail.com', '3 Beaver Lane', 'Flanders', 'NJ', 07836, '########');

INSERT INTO orders (customer_id, product, quantity, price)
VALUES
(1, 1, 1, 49.00);



INSERT INTO reviews (title, review, customer, product_id, star_rating, recommend, concerns, skin_type, age)
VALUES
('Skin Changing Experience!', 'I have found the skincare of my dreams! Simple and easy to use. It has helped balance my sensitive skin while still being kind to it. I have noticed that my fine lines have started to fade and my skin has a health glow. I would recommend these products to everyone!', 1, 1, 4, 'Yes', 'Wrinkles or Fine Lines'. 'Sensitive', 41);


