<?php
include '../../connect.php';

$name = filterReq('name');
$name_ar = filterReq('namear');
$imagename = imageUpload('../../upload/categorie','imagefile');

$data = array(
        'categorie_name' => $name,
        'categorie_name_ar' => $name_ar,
        'categorie_image' => $imagename,
    );
    
insertData('categorie', $data);
?>
