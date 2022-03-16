<?php

$type = 'SELECT rus_type_name, id FROM types';
$result_query_type = mysqli_query($link, $type);
return mysqli_fetch_all($result_query_type, MYSQLI_ASSOC);

