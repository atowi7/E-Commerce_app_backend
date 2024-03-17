<?php
include '../../connect.php';

$message= filterReq('msg');
// $proid= filterReq('proid');
$adminid= filterReq('adminid');
$userid= filterReq('userid');

insertmessage($msg,$adminid,$userid);
    
sendFCM('message', 'New message','service','none');
?>