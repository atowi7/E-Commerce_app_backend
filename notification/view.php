<?php
include '../connect.php';

$adminid = filterReq('adminid');

getAllData('notification',"notification_adminid = '$adminid'");
?>