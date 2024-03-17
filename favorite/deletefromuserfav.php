<?php
include '../connect.php';

$favid = filterReq('favid');
    
deleteData('favorite',"fav_id = '$favid' ");
?>
