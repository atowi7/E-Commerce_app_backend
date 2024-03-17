<?php
include '../connect.php';

$userid = filterReq('userid');
$proid = filterReq('proid');


$data = array(
        'fav_userid' => $userid,
        'fav_proid' => $proid,
    );
    
  insertData('favorite', $data);
?>
