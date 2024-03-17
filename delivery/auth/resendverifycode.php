<?php
include '../../connect.php';
$email = filterReq('email');
$verifyCode = rand(100000,999999);

 sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifyCode);
 $data = array(
     'delivery_verifycode' => $verifyCode,
    );
 updateData('delivery',$data,"delivery_email = '$email'",true);
?>