<?php

$sname= "localhost:3306";
$unmae= "root";
$password = "sqlroot0";

$db_name = "projectdbmt";

$conn = mysqli_connect($sname, $unmae, $password, $db_name);

if (!$conn) {
	echo "Connection failed!";
}
?>