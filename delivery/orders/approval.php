<?php
include '../../connect.php';

$ordersid= filterReq('ordersid');
$adminid = filterReq('adminid');
$userid = filterReq('userid');
$deliveryid = filterReq('deliveryid');
$deliveryName = filterReq('deliveryname');

$data = array(
        'orders_status' => 3,
        'orders_deliveryid' => $deliveryid
    );
    
 updateData('orders',$data,"orders_id = '$ordersid' AND orders_status = 2");

 insertnotify('Order', 'The order is  on the way',$adminid, $userid);
 
 sendFCM('Order', 'The order has been approved by the delivery ' . $deliveryName,'service','none');
 sendFCM('Order', 'The order has been approved by the delivery ' . $deliveryName,'delivery','none');
 sendFCM('Order', 'The order has been approved by the delivery ' . $deliveryName,"user$userid",'none');
?>