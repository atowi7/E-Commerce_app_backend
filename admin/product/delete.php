<?php
include '../../connect.php';

$id = filterReq('id');
$imagename = filterReq('imagename');

deleteFile('../../upload/product', $imagename);

deleteData('product',"pro_id = '$id'");
?>
