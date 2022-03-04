<?php
require "../config/DataResources.php";
require "../config/MonthList.php";
require "../config/TypeList.php";

$type = $_POST['type'];
$weight = $_POST['cargo'];
$month = $_POST['month'];

if ($type && $weight && $month) {
    $answer = $resourcesData[$type][$weight][$month];
}
?>

<!DOCTYPE html>
<html lang="ru">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Калькулятор рассчета стоимости грузоперевозок</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<form method="POST">
		<h1>Калькулятор рассчета стоимости грузоперевозок</h1>
		<div class="calc">
			<div class="month">
				<p>Выберите месяц доставки:</p>
				<select name="month">
					<?php foreach ($monthList as $key => $value) : ?>
						<?php echo "<option value='$key'>$value</option>" ?>
					<?php endforeach ?>
				</select>
			</div>
			<div class="material-type">
				<p>Выберите тип сырья:</p>
				<select name="type">
					<?php foreach ($typeList as $key => $value) : ?>
						<?php echo "<option value='$key'>$value</option>" ?>
					<?php endforeach ?>
				</select>
			</div>
			<div class="cargo">
				<p>Выберите тоннаж товара:</p>
				<select name="cargo">
					<?php foreach (array_keys($resourcesData['shrot']) as $value) : ?>
						<?= "<option value='$value'>$value тонн</option>" ?>
					<?php endforeach ?>
				</select>
			</div>
		</div>
		<div class="button">
			<input type="submit" value="Рассчитать" class="btn">
			<div class="textarea">Ответ:<br>
				<?php if ($answer) {
					echo $_POST['type'] . ', ' . $_POST['cargo'] . ', ' . $_POST['month'] . ' = ' . $answer . ' тонн';
				}; ?>
			</div>
		</div>
	</form>

	<?php if ($type) : ?>
		<h2>Таблица расчета <?= $typeList[$type] ?></h2>
		<table>
			<tr>
				<th>вес\дата</th>
				<?php foreach ($monthList as $value) : ?>
					<th><?= $value ?></th>
				<?php endforeach; ?>
			</tr>
			<?php foreach ($resourcesData[$type] as $key => $value) : ?>
				<tr>
					<td><?= $key ?> Тонн</td>
					<?php foreach ($value as $key2 => $price) : ?>
						<td <?php if ($key == $weight && $price == $answer && $key2 == $month) : ?> class='aim' <?php endif; ?>><?= $price ?></td>
					<?php endforeach; ?>
				</tr>
			<?php endforeach; ?>
		</table>
	<?php endif; ?>

</body>

</html>