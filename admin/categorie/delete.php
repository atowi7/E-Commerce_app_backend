<?php
include '../../connect.php';

$id = filterReq('id');
$imagename = filterReq('imagename');

deleteFile('../../upload/categorie', $imagename);

deleteData('categorie',"categorie_id = '$id'");
?>
