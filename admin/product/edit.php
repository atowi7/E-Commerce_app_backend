<?php
include '../../connect.php';

$id= filterReq('id');
$name = filterReq('name');
$name_ar = filterReq('namear');
$desc = filterReq('desc');
$desc_ar = filterReq('descar');
$color = filterReq('color');
$color_ar = filterReq('colorar');
$imagename = imageUpload('../../upload/product','imagefile');
$oldimagename = filterReq('oldimagename');
$price = filterReq('price');
$shipping = filterReq('shipping');
$deliveryPrice = filterReq('deliveryprice');
$discount = filterReq('discount');
$payment = filterReq('payment');
$active = filterReq('active');
$count = filterReq('count');
$catid = filterReq('catid');

if($imagename == 'empty'){
   $data = array(
        'pro_name' => $name,
        'pro_name_ar' => $name_ar,
        'pro_desc' => $desc,
        'pro_desc_ar' => $desc_ar,
        'pro_color' => $color,
        'pro_color_ar' => $color_ar,
        'pro_price' => $price,
        'pro_shipping' => $shipping,
        'pro_deliveryprice' => $deliveryPrice,
        'pro_discount' => $discount,
        'pro_payment' => $payment,
        'pro_active' => $active,
        'pro_count' => $count,
        'pro_catid' => $catid,
    );
}else{
    deleteFile('../../upload/product', $oldimagename);
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
        'pro_active' => $active,
        'pro_count' => $count,
        'pro_catid' => $catid,
    );
}

updateData('product',$data,"pro_id = '$id'",true);
?>