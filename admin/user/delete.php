<?php
include '../../connect.php';

$id = filterReq('id');
$imagename = filterReq('imagename');

deleteFile('../../upload/user', $imagename);

deleteData('user',"user_id = '$id'");
?>
