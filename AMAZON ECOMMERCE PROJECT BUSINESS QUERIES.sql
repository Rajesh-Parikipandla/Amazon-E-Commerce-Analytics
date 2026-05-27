/* ==================================
        AMAZON E-COMMERCE
		BUSINESS QUERIES
================================== */

use amazon_ecommerce;

select * from amazon_ecomm;


/* ==================================
	   SALES ANALYSIS
================================== */


/* ==================================
   1. Total Revenue
================================== */

select
    round(sum(final_price),2) as total_revenue
from amazon_ecomm;

/* ==================================
   2. Total Estimated Profit
================================== */

select
    round(sum(estimated_profit),2) as total_estimated_profit
from amazon_ecomm;

/* ==================================
   3. Average Product Rating
================================== */

select
    round(avg(rating),2) as avg_product_rating
from amazon_ecomm;

/* ==================================
	   Revenue by Category
================================== */

select category, round(sum(revenue), 2) as revenue
from amazon_ecomm
group by category
order by revenue desc;

/* ==================================
	   Monthly Sales Trend
================================== */

select month(purchase_date) as month,
round(sum(revenue), 2) as revenue
from amazon_ecomm
group by month
order by month;

/* ==================================
	   Top Brands by Revenue
================================== */

select brand,
round(sum(revenue), 2) as revenue
from amazon_ecomm
group by brand
order by revenue desc
limit 10;

/* ==================================
	   CUSTOMER ANALYSIS
================================== */

/* ==================================
	   Most Used Payment Method
================================== */

select payment_method,
count(*) as total_orders
from amazon_ecomm
group by payment_method
order by total_orders desc;

/* ==================================
	   Top Cities by Orders
================================== */

select location, count(*) as order_count
from amazon_ecomm
group by location
order by order_count desc;

/* ==================================
	   PRODUCT ANALYSIS
================================== */

/* ==================================
	   Highest Rated Products
================================== */

select product_id, category,subcategory, rating
from amazon_ecomm
order by rating desc
limit 10;

/* ==================================
	   Most Reviewed Brands
================================== */

select brand, 
sum(review_count) as total_ratings
from amazon_ecomm
group by brand
order by total_ratings desc;

/* ==================================
	   DELIVERY ANALYSIS
================================== */

/* ==================================
	   Average Shipping Time
================================== */

select round(avg(shipping_time_days),2) as avg_shipping_days
from amazon_ecomm;

/* ==================================
	   Delivery Status Distribution
================================== */

select delivery_status,
count(*) as total_orders
from amazon_ecomm
group by delivery_status
order by total_orders desc;

/* ==================================
	   RETURNS ANALYSIS
================================== */

/* ==================================
	   Return Rate
================================== */

select round(sum(is_returned)*100/count(*),2) as return_rate
from amazon_ecomm;

/* ==================================
	   Returns by Category
================================== */

select category, 
count(*) as total_return
from amazon_ecomm
where is_returned = 1
group by category
order by total_return desc;

/* ==================================
	   SELLER ANALYSIS
================================== */
/* ==================================
	   Top Sellers by Revenue
================================== */

select seller_id,
round(sum(revenue),2) as revenue
from amazon_ecomm
group by seller_id
order by revenue desc
limit 10;

/* ==================================
	   PROFIT ANALYSIS
================================== */
/* ==================================
	   Estimated Profit by Category
================================== */

select category,
round(sum(estimated_profit),2) as profit
from amazon_ecomm
group by category
order by profit desc;



