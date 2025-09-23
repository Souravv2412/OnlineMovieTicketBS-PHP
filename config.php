<?php
$host = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASS');
$db = getenv('DB_NAME');
$port = getenv('DB_PORT');
$con = mysqli_connect($host, $user, $pass, $db, $port) or die(mysqli_error());

// Use $con instead of $conn (as you defined above)
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
?>