BEGIN TRANSACTION;

DROP TABLE IF EXISTS users,products,shoppingcart,orders;


CREATE TABLE users (
	user_id SERIAL,
	email varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id),
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	phone_number int NOT NULL,
	creditcard varchar(5) NOT NULL
	
);


Create Table products(
	product_id SERIAL,
	product_name varchar(50) NOT NULL,
	product_description varchar(100) NOT NULL,
	price int NOT NULL,
	product_availability boolean NOT NULL,
	category varchar(50) NOT NULL,
	image text NOT NULL,
	CONSTRAINT PK_products PRIMARY KEY (product_id)
);

Create Table shoppingcart(
	cart_id SERIAL,
	quantity int NOT NULL,
	user_id int NOT NULL,
	product_id int NOT NULL,
	CONSTRAINT PK_cart PRIMARY KEY (cart_id),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT FK_product_id FOREIGN KEY (product_id) REFERENCES products (product_id)
	
);

Create Table orders(
	order_id SERIAL,
	order_list varchar(150),
	user_id int NOT NULL,
	product_id int NOT NULL,
	CONSTRAINT PK_order PRIMARY KEY (order_id),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT FK_product_id FOREIGN KEY (product_id) REFERENCES products (product_id)
);

COMMIT TRANSACTION;
