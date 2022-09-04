SELECT COUNT(*) FROM  customer_products_orders LIMIT 0, 100;

CREATE TABLE customers_geo 
AS(
SELECT 
        customers.* ,
        geolocation.geolocation_lat, geolocation.geolocation_lng
        FROM customers 
        LEFT JOIN geolocation 
        ON customers.customer_zip_code_prefix=geolocation.geolocation_zip_code_prefix
);


SELECT * FROM translations LIMIT 10;


 CREATE TABLE products_eng
        SELECT products.product_id, translations.product_category_name_english,products.product_photos_qty,products.product_weight_g,products.product_length_cm, 
        products.product_height_cm, products.product_width_cm
        FROM products
        LEFT JOIN translations   
        ON products.product_category_name=translations.﻿product_category_name
        ;

SELECT * FROM products_eng LIMIT 10;


CREATE TABLE customer_orders
        SELECT customers_geo.customer_unique_id,
        orders_and_items.order_id,
        orders_and_items.order_purchase_timestamp,
        orders_and_items.order_item_id,
        orders_and_items.product_id, orders_and_items.price,
        orders_and_items.freight_value
        FROM customers_geo
        LEFT JOIN orders_and_items
        ON orders_and_items.customer_id=customers_geo.customer_id
        ;
        
SELECT * FROM  customer_products_orders WHERE order_id='53cdb2fc8bc7dce0b6741e2150273451';

        
        
DROP TABLE IF EXISTS customer_orders;
CREATE  TABLE customer_orders
        SELECT customers_geo.customer_unique_id,
        customers_geo.customer_zip_code_prefix,
        customers_geo.customer_city, customer_geo.customer_state,
        customers_geo.geolocation_lat,
        customers_geo.geolocation_lng,
        orders_and_items.order_id,
        orders_and_items.order_purchase_timestamp,
        orders_and_items.order_item_id,
        orders_and_items.product_id, orders_and_items.price,
        orders_and_items.freight_value
        FROM customers_geo
        LEFT JOIN orders_and_items
        ON orders_and_items.customer_id=customers_geo.customer_id
        ;
        
