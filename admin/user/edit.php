<?php
include '../../connect.php';

$id= filterReq('id');
$name = filterReq('name');
$oldimagename = filterReq('oldimagename');

$imagename = imageUpload('../../upload/user','imagefile');

if($imagename == 'empty'){
    $data = array(
        'uaer_name' => $name,
        'user_name_ar' => $name_ar,
    );
}else{
    deleteFile('../../upload/categorie', $oldimagename);
    $data = array(
        'user_name' => $name,
        'user_image' => $imagename,
    );
}

updateData('user',$data,"user_id = '$id'",true);
?>