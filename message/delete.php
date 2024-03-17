<?php
include '../connect.php';

$id = filterReq('id');

deleteData('message',"message_id = '$id'");
?>
