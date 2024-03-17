<?php
include '../../connect.php';

$ordersid= filterReq('ordersid');
$userid = filterReq('userid');
$ordertype = filterReq('ordertype');

if($ordertype == '0'){
    $data = array(
        'orders_status' => 2,
    );
}else{
    $data = array(
        'orders_status' => 4,
    );
}

updateData('orders',$data,"orders_id = '$ordersid' AND orders_status = 1");
 
if($ordertype == '0'){
    // insertnotify('Order', 'The order has been prepared', $userid, "user$userid", 'order');
    sendFCM('Order', 'Your order has been prepared' ,"user$userid",'order');
    sendFCM('Order', 'There is an order is waiting for Approval' ,'delivery','none');
}else{
    // insertnotify('Order', 'Thank you for trusting us','0', $userid, "user$userid", 'order');
    sendFCM('Order', 'Thank you for trusting us' ,"user$userid",'order');
}

?>