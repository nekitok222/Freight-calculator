<?php

$month = 'SELECT rus_month, id FROM month';
$result_query_month = mysqli_query($link, $month);
return mysqli_fetch_all($result_query_month, MYSQLI_ASSOC);

