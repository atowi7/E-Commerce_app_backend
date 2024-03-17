<?php
include '../connect.php';

$userid = filterReq('userid');

$data = array($userid);

getAllData('userfavorite','user_id = ?',$data);
?>