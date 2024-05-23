<?php
session_start();

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "online tax planning courses platform";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get email and password from form
$email = $_POST['email'];
$password = $_POST['password'];

// SQL query to check if user exists
$sql = "SELECT * FROM Students WHERE Email='$email' AND Password='$password'";
$result = $conn->query($sql);

// If user exists, set session variable and redirect to user_dashboard
if ($result->num_rows > 0) {
    $_SESSION['email'] = $email;
    header("Location: user_dashboard.php");
} else {
    echo "Invalid email or password.";
}

$conn->close();
?>
