<?php
include '../connect.php';

$name = filterReq('name');

$now = date('Y-m-d H:i:s');

getData('coupon',"coupon_name = '$name' AND coupon_count > 0 AND coupon_expirydate > '$now'");

?>
