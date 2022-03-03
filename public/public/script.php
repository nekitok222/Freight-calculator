<?php
$type = $_POST['type'];
$weight = $_POST['cargo'];
$month = $_POST['month'];

if ($type && $weight && $month) {
    $answer = $resourcesData[$type][$weight][$month];
}


