<?php
include '../connect.php';

$userid = filterReq('userid');
$proid = filterReq('proid');

    
  deleteData('favorite',"fav_proid = '$proid' AND fav_userid = '$userid' ");
?>
