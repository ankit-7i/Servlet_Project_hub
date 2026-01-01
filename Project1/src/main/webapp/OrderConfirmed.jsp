<%@page import="com.project.product_management.ProductBean"%>
<%@page import="com.project.customer_module.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmed - ElectroStore</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #0f2027 0%, #203a43 50%, #2c5364 100%);
        min-height: 100vh;
        color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .container {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        padding: 40px;
        width: 100%;
        max-width: 600px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .success-icon {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
        font-size: 2.5rem;
    }

    h1 {
        font-size: 2.2rem;
        margin-bottom: 10px;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
    }

    .subtitle {
        font-size: 1.1rem;
        opacity: 0.8;
        margin-bottom: 20px;
    }

    .customer-name {
        font-size: 1.3rem;
        margin-bottom: 25px;
        color: #00c6ff;
        font-weight: 600;
    }

    .order-details {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 15px;
        padding: 25px;
        margin: 0 auto 25px;
        width: 100%;
        max-width: 400px;
        text-align: center;
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .detail-row {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .detail-row:last-child {
        border-bottom: none;
    }

    .detail-label {
        opacity: 0.8;
        text-align: left;
        flex: 1;
    }

    .detail-value {
        font-weight: 600;
        text-align: right;
        flex: 1;
    }

    .amount-value {
        color: #00c6ff;
        font-size: 1.3rem;
        font-weight: bold;
    }

    .success-message {
        background: rgba(0, 198, 255, 0.1);
        border-radius: 15px;
        padding: 18px;
        margin: 20px auto;
        border-left: 4px solid #00c6ff;
        max-width: 500px;
        font-size: 1rem;
    }

    .buttons {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin-top: 30px;
        flex-wrap: wrap;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 12px 25px;
        border-radius: 10px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        min-width: 150px;
        justify-content: center;
        border: none;
    }

    .btn-primary {
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        color: white;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 114, 255, 0.4);
    }

    .btn-secondary {
        background: rgba(255, 255, 255, 0.1);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .btn-secondary:hover {
        background: rgba(255, 255, 255, 0.15);
        transform: translateY(-2px);
    }

    .btn-logout {
        background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
        color: white;
    }

    .btn-logout:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(238, 90, 36, 0.4);
    }

    footer {
        text-align: center;
        padding: 20px;
        margin-top: 30px;
        opacity: 0.7;
        font-size: 0.9rem;
        width: 100%;
    }

    @media (max-width: 768px) {
        .container {
            padding: 25px 20px;
        }
        
        h1 {
            font-size: 1.8rem;
        }
        
        .buttons {
            flex-direction: column;
            align-items: center;
            gap: 12px;
        }
        
        .btn {
            width: 100%;
            max-width: 280px;
        }
        
        .order-details {
            padding: 20px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
        
        <h1>Order Confirmed!</h1>
        <p class="subtitle">Thank you for your purchase</p>
        
        <div class="customer-name">
            <%
                CustomerBean cb = (CustomerBean)application.getAttribute("customerBean");
                if (cb != null) {
            %>
            Hello <%=cb.getCusfname()%> <%=cb.getCuslname()%>
            <%
                }
            %>
        </div>
        
        <div class="order-details">
            <%
                ProductBean pb = (ProductBean)request.getAttribute("pb");
                int reqqty = (Integer)request.getAttribute("reqqty");
                int totalAmount = (Integer)request.getAttribute("totalAmount");
                
                if (pb != null) {
            %>
            <div class="detail-row">
                <span class="detail-label">Product:</span>
                <span class="detail-value"><%=pb.getP_name()%></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Brand:</span>
                <span class="detail-value"><%=pb.getP_company()%></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Quantity:</span>
                <span class="detail-value"><%=reqqty%></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Unit Price:</span>
                <span class="detail-value">$<%=pb.getP_price()%></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Total Amount:</span>
                <span class="detail-value amount-value">$<%=totalAmount%></span>
            </div>
            <%
                }
            %>
        </div>
        
        <div class="success-message">
            <i class="fas fa-shipping-fast" style="margin-right: 10px;"></i>
            Your order is placed successfully! You will receive a confirmation email shortly.
        </div>

        <!-- BUTTONS - CLEAR AND VISIBLE -->
        <div class="buttons">
            <a href="viewcustomerproducts" class="btn btn-primary">
                <i class="fas fa-shopping-bag"></i> View Products
            </a>
            <a href="CustomerHome.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Dashboard
            </a>
            <a href="logout" class="btn btn-logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2025 ElectroStore. All rights reserved. | Premium Electronics Marketplace</p>
    </footer>
</body>
</html>