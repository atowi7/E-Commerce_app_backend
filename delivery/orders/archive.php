<?php
include '../../connect.php';

$deliveryid= filterReq('deliveryid');
$data = array($deliveryid);

getAllData('ordersview','orders_status = 4 AND orders_deliveryid = ?',$data);
?>