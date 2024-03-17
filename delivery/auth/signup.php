<?php
include '../../connect.php';

$name = filterReq('name');
$email = filterReq('email');
$pass = sha1($_POST['pass']);
$phone = filterReq('phone');

$verifyCode = rand(100000,999999);


$statement = $connect->prepare("SELECT * FROM delivery WHERE delivery_email = ? OR delivery_phone = ?");
$statement->execute(array($email, $phone));

$count = $statement->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'failure', 'message' => 'EMAIL OR PHONE EXIST'));
} else {
    $data = array(
        'delivery_name' => $name,
        'delivery_email' => $email,
        'delivery_pass' => $pass,
        'delivery_phone' => $phone,
        'delivery_verifycode' => $verifyCode,
    );
    
    sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifyCode);
    insertData('delivery', $data);
}
?>
