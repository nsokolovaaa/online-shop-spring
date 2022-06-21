
create sequence user_seq start 1 increment 1;

CREATE TABLE users (
id BIGSERIAL not null,
archive boolean not null,
email varchar(255),
name varchar(255),
password varchar(255),
role varchar(255),
primary key (id)
);
create sequence bucket_seq start 1 increment 1;

CREATE TABLE  buckets (
id BIGSERIAL not null,
user_id BIGSERIAL,
primary key (id)
);


alter table if exists buckets
add constraint buckets_fk_user
foreign key (user_id) references users;


create sequence category_seq start 1 increment 1;

CREATE TABLE  categories (
id BIGSERIAL not null,
title varchar(255),
primary key (id)
);

CREATE sequence product_seq start 1 increment 1;

CREATE TABLE products (
id BIGSERIAL not null,
price BIGSERIAL,
title varchar(255),
primary key (id)
);


CREATE TABLE  products_categories (
product_id BIGSERIAL not null,
category_id BIGSERIAL not null
);

alter table if exists products_categories
add constraint products_categories_fk_category
foreign key (category_id) references categories;

alter table if exists products_categories
add constraint products_categories_fk_product
foreign key (product_id) references products;

CREATE TABLE  bucket_products (
bucket_id BIGSERIAL not null,
product_id BIGSERIAL not null
);

alter table if exists bucket_products
add constraint bucket_products_fk_product
foreign key (product_id) references products;

alter table if exists bucket_products
add constraint bucket_products_fk_bucket
foreign key (bucket_id) references buckets;


create sequence order_seq start 1 increment 1;

CREATE TABLE  orders (
id BIGSERIAL not null,
address varchar(255),
updated timestamp,
created timestamp,
status varchar(255),
sum numeric(19, 2),
user_id BIGSERIAL,
primary key (id)
);

alter table if exists orders
add constraint orders_fk_user
foreign key (user_id) references users;


create sequence order_details_seq start 1 increment 1;

CREATE TABLE  orders_details (
id BIGSERIAL not null,
order_id BIGSERIAL not null,
product_id BIGSERIAL not null,
amount numeric(19, 2),
price numeric(19, 2),
primary key (id)
);

alter table if exists orders_details
    add constraint orders_details_fk_order
        foreign key (order_id) references orders;

alter table if exists orders_details
    add constraint orders_details_fk_product
        foreign key (product_id) references products;


CREATE TABLE product (
id BIGSERIAL  PRIMARY KEY,
code BIGSERIAL NOT NULL,
name VARCHAR(50),
brand VARCHAR(50),
description VARCHAR(100),
price BIGSERIAL NOT NULL
);

);

INSERT INTO product(id, code, name, brand, description, price)
VALUES(1, 658, 'T-shirt', 'LC Waikiki', 'Womens T-Shirt with short-sleeve, oversize', 25),
(2,  659, 'T-shirt', 'LC Waikiki', 'Mens T-Shirt with short-sleeve, oversize', 26),
(3,  666, 'Jeans', 'LC Waikiki', 'Womens jeans with 100% cotton. Size - XS-L', 55),
(4,  659, 'T-shirt', '5th-Avenue', 'Transcend Federal Slim Straight Leg Jeans for men', 189),
(5,  666, 'Jeans', '5th-Avenue', 'Blowout Slim Jeans. Size - S-XXL', 190),
(6,  667, 'Jeans', '5th-Avenue', 'Ripped Slim Jeans. Size - S-XXL', 189),
(7,  659, 'Jacket', '5th-Avenue', 'Mens Colorblock Full Zip Jacket, Yellow/Tan, oversize', 123),
(8,  616, 'Jacket', 'Reebok', 'Mens Running Hero Jacket, Black. Size - S-L', 210),
(9,  689, 'Jacket', 'Diesel', 'Mens Hooded Casual Textured Denim Overcoat, Black Combo. Size - S-L', 219),
(10, 649, 'Jacket', 'Emporio Armani', 'Mens Brand Logo Long Sleeve Jacket Shirt, Navy. Size - XS-XXL', 320),
(11, 640, 'Bodysuit', 'Bershka', 'Womens Jacquard Print Sleeveless Bodysuit, Pink Combo. Size - M', 77),
(12, 650, 'Bodysuit', 'Bershka', 'Womens Graphic Print Sleeveless Bodysuit, Pink. Size - M', 17),
(13, 610, 'Jacket', 'Emporio Armani', ' Mens Brand Logo Long Sleeve Jacket Shirt, Navy. Size - XS-XXL', 320),
(14, 689, 'Bodysuit', 'Bershka', 'Womens Off Shoulder Textured Long Sleeves Bodysuit, Black. Size - M', 27),
(15, 622, 'Bodysuit', 'Etam', 'Womens Ribbed Sleeveless Bodysuit, Brown. Size - M', 15),
(16, 699, 'Shorts', 'Emporio Armani', ' Womens Pull-On Textured Short, Pink Combo. Size - XS-XXL', 29),
(17, 601, 'Shorts', 'Bershka', 'Womens Stripe Short, White. Size - M', 89),
(18, 602, 'Shorts', 'TopShop', 'Womens Floral Print Short, Navy Combo', 78),
(19, 655, 'Shorts', 'TopShop', 'Womens Pull-On Solid Basic Short, Red. Size - M', 19),
(20, 642, 'Shorts', 'TopShop', 'Womens Solid Basic Shorts, Blue', 38);