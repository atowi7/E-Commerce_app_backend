<?php
include '../connect.php';

$userid = filterReq('userid');

deleteData('cart',"cart_userid = '$userid'");
?>
