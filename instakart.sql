drop table if exists orders;
drop table if exists order_product_prior;
drop table if exists order_product_train;

create table orders(
order_id int primary key,
user_id int ,	
eval_set varchar(255),
order_number int,
order_dow int,	
order_hour_of_day int,
days_since_prior_order int default null
);

create table order_product_prior (
order_id int,
product_id	int ,
add_to_cart_order int,
reordered int 
);

create table order_product_train (
order_id int,
product_id	int ,
add_to_cart_order int,
reordered int 
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA LOCAL INFILE 'C:/Users/vivek/OneDrive/Desktop/college/5661/Project/orders.csv' 
INTO TABLE orders  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'  ;

LOAD DATA LOCAL INFILE 'C:/Users/vivek/OneDrive/Desktop/college/5661/Project/order_products__train.csv' 
INTO TABLE order_product_train  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'C:/Users/vivek/OneDrive/Desktop/college/5661/Project/order_products__prior.csv' 
INTO TABLE order_product_prior  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

select count(*) from orders order by order_id asc;
select * from orders limit 100;
select * from order_product_train limit 100;

select count(*) from orders order by order_id asc;
select * from order_product_train inner join orders on order_product_train.order_id = orders.order_id;
select * from order_product_prior inner join orders on order_product_prior.order_id = orders.order_id;
select count(distinct(order_id)) from orders;
select count(distinct(order_id)) from order_product_train;
select count(distinct(order_id)) from order_product_prior;

select * from order_product_train where order_id is not null;