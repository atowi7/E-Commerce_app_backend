<?php
include '../connect.php';

$userid = filterReq('userid');
$proid = filterReq('proid');


$data = array(
        'cart_userid' => $userid,
        'cart_proid' => $proid,
    );
    
insertData('cart', $data);
?>
