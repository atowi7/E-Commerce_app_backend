<?php
include '../../connect.php';

$ordersid= filterReq('ordersid');
$userid = filterReq('userid');

$data = array(
        'orders_status' => 1,
    );
    
 updateData('orders',$data,"orders_id = '$ordersid' AND orders_status = 0");
 sendFCM('Order', 'The order has been approved by service' ,"user$userid",'order');
//  insertnotify('Order', 'The order has been approved by service', '0', $userid, "user$userid", 'order');
?>