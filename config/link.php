<?php

$link = mysqli_connect('192.168.10.171', 'admin', '1234', 'dataresources');
mysqli_set_charset($link,'utf8');
if (mysqli_connect_errno()) {
    echo 'error (' . mysqli_connect_errno() . '): ' . mysqli_connect_error();
    exit();
}
