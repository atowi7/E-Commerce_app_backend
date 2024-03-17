<?php

try{
    include '../../connect.php';

    $email = filterReq('email');
    
    $verifyCode = filterReq('verifycode');
    
    
    $statement = $connect->prepare("SELECT * FROM delivery WHERE delivery_email = ? AND delivery_verifycode = ?");
    $statement->execute(array($email,$verifyCode));
    
    $count = $statement->rowCount();
    if ($count > 0) {
         echo json_encode(array('status' => 'sucess'));
    
    } else {
        echo json_encode(array('status' => 'failure', 'message' => 'VCODE ERROR'));
    }
}catch(Exception $e){
    echo $e->getMessage();
}
?>
