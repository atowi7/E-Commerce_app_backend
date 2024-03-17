<?php
include '../connect.php';

$value = filterReq('value');
$comment = filterReq('comment');
$proid = filterReq('proid');
$userid = filterReq('userid');

$data1 = array(
     'productrate_value' => $value,
     'productrate_note' => $comment,
     'productrate_proid' => $proid,
     'productrate_userid' => $userid
    );
    
insertData('productrate',$data1);
 
$statment = $connect->prepare("SELECT AVG(productrate_value) FROM productrate");

$statment->execute();

$totalrate = $statment->fetch(PDO::FETCH_ASSOC);

$rowcount = $statment->rowCount();

if ($rowcount > 0) {
    $data2 = array(
     'product_rate' => $totalrate,
    );
    
     updateData('product',$data2,"pro_id = '$proid'",true);
    }else{
        echo json_encode(array('status' => 'failure'));
    }
?>