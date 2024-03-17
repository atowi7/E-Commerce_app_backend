<?php

include 'connect.php';

$data = array();
$data['status'] = 'success';

$data['headings'] = getAllData('heading',null,null,false);
$data['categories'] = getAllData('categorie',null,null,false);
$data['products'] = getAllData('productview','pro_active = 1',null,false);
$data['producttopselling'] = getAllData('producttopselling','1=1 ORDER BY cart_procount DESC',null,false);
// $data['user_favoriate'] = getAllData('userfavoritez',null,null,false);



// $rowCount = getAllData('producttopselling',null,null,false);

// if($rowCount > 0){
// $data['products'] = getAllData('producttopselling','1=1 ORDER BY cart_procount DESC',null,false);
// }else{
// $data['products'] = getAllData('productview',null,null,false);
// }


echo json_encode($data);
?>