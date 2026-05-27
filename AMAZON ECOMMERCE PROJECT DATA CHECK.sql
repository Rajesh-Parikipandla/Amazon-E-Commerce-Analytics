show databases;
use amazon_ecommerce;
show tables;

load data local infile 'D:/Rajesh Job/Data Analyst - Project/Amazon ecommerce  - Project/amazon_ecommerce_10K_final.csv'
into table amazon_ecomm
fields terminated by ','
ignore 1 rows;

select * from amazon_ecomm;

truncate table amazon_ecomm;  -- clears the table again I will re-import clean

load data local infile 'D:/Rajesh Job/Data Analyst - Project/Amazon ecommerce  - Project/amazon_ecommerce_10K_final.csv'
into table amazon_ecomm
fields terminated by ','
ignore 1 rows;

select * from amazon_ecomm;

select purchase_date from amazon_ecomm
limit 5;

select count(purchase_date) from amazon_ecomm;

select count(*) from amazon_ecomm;

select * from amazon_ecomm
where product_id is null;

select * from amazon_ecomm
where user_id is null;

select user_id, count(*)
from amazon_ecomm
group by user_id
having count(*) > 1;

select * from amazon_ecomm;

describe amazon_ecomm;


set sql_safe_updates = 0;

alter table amazon_ecomm
modify product_id varchar(20),
modify user_id varchar(20),
modify category varchar(50),
modify subcategory varchar(50),
modify brand varchar(50),
modify price decimal(10,2),
modify discount decimal(5,2),
modify final_price decimal(10,2),
modify purchase_date date,
modify is_returned tinyint;


/* ==================================
          Adding Revenue Column
================================== */

alter table amazon_ecomm
add revenue decimal(10,2);

update amazon_ecomm
set revenue = final_price;


/* ==================================
	   Adding Discount Amount
================================== */

alter table amazon_ecomm
add discount_amount decimal(10,2);

update amazon_ecomm
set discount_amount = price - final_price;

/* ==================================
	   Adding Profit Estimate
================================== */

alter table amazon_ecomm
add estimated_profit decimal(10,2);

update amazon_ecomm
set estimated_profit = round(final_price * 0.25 , 2);

/* ==================================
	   Adding Delivery Delay
================================== */

alter table amazon_ecomm
add delivery_delay varchar(20);

update amazon_ecomm
set delivery_delay = 
case 
when shipping_time_days > 5 then 'delay'
else 'on time'
end;

select * from amazon_ecomm;


