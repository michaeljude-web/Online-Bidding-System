<?php
include 'db_connection.php';

$limit = 10;  
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$offset = ($page - 1) * $limit;

// Search functionality
$search = isset($_GET['search']) ? $_GET['search'] : '';

// search functionality
$query = "SELECT id, firstname, lastname, address, age, gender, email 
          FROM users 
          WHERE status = 'Approved' 
          AND (firstname LIKE ? OR lastname LIKE ? OR email LIKE ?) 
          LIMIT $limit OFFSET $offset";

$stmt = $conn->prepare($query);
$searchTerm = '%' . $search . '%';
$stmt->bind_param('sss', $searchTerm, $searchTerm, $searchTerm);
$stmt->execute();
$result = $stmt->get_result();

//  for pagination
$totalQuery = "SELECT COUNT(*) as total FROM users WHERE status = 'Approved' AND (firstname LIKE ? OR lastname LIKE ? OR email LIKE ?)";
$totalStmt = $conn->prepare($totalQuery);
$totalStmt->bind_param('sss', $searchTerm, $searchTerm, $searchTerm);
$totalStmt->execute();
$totalResult = $totalStmt->get_result();
$totalRow = $totalResult->fetch_assoc();
$totalRecords = $totalRow['total'];
$totalPages = ceil($totalRecords / $limit);

// Delete user
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['delete'])) {
    $userId = intval($_GET['delete']);
    $query = "DELETE FROM users WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>
<div class="d-flex">
    <!-- Sidebar -->
    <?php include 'sidebar.php'; ?>

    <!-- Content -->
    <main class="content col-md-9 col-lg-10">
    <div class="container-fluid">
        <!-- Mobile -->
        <button class="btn btn-secondary d-md-none mb-3" data-bs-toggle="offcanvas" data-bs-target="#mobileSidebar" aria-controls="mobileSidebar">
            <i class="fas fa-bars"></i>
        </button>
        <h1>List of Users</h1>

        <!-- Search Form -->
        <form method="GET" action="" class="mb-3">
            <input type="text" name="search" value="<?= htmlspecialchars($search); ?>" class="form-control" placeholder="Search by firstname, lastname, or email">
        </form>

        <div class="container mt-3">
            <div class="table-responsive">
                <table class="table table-hover table-bordered text-center">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td><?= htmlspecialchars($row['firstname']); ?></td>
                                <td><?= htmlspecialchars($row['lastname']); ?></td>
                                <td><?= htmlspecialchars($row['address']); ?></td>
                                <td><?= htmlspecialchars($row['age']); ?></td>
                                <td><?= htmlspecialchars($row['gender']); ?></td>
                                <td><?= htmlspecialchars($row['email']); ?></td>
                                <td>
                                    <a href="?delete=<?= $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?');">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <!-- Pagination -->
<nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
        <li class="page-item <?= $page <= 1 ? 'disabled' : ''; ?>">
            <a class="page-link" href="?page=1&search=<?= htmlspecialchars($search); ?>" aria-label="First">
                <span aria-hidden="true">&laquo;&laquo;</span>
            </a>
        </li>
        <li class="page-item <?= $page <= 1 ? 'disabled' : ''; ?>">
            <a class="page-link" href="?page=<?= $page - 1; ?>&search=<?= htmlspecialchars($search); ?>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        
        <!-- Page numbers -->
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
            <li class="page-item <?= $i == $page ? 'active' : ''; ?>">
                <a class="page-link" href="?page=<?= $i; ?>&search=<?= htmlspecialchars($search); ?>"><?= $i; ?></a>
            </li>
        <?php endfor; ?>

        <li class="page-item <?= $page >= $totalPages ? 'disabled' : ''; ?>">
            <a class="page-link" href="?page=<?= $page + 1; ?>&search=<?= htmlspecialchars($search); ?>" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
        <li class="page-item <?= $page >= $totalPages ? 'disabled' : ''; ?>">
            <a class="page-link" href="?page=<?= $totalPages; ?>&search=<?= htmlspecialchars($search); ?>" aria-label="Last">
                <span aria-hidden="true">&raquo;&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

        </div>
    </div>
    </main>
</div>
</body>
</html>

<?php
$conn->close();
?>
 