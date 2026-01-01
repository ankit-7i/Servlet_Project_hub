<%@page import="com.project.adminpage.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - ElectroStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #2ecc71;
            --warning: #f39c12;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            color: var(--dark);
            min-height: 100vh;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .dashboard-header {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .welcome-text {
            font-size: 1.5rem;
            margin-bottom: 0;
        }
        
        .admin-info {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 15px;
            border-radius: 10px;
            display: inline-block;
        }
        
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        
        .dashboard-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            border: none;
            height: 100%;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .card-icon {
            font-size: 3.5rem;
            margin-bottom: 20px;
        }
        
        .add-product {
            color: var(--success);
        }
        
        .view-product {
            color: var(--secondary);
        }
        
        .logout {
            color: var(--accent);
        }
        
        .card-title {
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        .card-description {
            color: #6c757d;
            margin-bottom: 20px;
        }
        
        .btn-card {
            display: inline-block;
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            border: 2px solid;
        }
        
        .btn-add {
            background: var(--success);
            border-color: var(--success);
            color: white;
        }
        
        .btn-add:hover {
            background: transparent;
            color: var(--success);
        }
        
        .btn-view {
            background: var(--secondary);
            border-color: var(--secondary);
            color: white;
        }
        
        .btn-view:hover {
            background: transparent;
            color: var(--secondary);
        }
        
        .btn-logout {
            background: var(--accent);
            border-color: var(--accent);
            color: white;
        }
        
        .btn-logout:hover {
            background: transparent;
            color: var(--accent);
        }
        
        .stats-section {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .stats-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary);
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .stat-item {
            text-align: center;
            padding: 15px;
            border-radius: 10px;
            background: var(--light);
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .quick-actions {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .actions-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary);
        }
        
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }
        
        .action-item {
            text-align: center;
            padding: 15px;
            border-radius: 10px;
            background: var(--light);
            transition: all 0.3s;
            cursor: pointer;
        }
        
        .action-item:hover {
            background: var(--secondary);
            color: white;
        }
        
        .action-icon {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 15px;
            }
            
            .dashboard-header {
                padding: 20px;
            }
            
            .welcome-text {
                font-size: 1.3rem;
            }
            
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="dashboard-header">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <div class="logo">
                        <i class="fas fa-laptop-code me-2"></i>ElectroStore
                    </div>
                    <div class="welcome-text">
                        <%
                            AdminBean abean = (AdminBean)session.getAttribute("AdminBean");
                            out.println("Welcome, " + abean.getA_fname() + "!");
                        %>
                    </div>
                </div>
                <div class="admin-info">
                    <i class="fas fa-user-shield me-2"></i>Administrator
                </div>
            </div>
        </div>
        
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="card-icon add-product">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <div class="card-title">Add New Product</div>
                <div class="card-description">
                    Add new electronics products to your store inventory
                </div>
                <a href="AddProduct.html" class="btn-card btn-add">
                    <i class="fas fa-plus me-2"></i>Add Product
                </a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon view-product">
                    <i class="fas fa-list-alt"></i>
                </div>
                <div class="card-title">View Products</div>
                <div class="card-description">
                    View, edit or delete existing products in your inventory
                </div>
                <a href="view1" class="btn-card btn-view">
                    <i class="fas fa-eye me-2"></i>View Products
                </a>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon logout">
                    <i class="fas fa-sign-out-alt"></i>
                </div>
                <div class="card-title">Logout</div>
                <div class="card-description">
                    Securely logout from the admin dashboard
                </div>
                <a href="logout" class="btn-card btn-logout">
                    <i class="fas fa-power-off me-2"></i>Logout
                </a>
            </div>
        </div>
        
        <div class="stats-section">
            <div class="stats-title">Store Overview</div>
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-value">152</div>
                    <div class="stat-label">Total Products</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">24</div>
                    <div class="stat-label">Categories</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">1,258</div>
                    <div class="stat-label">Orders Today</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">$12,458</div>
                    <div class="stat-label">Revenue</div>
                </div>
            </div>
        </div>
        
        <div class="quick-actions">
            <div class="stats-title">Quick Actions</div>
            <div class="actions-grid">
                <div class="action-item">
                    <div class="action-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>Manage Users</div>
                </div>
                <div class="action-item">
                    <div class="action-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <div>View Reports</div>
                </div>
                <div class="action-item">
                    <div class="action-icon">
                        <i class="fas fa-tags"></i>
                    </div>
                    <div>Manage Offers</div>
                </div>
                <div class="action-item">
                    <div class="action-icon">
                        <i class="fas fa-cog"></i>
                    </div>
                    <div>Settings</div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>