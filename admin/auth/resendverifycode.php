<?php
include '../../connect.php';
$email = filterReq('email');
$verifyCode = rand(100000,999999);

 sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifyCode);
 $data = array(
     'admin_verifycode' => $verifyCode,
    );
 updateData('admin',$data,"admin_email = '$email'",true);
?>