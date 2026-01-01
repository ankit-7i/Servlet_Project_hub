<%@page import="com.project.product_management.ProductBean"%>
<%@page import="com.project.adminpage.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - ElectroStore Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --warning: #f39c12;
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
        
        .edit-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 800px;
            width: 100%;
        }
        
        .edit-header {
            background: linear-gradient(to right, var(--warning), #e67e22);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .page-title {
            font-size: 1.5rem;
            margin-bottom: 0;
            position: relative;
            display: inline-block;
        }
        
        .page-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: white;
            border-radius: 2px;
        }
        
        .edit-body {
            padding: 40px;
        }
        
        .welcome-message {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .admin-name {
            font-weight: 700;
            color: var(--primary);
        }
        
        .form-card {
            background: var(--light);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 25px;
        }
        
        .product-info {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
            border-left: 4px solid var(--warning);
        }
        
        .info-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary);
        }
        
        .info-item {
            display: flex;
            margin-bottom: 10px;
        }
        
        .info-label {
            font-weight: 600;
            width: 150px;
            color: var(--dark);
        }
        
        .info-value {
            color: #6c757d;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--primary);
        }
        
        .form-control {
            padding: 12px 15px;
            border-radius: 10px;
            border: 2px solid #e1e5ee;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--warning);
            box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25);
        }
        
        .input-group-text {
            background: white;
            border: 2px solid #e1e5ee;
            border-right: none;
            border-radius: 10px 0 0 10px;
        }
        
        .form-control.with-icon {
            border-left: none;
            border-radius: 0 10px 10px 0;
        }
        
        .btn-update {
            background: linear-gradient(to right, var(--warning), #e67e22);
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s;
            width: 100%;
            font-size: 1.1rem;
        }
        
        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 25px;
        }
        
        .btn-action {
            background: white;
            border: 2px solid #e1e5ee;
            color: var(--dark);
            padding: 10px;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            text-align: center;
        }
        
        .btn-action:hover {
            background: var(--secondary);
            color: white;
            border-color: var(--secondary);
        }
        
        .edit-icon {
            font-size: 2.5rem;
            color: var(--warning);
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            .edit-body {
                padding: 30px 20px;
            }
            
            .edit-header {
                padding: 20px;
            }
            
            .form-card {
                padding: 20px;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <div class="edit-header">
            <div class="logo">
                <i class="fas fa-laptop-code me-2"></i>ElectroStore
            </div>
            <div class="page-title">Edit Product</div>
        </div>
        
        <div class="edit-body">
            <div class="text-center mb-4">
                <div class="edit-icon">
                    <i class="fas fa-edit"></i>
                </div>
                <div class="welcome-message">
                    <h4>
                        <%
                            AdminBean abean = (AdminBean) session.getAttribute("AdminBean");
                            out.println("Hello <span class='admin-name'>" + abean.getA_fname() + "</span>, please edit product details");
                        %>
                    </h4>
                </div>
            </div>
            
            <div class="product-info">
                <div class="info-title">Current Product Information</div>
                <%
                    ProductBean pb = (ProductBean) request.getAttribute("pbitem");
                %>
                <div class="info-item">
                    <div class="info-label">Product Code:</div>
                    <div class="info-value"><%= pb.getP_code() %></div>
                </div>
                <div class="info-item">
                    <div class="info-label">Product Name:</div>
                    <div class="info-value"><%= pb.getP_name() %></div>
                </div>
                <div class="info-item">
                    <div class="info-label">Company:</div>
                    <div class="info-value"><%= pb.getP_company() %></div>
                </div>
            </div>
            
            <form action="update" method="post">
                <div class="form-card">
                    <h5 class="mb-4">Update Product Details</h5>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="pprice" class="form-label">Product Price ($)</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-dollar-sign"></i>
                                </span>
                                <input type="text" class="form-control with-icon" id="pprice" name="pprice" 
                                       value="<%= pb.getP_price() %>" placeholder="Enter new price" required>
                            </div>
                            <div class="form-text">Current price: $<%= pb.getP_price() %></div>
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label for="pqty" class="form-label">Product Quantity</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-cubes"></i>
                                </span>
                                <input type="text" class="form-control with-icon" id="pqty" name="pqty" 
                                       value="<%= pb.getP_qty() %>" placeholder="Enter new quantity" required>
                            </div>
                            <div class="form-text">Current quantity: <%= pb.getP_qty() %></div>
                        </div>
                    </div>
                    
                    <input type="hidden" name="pcode" value="<%= pb.getP_code() %>">
                </div>
                
                <button type="submit" class="btn btn-update mb-3">
                    <i class="fas fa-save me-2"></i>Update Product Details
                </button>
            </form>
            
            <div class="action-buttons">
                <a href="view1" class="btn-action">
                    <i class="fas fa-arrow-left me-1"></i>Back to Inventory
                </a>
                <a href="AddProduct.html" class="btn-action">
                    <i class="fas fa-plus me-1"></i>Add New Product
                </a>
                <a href="AdminHome.jsp" class="btn-action">
                    <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>