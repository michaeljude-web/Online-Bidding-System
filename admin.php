<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Admin Panel: Pending Users</h1>
        <div class="table-responsive">
            <table class="table table-hover table-bordered text-center">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
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
                                <td><?= $row['id']; ?></td>
                                <td><?= htmlspecialchars($row['firstname']); ?></td>
                                <td><?= htmlspecialchars($row['lastname']); ?></td>
                                <td><?= htmlspecialchars($row['address']); ?></td>
                                <td><?= $row['age']; ?></td>
                                <td><?= htmlspecialchars($row['gender']); ?></td>
                                <td><?= htmlspecialchars($row['email']); ?></td>
                                <td>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#viewPhotosModal" 
                                        onclick="loadPhotos('<?= htmlspecialchars($row['photo']); ?>', '<?= htmlspecialchars($row['valid_id_front']); ?>', '<?= htmlspecialchars($row['valid_id_back']); ?>')">
                                        View Photos
                                    </button>
                                </td>
                                <td>
                                    <a href="admin.php?approve=<?= $row['id']; ?>" class="btn btn-success btn-sm" onclick="return confirm('Approve this user?');">
                                        <i class="fa fa-check"></i>
                                    </a>
                                    <a href="admin.php?delete=<?= $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this user?');">
                                        <i class="fa fa-trash"></i>
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
                            <img id="profilePhoto" src="" alt="Profile Photo" class="img-fluid rounded mb-3" style="max-height: 400px;">
                            <p>Profile Photo</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <img id="frontPhoto" src="" alt="Front ID" class="img-fluid rounded mb-3" style="max-height: 400px;">
                            <p>Front ID</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <img id="backPhoto" src="" alt="Back ID" class="img-fluid rounded mb-3" style="max-height: 400px;">
                            <p>Back ID</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function loadPhotos(photo, front, back) {
            document.getElementById('profilePhoto').src = photo;
            document.getElementById('frontPhoto').src = front;
            document.getElementById('backPhoto').src = back;
        }
    </script>
</body>
</html>
