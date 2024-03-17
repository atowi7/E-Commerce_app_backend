<?php
include '../connect.php';

$userid = filterReq('userid');

$data = array($userid);

getAllData('ordersview','orders_userid = ? AND orders_status != 4',$data);
?>