<?php

// ini_set('error_reporting', E_ALL);
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);

require "../vendor/autoload.php";


$db = require "../config/_db.php";

$link = mysqli_connect($db['host'], $db['username'], $db['password'], $db['database_name']);
mysqli_set_charset($link,'utf8');
if (mysqli_connect_errno()) {
    echo 'error (' . mysqli_connect_errno() . '): ' . mysqli_connect_error();
    exit();
}

require "../config/DataResources.php";
require "../config/MonthList.php";
require "../config/TypeList.php";

use Laminas\Diactoros\Request;

$type = $_POST['type'];
$month = $_POST['month'];
$weight = $_POST['cargo'];

$request = Laminas\Diactoros\ServerRequestFactory::fromGlobals(
    $_SERVER,
    $_GET,
    $_POST,
    $_COOKIE,
    $_FILES
);

// $type = $request->getPost();
// echo '<pre>'; print_r($type); echo '</pre>';

if ($type && $weight && $month) {
	$query = "SELECT price FROM price WHERE type_id = $type AND tonnages_id = $weight AND month_id = $month";
    $result_query_price = mysqli_query($link,$query);
	$answer = mysqli_fetch_array($result_query_price, MYSQLI_ASSOC); 
}

$price = "SELECT price, tonnages_id, month_id FROM price WHERE type_id = $type";
$result_query_prices = mysqli_query($link,$price);
$for_table = mysqli_fetch_all($result_query_prices, MYSQLI_ASSOC); 

?>

<!DOCTYPE html>
<html lang="ru">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Калькулятор рассчета стоимости грузоперевозок</title>
	<link rel="stylesheet" href="./css/style.css">
</head>

<body>
	<form method="POST">
		<h1>Калькулятор рассчета стоимости грузоперевозок</h1>
		<div class="calc">
			<div class="month">
				<p>Выберите месяц доставки:</p>
				<select name="month">
					<?php foreach ($result_query_month as $value) : ?>
						<?php
							if ($_POST['month'] == $value['id']) {
								$sql_month = $value['rus_month'];
							}
							echo "<option value='".$value['id']."'>".$value['rus_month']."</option>" ?>
					<?php endforeach ?>
				</select>
			</div>
			<div class="material-type">
				<p>Выберите тип сырья:</p>
				<select name="type">
					<?php foreach ($result_query_type as $value) : ?>
						<?php 
							if ($_POST['type'] == $value['id']) {
								$sql_type = $value['rus_type_name'];
							}
							echo "<option value='".$value['id']."'>".$value['rus_type_name']."</option>" ?>
					<?php endforeach ?>
				</select>
			</div>
			<div class="cargo">
				<p>Выберите тоннаж товара:</p>
				<select name="cargo">
					<?php foreach ($result_query_tonnages as $value) : ?>
						<?php
							if ($_POST['cargo'] == $value['id']) {
								$sql_tonnages = $value['tonnages'];
							}
							echo "<option value='".$value['id']."'>".$value['tonnages'].' тонн' . "</option>" ?>
					<?php endforeach ?>
				</select>
			</div>
		</div>
		<div class="button">
			<input type="submit" value="Рассчитать" class="btn">
			<div class="textarea">Ответ:<br>
				<?php if ($answer) {
					echo $sql_month . ', ' . $sql_type . ', '. $sql_tonnages . ' тонн = ' . $answer['price'];
				}
				?>
			</div>
		</div>
	</form>
	<?php if ($type) : ?>
		<h2>Таблица расчета <?= $sql_type ?></h2>
		<table>
			<tr>
				<th>Дата</th>
				<?php foreach ($result_query_month as $value) : ?>
					<th rowspan="2"><?= $value['rus_month'] ?></th>
				<?php endforeach; ?>
			</tr>
			<th style="border: 2px solid; border-left: 0;">Вес</th>
			<?php foreach($result_query_tonnages as $value): ?>
				<tr>
					<td style = "border-collapse: collapse"><?= $value['tonnages']?></td>
					<?php foreach($for_table as $key): ?>
						<?php if ($value['id'] == $key['tonnages_id']): ?>
							<td <?php if ($key['month_id'] == $_POST['month'] && $key['tonnages_id'] == $_POST['cargo']): ?> class="aim" <?php endif; ?>> <?= $key['price']; ?> </td>
						<?php endif; ?>
					<?php endforeach; ?> 
				</tr>
			<?php endforeach; ?>
		</table>
	<?php endif; ?>

</body>

</html>