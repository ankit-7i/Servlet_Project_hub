<%@page import="com.project.adminpage.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Added - ElectroStore Admin</title>
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
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--dark);
            padding: 20px;
        }
        
        .confirmation-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 800px;
            width: 100%;
        }
        
        .confirmation-header {
            background: linear-gradient(to right, var(--success), #27ae60);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .confirmation-body {
            padding: 40px;
            text-align: center;
        }
        
        .success-icon {
            font-size: 5rem;
            color: var(--success);
            margin-bottom: 20px;
        }
        
        .confirmation-message {
            background: var(--light);
            border-radius: 15px;
            padding: 25px;
            margin: 30px 0;
            border-left: 5px solid var(--success);
        }
        
        .message-text {
            font-size: 1.3rem;
            margin-bottom: 0;
        }
        
        .admin-name {
            font-weight: 700;
            color: var(--primary);
        }
        
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }
        
        .action-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            text-decoration: none;
            color: inherit;
        }
        
        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            color: inherit;
        }
        
        .action-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
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
        
        .action-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .action-description {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .quick-stats {
            background: var(--light);
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
        }
        
        .stats-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary);
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }
        
        .stat-item {
            text-align: center;
            padding: 15px;
            background: white;
            border-radius: 10px;
        }
        
        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 0.85rem;
        }
        
        @media (max-width: 768px) {
            .confirmation-body {
                padding: 30px 20px;
            }
            
            .confirmation-header {
                padding: 25px 20px;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }
            
            .success-icon {
                font-size: 4rem;
            }
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="confirmation-header">
            <div class="logo">
                <i class="fas fa-laptop-code me-2"></i>ElectroStore
            </div>
            <div>Product Management</div>
        </div>
        
        <div class="confirmation-body">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            
            <h2 class="mb-4">Product Successfully Added!</h2>
            
            <div class="confirmation-message">
                <p class="message-text">
                    <%
                        AdminBean abean =(AdminBean) session.getAttribute("AdminBean");
                        String data = (String)request.getAttribute("msg");
                        out.println(data + " by <span class='admin-name'>Mr. " + abean.getA_fname() + "</span>");
                    %>
                </p>
            </div>
            
            <div class="action-buttons">
                <a href="AddProduct.html" class="action-card">
                    <div class="action-icon add-product">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <div class="action-title">Add Another Product</div>
                    <div class="action-description">Add more products to inventory</div>
                </a>
                
                <a href="view1" class="action-card">
                    <div class="action-icon view-product">
                        <i class="fas fa-list-alt"></i>
                    </div>
                    <div class="action-title">View Products</div>
                    <div class="action-description">Manage existing products</div>
                </a>
                
                <a href="logout" class="action-card">
                    <div class="action-icon logout">
                        <i class="fas fa-sign-out-alt"></i>
                    </div>
                    <div class="action-title">Logout</div>
                    <div class="action-description">Exit admin panel</div>
                </a>
            </div>
            
            <div class="quick-stats">
                <div class="stats-title">Inventory Overview</div>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-value">153</div>
                        <div class="stat-label">Total Products</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">24</div>
                        <div class="stat-label">Categories</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">12</div>
                        <div class="stat-label">Low Stock</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">98%</div>
                        <div class="stat-label">Availability</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>