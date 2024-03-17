<?php
include '../../connect.php';

$ordersid= filterReq('ordersid');
$adminid = filterReq('adminid');
$userid = filterReq('userid');

$data = array(
        'orders_status' => 4,
    );
    
 updateData('orders',$data,"orders_id = '$ordersid' AND orders_status = 3");

 insertnotify('Order', 'your order has been delivered', $adminid, $userid);
 
 sendFCM('Order', 'The order has been delivered to the customer' ,'service','none');
 sendFCM('Order', 'your order has been delivered' ,"user$userid",'order');
?>