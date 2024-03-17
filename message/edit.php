<?php
include '../../connect.php';

$id= filterReq('id');
$text= filterReq('text');
$data =array(
     'message_text' => $text
    );

updateDatae('message',$data,"'message_id' = $id",true);

?>