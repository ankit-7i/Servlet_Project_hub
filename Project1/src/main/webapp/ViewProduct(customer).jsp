<%@page import="java.util.Iterator"%>
<%@page import="com.project.product_management.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.customer_module.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products - ElectroStore</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
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
        overflow-x: hidden;
        padding: 0;
    }

    .dashboard-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 20px;
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 0;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        margin-bottom: 30px;
    }

    .logo {
        display: flex;
        align-items: center;
        font-size: 1.8rem;
        font-weight: 700;
    }

    .logo i {
        margin-right: 10px;
        color: #00c6ff;
    }

    .user-info {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
    }

    .welcome-section {
        text-align: center;
        margin-bottom: 40px;
        padding: 30px;
        background: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    }

    .welcome-section h1 {
        font-size: 2.5rem;
        margin-bottom: 10px;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .welcome-section p {
        font-size: 1.2rem;
        opacity: 0.8;
    }

    .products-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
        gap: 30px;
        margin-bottom: 40px;
    }

    .product-card {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        padding: 25px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
        transition: all 0.3s ease;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        position: relative;
        overflow: hidden;
    }

    .product-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: linear-gradient(to right, #00c6ff, #0072ff);
    }

    .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        border-color: rgba(0, 198, 255, 0.3);
    }

    .product-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 15px;
    }

    .product-code {
        background: rgba(0, 198, 255, 0.2);
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
    }

    .product-icon {
        font-size: 2.5rem;
        color: #00c6ff;
        opacity: 0.8;
    }

    .product-name {
        font-size: 1.4rem;
        font-weight: 600;
        margin-bottom: 10px;
        line-height: 1.3;
    }

    .product-company {
        font-size: 1rem;
        opacity: 0.8;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .product-company i {
        color: #00c6ff;
    }

    .product-details {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        padding: 15px;
        background: rgba(255, 255, 255, 0.05);
        border-radius: 10px;
    }

    .detail-item {
        text-align: center;
    }

    .detail-label {
        font-size: 0.8rem;
        opacity: 0.7;
        margin-bottom: 5px;
    }

    .detail-value {
        font-size: 1.2rem;
        font-weight: 600;
    }

    .price {
        color: #00c6ff;
    }

    .stock {
        color: #4ade80;
    }

    .btn-buy {
        display: block;
        width: 100%;
        padding: 12px;
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        color: white;
        border: none;
        border-radius: 10px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        text-align: center;
        box-shadow: 0 5px 15px rgba(0, 114, 255, 0.3);
    }

    .btn-buy:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0, 114, 255, 0.4);
        color: white;
        text-decoration: none;
    }

    .no-products {
        text-align: center;
        padding: 60px 20px;
        background: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
        grid-column: 1 / -1;
    }

    .no-products i {
        font-size: 4rem;
        margin-bottom: 20px;
        color: #00c6ff;
        opacity: 0.5;
    }

    .no-products h2 {
        font-size: 1.8rem;
        margin-bottom: 10px;
    }

    .no-products p {
        opacity: 0.7;
        font-size: 1.1rem;
    }

    .actions {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 30px;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 12px 25px;
        background: rgba(255, 255, 255, 0.1);
        color: white;
        border: none;
        border-radius: 10px;
        font-size: 1rem;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        backdrop-filter: blur(10px);
    }

    .btn:hover {
        background: rgba(255, 255, 255, 0.15);
        transform: translateY(-3px);
        color: white;
        text-decoration: none;
    }

    .btn-logout {
        background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
    }

    .btn-logout:hover {
        background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
        box-shadow: 0 5px 15px rgba(238, 90, 36, 0.3);
    }

    footer {
        text-align: center;
        padding: 20px;
        margin-top: 50px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        opacity: 0.7;
    }

    @media (max-width: 768px) {
        header {
            flex-direction: column;
            gap: 20px;
            text-align: center;
        }
        
        .products-grid {
            grid-template-columns: 1fr;
        }
        
        .welcome-section h1 {
            font-size: 2rem;
        }
        
        .actions {
            flex-direction: column;
            align-items: center;
        }
        
        .dashboard-container {
            padding: 15px;
        }
    }
</style>
</head>
<body>
    <div class="dashboard-container">
        <header>
            <div class="logo">
                <i class="fas fa-laptop-code"></i>
                <span>ElectroStore</span>
            </div>
            
            <div class="user-info">
                <div class="avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div>
                    <%
                        CustomerBean cb = (CustomerBean)application.getAttribute("customerBean");
                        if (cb != null) {
                    %>
                    <div>Welcome, <%= cb.getCusfname() %></div>
                    <div style="font-size: 0.8rem; opacity: 0.7;">Customer Dashboard</div>
                    <%
                        } else {
                    %>
                    <div>Welcome, Customer</div>
                    <div style="font-size: 0.8rem; opacity: 0.7;">Customer Dashboard</div>
                    <%
                        }
                    %>
                </div>
            </div>
        </header>
        
        <section class="welcome-section">
            <%
                if (cb != null) {
            %>
            <h1>Hello <%= cb.getCusfname() %> <%= cb.getCuslname() %></h1>
            <%
                } else {
            %>
            <h1>Hello Valued Customer</h1>
            <%
                }
            %>
            <p>Discover our latest electronics collection</p>
        </section>
        
        <div class="products-grid">
            <%
                ArrayList<ProductBean> list = (ArrayList<ProductBean>)request.getAttribute("CustomerProductList");
                
                if (list == null || list.size() == 0) {
            %>
            <div class="no-products">
                <i class="fas fa-box-open"></i>
                <h2>No Products Available</h2>
                <p>We're currently updating our inventory. Please check back later.</p>
            </div>
            <%
                } else {
                    Iterator<ProductBean> itr = list.iterator();
                    int index = 0;
                    
                    while (itr.hasNext()) {
                        ProductBean pb = itr.next();
                        // Determine icon based on product type
                        String icon = "fas fa-microchip";
                        if (pb.getP_name() != null) {
                            String productName = pb.getP_name().toLowerCase();
                            if (productName.contains("phone") || productName.contains("mobile")) icon = "fas fa-mobile-alt";
                            else if (productName.contains("laptop")) icon = "fas fa-laptop";
                            else if (productName.contains("tablet")) icon = "fas fa-tablet-alt";
                            else if (productName.contains("camera")) icon = "fas fa-camera";
                            else if (productName.contains("headphone")) icon = "fas fa-headphones";
                        }
            %>
            <div class="product-card">
                <div class="product-header">
                    <div class="product-code">#<%= pb.getP_code() %></div>
                    <i class="<%= icon %> product-icon"></i>
                </div>
                
                <h3 class="product-name"><%= pb.getP_name() %></h3>
                
                <div class="product-company">
                    <i class="fas fa-building"></i>
                    <%= pb.getP_company() %>
                </div>
                
                <div class="product-details">
                    <div class="detail-item">
                        <div class="detail-label">Price</div>
                        <div class="detail-value price">$<%= pb.getP_price() %></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">In Stock</div>
                        <div class="detail-value stock"><%= pb.getP_qty() %></div>
                    </div>
                </div>
                
                <a href='buyproduct?pcode=<%= pb.getP_code() %>' class="btn-buy">
                    <i class="fas fa-shopping-cart"></i> Buy Now
                </a>
            </div>
            <%
                        index++;
                    }
                }
            %>
        </div>
        
        <div class="actions">
            <a href="CustomerHome.jsp" class="btn">
                <i class="fas fa-home"></i> Dashboard
            </a>
            <a href="logout" class="btn btn-logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
        
        <footer>
            <p>&copy; 2025 ElectroStore. All rights reserved. | Premium Electronics Marketplace</p>
        </footer>
    </div>

    <script>
        // Simple animation for product cards
        document.addEventListener('DOMContentLoaded', function() {
            const productCards = document.querySelectorAll('.product-card');
            
            productCards.forEach((card, index) => {
                // Initial state
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                
                // Animate in with delay
                setTimeout(() => {
                    card.style.transition = 'all 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 200);
            });
            
            // Add hover effects
            productCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-10px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>