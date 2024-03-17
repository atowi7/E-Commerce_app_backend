<?php
include '../../connect.php';

$id= filterReq('id');
$name = filterReq('name');
$name_ar = filterReq('namear');
$oldimagename = filterReq('oldimagename');

$imagename = imageUpload('../../upload/categorie','imagefile');

if($imagename == 'empty'){
    $data = array(
        'categorie_name' => $name,
        'categorie_name_ar' => $name_ar,
    );
}else{
    deleteFile('../../upload/categorie', $oldimagename);
    $data = array(
        'categorie_name' => $name,
        'categorie_name_ar' => $name_ar,
        'categorie_image' => $imagename,
    );
}

updateData('categorie',$data,"categorie_id = '$id'",true);
?>