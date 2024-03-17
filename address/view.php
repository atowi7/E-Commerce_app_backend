<?php
include '../connect.php';

$userid = filterReq('userid');

getAllData('address',"address_userid = '$userid'");
?>