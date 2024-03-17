<?php
include '../../connect.php';
$email = filterReq('email');
$verifyCode =filterReq('verifycode');

$statment = $connect->prepare('SELECT * FROM delivery WHERE delivery_email = ? AND delivery_verifycode = ?');
$statment->execute(array($email,$verifyCode));

$count  = $statment->rowCount();

if($count > 0){
      $data = array(
        'delivery_approval' => 1,
    );
    updateData('delivery',$data,"delivery_email = '$email'",true);
  
}else{
     echo json_encode(array('status' => 'failure', 'message' => 'VCODE ERROR'));
   
}
?>