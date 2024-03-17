<?php
include '../../connect.php';

$name = filterReq('name');
$name_ar = filterReq('namear');
$desc = filterReq('desc');
$desc_ar = filterReq('descar');
$color = filterReq('color');
$color_ar = filterReq('colorar');
$imagename = imageUpload('../../upload/product','imagefile');
$price = filterReq('price');
$shipping = filterReq('shipping');
$deliveryPrice = filterReq('deliveryprice');
$discount = filterReq('discount');
$payment = filterReq('payment');
// $active = filterReq('active');
$count = filterReq('count');
$date = filterReq('date');
$catid = filterReq('catid');
$adminid = filterReq('adminid');

$data = array(
        'pro_name' => $name,
        'pro_name_ar' => $name_ar,
        'pro_desc' => $desc,
        'pro_desc_ar' => $desc_ar,
        'pro_color' => $color,
        'pro_color_ar' => $color_ar,
        'pro_image' => $imagename,
        'pro_price' => $price,
        'pro_shipping' => $shipping,
        'pro_deliveryprice' => $deliveryPrice,
        'pro_discount' => $discount,
        'pro_payment' => $payment,
        'pro_active' => 1,
        'pro_count' => $count,
        'pro_createdat' => $date,
        'pro_catid' => $catid,
        'pro_adminid' => $adminid,
    );
    
insertData('product', $data);
?>
