<?php

include '../connect.php';

$word = filterReq('word');

getAllData('productview',"pro_name LIKE '%$word%' OR pro_name_ar LIKE '%$word%'");

?>