<?php
include '../../connect.php';

$deliveryid= filterReq('deliveryid');
$data = array($deliveryid);

getAllData('ordersview','orders_status = 3 AND orders_deliveryid = ?',$data);
?>