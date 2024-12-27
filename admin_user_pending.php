<?php
include 'db_connection.php';

if (isset($_GET['approve'])) {
    $id = (int)$_GET['approve'];
    $stmt = $conn->prepare("UPDATE users SET status = 'Approved' WHERE id = ?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        header("Location: admin_user_pending.php");
        exit;
    } else {
        echo "<script>alert('Error approving user: " . $conn->error . "');</script>";
    }
}

if (isset($_GET['delete'])) {
    $id = (int)$_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM users WHERE id = ?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        header("Location: admin_user_pending.php");
        exit;
    } else {
        echo "<script>alert('Error deleting user: " . $conn->error . "');</script>";
    }
}

$sql = "SELECT * FROM users WHERE status != 'Approved'";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <style>
        .sidebar {
            height: 100vh;
            background-color: #f8f9fa;
        }
        .sidebar a {
            text-decoration: none;
            color: #343a40;
        }
        .sidebar a:hover {
            background-color: #e9ecef;
            color: #495057;
        }
        .content {
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <!--Sidebar -->
        <?php include 'sidebar.php'; ?>

        <!--Content -->
        <main class="content col-md-9 col-lg-10">
        <div class="container-fluid">
                <!-- Mobile-->
                <button class="btn btn-secondary d-md-none mb-3" data-bs-toggle="offcanvas" data-bs-target="#mobileSidebar" aria-controls="mobileSidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <h1>Pending Users</h1>
            <div class="container mt-3">
        <div class="table-responsive">
            <table class="table table-hover table-bordered text-center">
                <thead class="">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Address</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Photos</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result->num_rows > 0): ?>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td><?= htmlspecialchars($row['firstname']); ?></td>
                                <td><?= htmlspecialchars($row['lastname']); ?></td>
                                <td><?= htmlspecialchars($row['address']); ?></td>
                                <td><?= $row['age']; ?></td>
                                <td><?= htmlspecialchars($row['gender']); ?></td>
                                <td><?= htmlspecialchars($row['email']); ?></td>
                                <td>
    <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#viewPhotosModal" 
        onclick="loadPhotos('uploads/<?= htmlspecialchars($row['photo']); ?>', 'uploads/<?= htmlspecialchars($row['valid_id_front']); ?>', 'uploads/<?= htmlspecialchars($row['valid_id_back']); ?>')">
        View Photos
    </button>
</td>

                                <td>
                                <a href="admin_user_pending.php?delete=<?= $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this user?');">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    <a href="admin_user_pending.php?approve=<?= $row['id']; ?>" class="btn btn-success btn-sm" onclick="return confirm('Approve this user?');">
                                        <i class="fa fa-check"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="9">No pending users found.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="viewPhotosModal" tabindex="-1" aria-labelledby="viewPhotosModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewPhotosModalLabel">User Photos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <img id="profilePhoto" src="" alt="Profile Photo" class="img-fluid rounded mb-3" style="max-height: 700px;">
                            <!-- <p>Profile Photo</p> -->
                        </div>
                        <div class="col-md-4 text-center">
                            <img id="frontPhoto" src="" alt="Front ID" class="img-fluid rounded mb-3" style="max-height: 700px;">
                            <!-- <p>Front ID</p> -->
                        </div>
                        <div class="col-md-4 text-center">
                            <img id="backPhoto" src="" alt="Back ID" class="img-fluid rounded mb-3" style="max-height: 700px;">
                            <!-- <p>Back ID</p> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function loadPhotos(photo, front, back) {
    console.log(photo, front, back);  // Debugging: Check if the paths are correct
    document.getElementById('profilePhoto').src = photo;
    document.getElementById('frontPhoto').src = front;
    document.getElementById('backPhoto').src = back;
}

    </script>
        </main>
    </div>
</body>
</html>