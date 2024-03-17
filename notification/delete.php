<?php
include '../connect.php';

$id = filterReq('id');
$adminid = filterReq('adminid');

deleteData('notification',"notification_id = '$id' AND notification_adminid = '$adminid'");
?>
