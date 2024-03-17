<?php
include '../../connect.php';

$email = filterReq('email');
$pass = sha1($_POST['pass']);

$data = array(
        'admin_pass' => $pass,
    );
updatedata('admin',$data,"admin_email= '$email'",true);
?>