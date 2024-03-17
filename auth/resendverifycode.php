<?php
include '../connect.php';
$email = filterReq('email');
$verifycode = rand(100000,999999);

sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifycode);

$data = array(
       "user_verifycode"=> $verifycode
    );

updateData('user',$data,"user_email = '$email'",true);
?>