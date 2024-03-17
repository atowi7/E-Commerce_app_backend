<?php
include '../../connect.php';
$email = filterReq('email');
$verifyCode =filterReq('verifycode');

$statment = $connect->prepare('SELECT * FROM admin WHERE admin_email = ? AND admin_verifycode = ?');
$statment->execute(array($email,$verifyCode));

$count  = $statment->rowCount();

if($count > 0){
      $data = array(
        'admin_approval' => 1,
    );
    updateData('admin',$data,"admin_email = '$email'",true);
  
}else{
     echo json_encode(array('status' => 'failure', 'message' => 'VCODE ERROR'));
   
}
?>