<?php
include '../../connect.php';

$email = filterReq('email');
$pass = sha1($_POST['pass']);

$data = array(
        'delivery_pass' => $pass,
    );
updatedata('delivery',$data,"delivery_email= '$email'",true);
?>