<?php
include '../../connect.php';

$name = filterReq('name');
$email = filterReq('email');
$pass = sha1($_POST['pass']);
// $phone = filterReq('phone');

$verifyCode = rand(100000,999999);


$statement = $connect->prepare("SELECT * FROM admin WHERE admin_email = ?");
$statement->execute(array($email));

$count = $statement->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'failure', 'message' => 'EMAIL EXISTS'));
} else {
    $data = array(
        'admin_name' => $name,
        'admin_email' => $email,
        'admin_pass' => $pass,
        // 'admin_phone' => $phone,
        'admin_verifycode' => $verifyCode,
    );
    
    sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifyCode);
    insertData('admin', $data);
}
?>
