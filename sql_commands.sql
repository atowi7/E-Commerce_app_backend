CREATE OR REPLACE VIEW productview AS
SELECT product.* , product.pro_price-(product.pro_price*(product.pro_discount/100)) as priceafterdiscount, product.pro_price * (product.pro_shipping / 100) as shippingprice, product.pro_price * (product.pro_delivery / 100) as deliveryprice, categorie.* FROM product
INNER JOIN categorie on product.pro_catid = categorie.categorie_id;

CREATE OR REPLACE VIEW userfavorite AS
SELECT user.user_id , product.*, product.pro_price-(product.pro_price*(product.pro_discount/100)) as priceafterdiscount, favorite.* FROM favorite
INNER JOIN user on user.user_id = favorite.fav_userid
INNER JOIN product on product.pro_id = favorite.fav_proid;

CREATE OR REPLACE VIEW cartview AS
SELECT SUM(product.pro_price - (product.pro_price * (product.pro_discount / 100)) + (product.pro_price * (product.pro_shipping / 100)) + (product.pro_price * (product.pro_delivery / 100))) AS pros_price, COUNT(cart.cart_id) AS pros_count, product.*, cart.* FROM cart 
INNER JOIN product ON cart.cart_proid = product.pro_id 
WHERE cart.cart_ordersid = 0
GROUP BY cart.cart_proid , cart.cart_userid , cart.cart_ordersid; 

CREATE OR REPLACE VIEW ordersview AS
SELECT orders.* , address.* FROM orders
LEFT JOIN address on orders.orders_addressid = address.address_id;

CREATE OR REPLACE VIEW ordersdetailview AS
SELECT SUM(product.pro_price - (product.pro_price * (product.pro_discount / 100))) AS pros_price, COUNT(cart.cart_id) AS pros_count, product.*, cart.* FROM cart 
INNER JOIN product ON cart.cart_proid = product.pro_id
WHERE cart.cart_ordersid != 0
GROUP BY cart.cart_proid , cart.cart_userid , cart.cart_ordersid; 

CREATE OR REPLACE VIEW producttopselling AS
SELECT COUNT(cart_id) AS cart_procount,product.pro_price-(product.pro_price*(product.pro_discount/100)) as priceafterdiscount, cart.* , product.* FROM cart
INNER JOIN product on cart.cart_proid = product.pro_id
WHERE cart.cart_ordersid != 0
GROUP BY cart.cart_proid;

-- REATE OR REPLACE VIEW orderrateview AS
-- SELECT orders_id , product.proid , product_rate , orders.userid FROM orders
-- INNER JOIN product on product.proid = orders.proid;