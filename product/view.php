<?php

include '../connect.php';

$userid = filterReq('userid');
$cid = filterReq('cid');

$statment = $connect->prepare("SELECT productview.*, 1 as favorite FROM productview INNER JOIN favorite ON favorite.fav_userid= '$userid' AND favorite.fav_proid=productview.pro_id 
WHERE pro_active = 1 AND categorie_id = '$cid'
UNION
SELECT productview.*, 0 AS favorite from productview where pro_id NOT IN (SELECT fav_proid FROM favorite where fav_userid ='$userid') AND categorie_id = '$cid'");

$statment->execute();

$data = $statment->fetchAll(PDO::FETCH_ASSOC);

$rowcount = $statment->rowCount();
if ($rowcount > 0) {
    echo json_encode(array('status' => 'success', 'data' => $data));
    } else {
     echo json_encode(array('status' => 'failure'));
    }

//   return $rowcount;



// getAllData('productview',"cat_id = '$cid'");

?>