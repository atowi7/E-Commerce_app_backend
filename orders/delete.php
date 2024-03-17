<?php
include '../connect.php';

$orderid = filterReq('orderid');

deleteData('orders',"orders_id = '$orderid' AND orders_status = 0");
?>
