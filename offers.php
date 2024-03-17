<?php

include './connect.php';

// $userid = filterReq('userid');

// $statment = $connect->prepare("SELECT productview.*, 1 as favorite, productview.pro_price-(productview.pro_price*(productview.pro_discount/100)) as priceafterdiscount FROM productview INNER JOIN favorite ON favorite.fav_userid= '$userid' AND favorite.fav_proid=productview.pro_id 
// WHERE pro_discount > 0
// UNION
// SELECT productview.*, 0 AS favorite, productview.pro_price-(productview.pro_price*(productview.pro_discount/100)) as priceafterdiscount from productview where pro_id NOT IN (SELECT fav_proid FROM favorite where fav_userid ='$userid') AND pro_discount > 0");

// $statment->execute();

// $data = $statment->fetchAll(PDO::FETCH_ASSOC);

// $rowcount = $statment->rowCount();
// if ($rowcount > 0) {
//     echo json_encode(array('status' => 'sucess', 'data' => $data));
//     } else {
//      echo json_encode(array('status' => 'failure'));
//     }

//   return $rowcount;



 getAllData('productview',"pro_active = 1 AND pro_discount > 0");

?>