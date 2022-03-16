<?php

$tonnages = 'SELECT tonnages, id FROM tonnages';
$result_query_tonnages = mysqli_query($link, $tonnages);
return mysqli_fetch_all($result_query_tonnages, MYSQLI_ASSOC);