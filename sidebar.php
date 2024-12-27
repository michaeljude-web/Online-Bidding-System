<!-- This page is Sidebar of our System -->
<!-- Sidebar -->
<nav class="sidebar d-none d-md-block col-md-3 col-lg-2 px-3">
    <h4 class="mt-3">Blue Market</h4>
    <ul class="nav flex-column">
        <li class="nav-item mb-2">
            <a class="nav-link" href="admin_dashboard.php"><i class="fas fa-home me-2"></i> Dashboard</a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#productsMenu" aria-expanded="false">
                <i class="fas fa-boxes me-2"></i> Products
            </a>
            <ul class="collapse list-unstyled ps-3" id="productsMenu">
                <li><a class="nav-link" href="admin_add_product.php">Add Products</a></li>
                <li><a class="nav-link" href="admin_product_list.php">Product List</a></li>
            </ul>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="admin_bid.php"><i class="fas fa-gavel me-2"></i> Bidding</a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#usersMenu" aria-expanded="false">
                <i class="fas fa-users me-2"></i> Users
            </a>
            <ul class="collapse list-unstyled ps-3" id="usersMenu">
                <li><a class="nav-link" href="admin_user_list.php">User List</a></li>
                <li><a class="nav-link" href="admin_user_pending.php">Pending Users</a></li>
            </ul>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="admin_reviews.php"><i class="fas fa-comment me-2"></i> Reviews</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="logout.php"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
        </li>
    </ul>
</nav>

<!-- Mobile Sidebar -->
<div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="mobileSidebar" aria-labelledby="mobileSidebarLabel">
    <div class="offcanvas-header bg-secondary">
        <h5 class="offcanvas-title" id="mobileSidebarLabel">Blue Market</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="nav flex-column">
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="index.php"><i class="fas fa-home me-2"></i> Dashboard</a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white dropdown-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#productsMenuMobile" aria-expanded="false">
                    <i class="fas fa-boxes me-2"></i> Products
                </a>
                <ul class="collapse list-unstyled ps-3" id="productsMenuMobile">
                    <li><a class="nav-link text-white" href="#">Add Products</a></li>
                    <li><a class="nav-link text-white" href="#">Product List</a></li>
                </ul>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="#"><i class="fas fa-gavel me-2"></i> Bidding</a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white dropdown-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#usersMenuMobile" aria-expanded="false">
                    <i class="fas fa-users me-2"></i> Users
                </a>
                <ul class="collapse list-unstyled ps-3" id="usersMenuMobile">
                    <li><a class="nav-link text-white" href="#">User List</a></li>
                    <li><a class="nav-link text-white" href="#">Pending Users</a></li>
                </ul>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="#"><i class="fas fa-comment me-2"></i> Reviews</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="logout.php"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
            </li>
        </ul>
    </div>
</div>
