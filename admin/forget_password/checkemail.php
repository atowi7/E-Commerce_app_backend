<?php
include '../../connect.php';

$email = filterReq('email');

$verifyCode = rand(100000,999999);

$statement = $connect->prepare("SELECT * FROM admin WHERE admin_email = ?");
$statement->execute(array($email));

$count = $statement->rowCount();
if ($count > 0) {
     $data = array(
        'admin_verifycode' => $verifyCode,
    );
     updateData('admin',$data,"admin_email = '$email'",true);
    sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifyCode);
} else {
    echo json_encode(array('status' => 'failure', 'message' => 'EMAIL DOES NOT EXIST'));
}
?>
