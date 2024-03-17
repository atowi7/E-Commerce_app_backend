<?php
include '../../connect.php';

$email = filterReq('email');
$pass = sha1($_POST['pass']);

getData('delivery','delivery_email = ? AND delivery_pass = ?',array($email, $pass));

// $statement = $connect->prepare("SELECT * FROM user WHERE email = ? AND pass = ? AND approval =1");
// $statement->execute(array($useremail, $userpass));

// $count = $statement->rowCount();
// if ($count > 0) {
//     echo json_encode(array('status' => 'sucess'));
// } else {
//     echo json_encode(array('status' => 'failure', 'message' => 'EMAIL OR PHONE EXIST'));
  
// }

?>
