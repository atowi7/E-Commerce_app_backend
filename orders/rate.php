<?php
include '../connect.php';

$id = filterReq('orderid');
$rate = filterReq('rate');
$comment = filterReq('comment');

 $data = array(
     'orders_rate' => $rate,
     'orders_ratenote' => $comment
    );
 updateData('ordersview',$data,"orders_id = '$id'",true);
?>