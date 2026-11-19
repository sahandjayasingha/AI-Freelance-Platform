<?php
$serverName = "YOUR_SERVER_NAME\\SQLEXPRESS";
$connectionOptions = array(
    "Database" => "AI_Freelance_DB",
    "Uid" => "",
    "PWD" => ""
);

$conn = sqlsrv_connect($serverName, $connectionOptions);
if ($conn === false) {
    die(print_r(sqlsrv_errors(), true));
}
?>
