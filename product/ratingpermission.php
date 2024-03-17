<?php
include '../connect.php';

$userid = filterReq('userid');
$proid = filterReq('proid');

$data = array($userid,$proid);

getData('cartview','cart_userid = ? AND pro_id = ? AND cart_ordersid != 0',$data);
?>