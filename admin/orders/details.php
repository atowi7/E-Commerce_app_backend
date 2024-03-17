<?php
include '../../connect.php';

$orderid = filterReq('orderid');

$data = array($orderid);

getAllData('ordersdetailview','cart_ordersid = ?',$data);
?>