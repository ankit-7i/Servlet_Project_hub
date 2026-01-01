<%@page import="java.util.Iterator"%>
<%@page import="com.project.product_management.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.adminpage.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Inventory - ElectroStore Admin</title>
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
            max-width: 1400px;
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
        
        .inventory-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .inventory-header {
            background: var(--light);
            padding: 20px 25px;
            border-bottom: 1px solid #e1e5ee;
        }
        
        .inventory-title {
            font-size: 1.4rem;
            font-weight: 600;
            margin: 0;
            color: var(--primary);
        }
        
        .inventory-body {
            padding: 0;
        }
        
        .table {
            margin: 0;
        }
        
        .table thead th {
            background: var(--primary);
            color: white;
            border: none;
            padding: 15px 20px;
            font-weight: 600;
        }
        
        .table tbody td {
            padding: 15px 20px;
            vertical-align: middle;
            border-color: #e1e5ee;
        }
        
        .table tbody tr {
            transition: all 0.3s;
        }
        
        .table tbody tr:hover {
            background: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        }
        
        .product-code {
            font-weight: 600;
            color: var(--primary);
        }
        
        .product-name {
            font-weight: 500;
        }
        
        .product-company {
            color: #6c757d;
        }
        
        .product-price {
            font-weight: 600;
            color: var(--success);
        }
        
        .product-qty {
            font-weight: 500;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .btn-edit {
            background: var(--warning);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.85rem;
            transition: all 0.3s;
            text-decoration: none;
        }
        
        .btn-edit:hover {
            background: #e67e22;
            color: white;
            transform: translateY(-2px);
        }
        
        .btn-delete {
            background: var(--accent);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.85rem;
            transition: all 0.3s;
            text-decoration: none;
        }
        
        .btn-delete:hover {
            background: #c0392b;
            color: white;
            transform: translateY(-2px);
        }
        
        .empty-inventory {
            text-align: center;
            padding: 60px 20px;
        }
        
        .empty-icon {
            font-size: 4rem;
            color: #bdc3c7;
            margin-bottom: 20px;
        }
        
        .empty-text {
            font-size: 1.3rem;
            color: #7f8c8d;
            margin-bottom: 25px;
        }
        
        .btn-add-first {
            background: var(--success);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-add-first:hover {
            background: #27ae60;
            color: white;
            transform: translateY(-2px);
        }
        
        .quick-actions {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        }
        
        .btn-action {
            background: white;
            border: 2px solid #e1e5ee;
            color: var(--dark);
            padding: 10px 20px;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-action:hover {
            background: var(--secondary);
            color: white;
            border-color: var(--secondary);
        }
        
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
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
        
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 15px;
            }
            
            .dashboard-header {
                padding: 20px;
            }
            
            .table thead {
                display: none;
            }
            
            .table tbody tr {
                display: block;
                margin-bottom: 15px;
                border: 1px solid #e1e5ee;
                border-radius: 10px;
                padding: 15px;
            }
            
            .table tbody td {
                display: block;
                text-align: right;
                padding: 10px 15px;
                border: none;
            }
            
            .table tbody td:before {
                content: attr(data-label);
                float: left;
                font-weight: 600;
                color: var(--primary);
            }
            
            .action-buttons {
                justify-content: flex-end;
            }
            
            .quick-actions {
                flex-direction: column;
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
                            out.println("Hello, " + abean.getA_fname() + "!");
                        %>
                    </div>
                </div>
                <div class="admin-info">
                    <i class="fas fa-user-shield me-2"></i>Inventory Manager
                </div>
            </div>
        </div>
        
        <div class="stats-cards">
            <div class="stat-card">
                <div class="stat-value">
                    <%
                        ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("ProductList");
                        out.println(al.size());
                    %>
                </div>
                <div class="stat-label">Total Products</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">24</div>
                <div class="stat-label">Categories</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">$45,678</div>
                <div class="stat-label">Inventory Value</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">98%</div>
                <div class="stat-label">Availability</div>
            </div>
        </div>
        
        <div class="quick-actions">
            <a href="AddProduct.html" class="btn-action">
                <i class="fas fa-plus-circle"></i> Add New Product
            </a>
            <a href="AdminHome.jsp" class="btn-action">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
            <a href="logout" class="btn-action">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
        
        <div class="inventory-card">
            <div class="inventory-header">
                <h2 class="inventory-title">Product Inventory</h2>
            </div>
            <div class="inventory-body">
                <%
                    if(al.size()==0){
                %>
                    <div class="empty-inventory">
                        <div class="empty-icon">
                            <i class="fas fa-box-open"></i>
                        </div>
                        <div class="empty-text">Inventory is empty</div>
                        <a href="AddProduct.html" class="btn-add-first">
                            <i class="fas fa-plus me-2"></i>Add Your First Product
                        </a>
                    </div>
                <%
                    } else {
                %>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Company</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Iterator<ProductBean> i = al.iterator();
                                while (i.hasNext()){
                                    ProductBean pb = i.next();
                            %>
                            <tr>
                                <td data-label="Product Code" class="product-code"><%= pb.getP_code() %></td>
                                <td data-label="Product Name" class="product-name"><%= pb.getP_name() %></td>
                                <td data-label="Company" class="product-company"><%= pb.getP_company() %></td>
                                <td data-label="Price" class="product-price">$<%= pb.getP_price() %></td>
                                <td data-label="Quantity" class="product-qty"><%= pb.getP_qty() %></td>
                                <td data-label="Actions">
                                    <div class="action-buttons">
                                        <a href='edit?pcode=<%= pb.getP_code() %>' class="btn-edit">
                                            <i class="fas fa-edit me-1"></i>Edit
                                        </a>
                                        <a href='delete?pcode=<%= pb.getP_code() %>' class="btn-delete">
                                            <i class="fas fa-trash me-1"></i>Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>