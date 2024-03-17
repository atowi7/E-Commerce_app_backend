<?php
include '../connect.php';

$userid = filterReq('userid');
$proid = filterReq('proid');

deleteData('cart',"cart_id = (SELECT cart_id FROM cart WHERE cart_userid = '$userid' AND cart_proid = '$proid' LIMIT 1)");
?>
