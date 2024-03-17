<?php
include '../connect.php';

$userid = filterReq('userid');
$proid = filterReq('proid');
$values = array($userid,$proid);
    
$statment = $connect->prepare("SELECT COUNT(cart.cart_id) AS procount FROM cart WHERE cart_userid = ? AND cart_proid = ?  AND cart_ordersid = 0");
$statment->execute($values);
  
$rowcount = $statment->rowCount();

$data = $statment->fetchColumn();

if ($rowcount > 0) {
    echo json_encode(array('status' => 'sucess', 'data' => $data));
  } else {
    echo json_encode(array('status' => 'sucess', 'data' => '0'));
  }

?>