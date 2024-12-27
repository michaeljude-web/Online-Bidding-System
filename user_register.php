<?php
include 'db_connection.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $upload_dir = 'uploads/';
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0755, true);
    }

    $photo = $upload_dir . basename($_FILES['photo']['name']);

    if (move_uploaded_file($_FILES['photo']['tmp_name'], $photo)) {
        echo "Photo uploaded successfully!";
    } else {
        echo "Error uploading photo: " . $_FILES['photo']['error'];
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $address = $_POST['address'];
    $age = $_POST['age'];
    $gender = $_POST['gender'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $upload_dir = 'uploads/';
    $photo = $upload_dir . basename($_FILES['photo']['name']);
    $valid_id_front = $upload_dir . basename($_FILES['valid_id_front']['name']);
    $valid_id_back = $upload_dir . basename($_FILES['valid_id_back']['name']);

    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0755, true);
    }

    if ($age < 18) {
        echo "<script>alert('Age must be 18 years old or above.'); window.history.back();</script>";
        exit();
    }

    $email_check = "SELECT * FROM users WHERE email = ?";
    $stmt = $conn->prepare($email_check);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<script>alert('Email is already registered.'); window.history.back();</script>";
        exit();
    }

    move_uploaded_file($_FILES['photo']['tmp_name'], $photo);
    move_uploaded_file($_FILES['valid_id_front']['tmp_name'], $valid_id_front);
    move_uploaded_file($_FILES['valid_id_back']['tmp_name'], $valid_id_back);

    $sql = "INSERT INTO users (firstname, lastname, address, age, gender, email, password, photo, valid_id_front, valid_id_back, status)
            VALUES ('$firstname', '$lastname', '$address', '$age', '$gender', '$email', '$password', '$photo', '$valid_id_front', '$valid_id_back', 'Pending')";

    if ($conn->query($sql)) {
        echo "<script>alert('Registration successful!'); window.location.href='user_register.php';</script>";
    } else {
        echo "<script>alert('Error: " . $conn->error . "');</script>";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Account Registration</h1>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="firstname" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter your first name" required>
                </div>
                <div class="col-md-6">
                    <label for="lastname" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter your last name" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="age" class="form-label">Age</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="Enter your age" required>
                </div>
                <div class="col-md-6">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="photo" class="form-label">Profile Photo</label>
                <input type="file" class="form-control" id="photo" name="photo" accept="image/*" required>
            </div>
            <div class="mb-3">
                <label for="valid_id_front" class="form-label">Valid ID (Front)</label>
                <input type="file" class="form-control" id="valid_id_front" name="valid_id_front" accept="image/*" required>
            </div>
            <div class="mb-3">
                <label for="valid_id_back" class="form-label">Valid ID (Back)</label>
                <input type="file" class="form-control" id="valid_id_back" name="valid_id_back" accept="image/*" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary"><i class="fa fa-user-plus"></i> Register</button>
            </div>
        </form>
        <p class="text-center mt-3">
            Already have an account? <a href="user_login.php" class="text-decoration-none">Back to Login</a>
        </p>
    </div>
</body>
</html>



