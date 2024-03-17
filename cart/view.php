<?php
include '../connect.php';

$userid = filterReq('userid');

$values = array($userid);

$data = getAllData('cartview','cart_userid = ?',$values,false);

$statment = $connect->prepare("SELECT SUM(pros_count) AS amount, SUM(pros_price) AS totalprice, SUM(pro_shipping) AS shippingprice, SUM(pro_delivery) AS deliveryprice FROM cartview WHERE cart_userid = ? GROUP BY cart_userid");
$statment->execute($values);
  
$rowcount = $statment->rowCount();

$amountandprice = $statment->fetch(PDO::FETCH_ASSOC);

if ($rowcount > 0) {
    echo json_encode(array('status' => 'success', 'data' => $data, 'amountandprice' => $amountandprice));
  } else {
    echo json_encode(array('status' => 'failure'));
  }



?>