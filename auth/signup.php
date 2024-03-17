<?php
include '../connect.php';

$name = filterReq('name');
$email = filterReq('email');
$pass = sha1($_POST['pass']);
//$phone = filterReq('phone');

$verifyCode = rand(100000,999999);

$date = filterReq('date');

$statement = $connect->prepare("SELECT * FROM user WHERE user_email = ?");
$statement->execute(array($email));

$count = $statement->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'failure', 'message' => 'EMAIL OR PHONE EXIST'));
} else {
    $data = array(
        'user_name' => $name,
        'user_email' => $email,
        'user_pass' => $pass,
        // 'user_phone' => $phone,
        'user_verifycode' => $verifyCode,
        'user_createdat' => $date,
    );
    
    sendEmail($email,'E-Commerce App : Verify Code','Verify Code : '. $verifyCode);
    insertData('user', $data);
}
?>
