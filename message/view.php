<?php
include '../connect.php';

$userid = filterReq('userid');

getAllData('message',"message_userid = '$userid'");
?>