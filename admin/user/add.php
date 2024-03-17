<?php
include '../../connect.php';

$name = filterReq('name');
$imagename = imageUpload('../../upload/user','imagefile');

$data = array(
        'uer_name' => $name,
        'user_image' => $imagename,
    );
    
insertData('user', $data);
?>
