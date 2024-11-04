<?php
$servername = 'localhost';
$username = 'dbuser';
$password = 'dbpassword';
$dbname = 'simple-db';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

echo 'Connected successfully';

// Query to fetch data from the users table
$result = $conn->query('SELECT * FROM users');

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo 'ID: ' . $row['id'] . ' - Name: ' . $row['name'] . ' - Email: ' . $row['email'] . '<br>';
    }
} else {
    echo 'No results found.';
}

$conn->close();
?>