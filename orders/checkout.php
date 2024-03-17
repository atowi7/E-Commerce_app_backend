<?php
include '../connect.php';

$orders_price = filterReq('orders_price');
$orders_deliveryprice = filterReq('orders_deliveryprice');
$orders_couponid = filterReq('orders_couponid');
$orders_coupondiscount = filterReq('orders_coupondiscount');
$orders_paymentmethod = filterReq('orders_paymentmethod');
$orders_type = filterReq('orders_type');
$orders_date = filterReq('orders_createdat');
$orders_addressid = filterReq('orders_addressid');
$orders_userid = filterReq('orders_userid');

$orders_totalprice = $orders_price + $orders_deliveryprice;

// $now = date('Y-m-d H:i:s');
// $rowCount = getData('coupon',"coupon_id = '$orders_couponid' AND coupon_count > 0 AND coupon_expirydate > '$now'",null,false);

// if($rowCount > 0){
//     $orders_totalprice = $orders_totalprice - $orders_price * ($orders_couponDiscount / 100);
// }


$data = array(
        'orders_price' => $orders_price,
        'orders_deliveryprice' => $orders_deliveryprice,
        // 'orders_totalprice' => $orders_totalprice,
        'orders_couponid' => $orders_couponid,
        'orders_coupondiscount' => $orders_coupondiscount,
        'orders_paymentmethod' => $orders_paymentmethod,
        'orders_type' => $orders_type,
        'orders_createdat' => $orders_date,
        'orders_addressid' => $orders_addressid,
        'orders_userid' => $orders_userid,
    );
    
 $count = insertData('orders', $data , false);

if($count > 0){
    
 $statment = $connect->prepare("UPDATE coupon SET coupon_count = coupon_count - 1 WHERE coupon_id = '$orders_couponid'");
 $statment->execute();
 
 $statment = $connect->prepare("SELECT MAX(orders_id) FROM orders WHERE orders_userid = $orders_userid");
 $statment->execute();

 $maxOrder = $statment->fetchColumn();

$data = array(
        
        'cart_ordersid' => $maxOrder,
        'cart_ordersprice' => $orders_totalprice,
    );
    

updateData('cart', $data , "cart_ordersid = 0 AND cart_userid = '$orders_userid'");

}

?>
