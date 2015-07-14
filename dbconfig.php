<?php

$host = getenv("OPENSHIFT_MYSQL_DB_HOST");
$user = getenv("OPENSHIFT_MYSQL_DB_USERNAME");
$pass = getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
$port = getenv('OPENSHIFT_MYSQL_DB_PORT');
$db = getenv("OPENSHIFT_APP_NAME");

/*$host = "localhost";
$user = "root";
$pass = "";
$db = "music_bank";
$port = 3306;*/

$mysqlCon = mysqli_connect($host, $user, $pass, "", $port) or die("Error: " . mysqli_error($mysqlCon));
mysqli_select_db($mysqlCon, $db) or die("Error: " . mysqli_error($mysqlCon));
?>