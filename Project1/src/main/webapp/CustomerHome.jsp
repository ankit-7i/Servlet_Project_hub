<%@page import="com.project.customer_module.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Dashboard - ElectroStore</title>
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
    }

    .dashboard-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 0;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        margin-bottom: 40px;
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
        margin-bottom: 50px;
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
        background-clip: text;
        color: transparent;
    }

    .welcome-section p {
        font-size: 1.2rem;
        opacity: 0.8;
        margin-bottom: 20px;
    }

    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        margin-bottom: 40px;
    }

    .dashboard-card {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        padding: 30px;
        text-align: center;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
        transition: all 0.3s ease;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        position: relative;
        overflow: hidden;
    }

    .dashboard-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: linear-gradient(to right, #00c6ff, #0072ff);
    }

    .dashboard-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        border-color: rgba(0, 198, 255, 0.3);
    }

    .card-icon {
        font-size: 3.5rem;
        margin-bottom: 20px;
        color: #00c6ff;
    }

    .dashboard-card h2 {
        font-size: 1.5rem;
        margin-bottom: 15px;
    }

    .dashboard-card p {
        opacity: 0.8;
        margin-bottom: 20px;
        line-height: 1.5;
    }

    .btn {
        display: inline-block;
        padding: 12px 30px;
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        color: white;
        border: none;
        border-radius: 50px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        box-shadow: 0 5px 15px rgba(0, 114, 255, 0.3);
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0, 114, 255, 0.4);
    }

    .btn-logout {
        background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
        box-shadow: 0 5px 15px rgba(238, 90, 36, 0.3);
    }

    .btn-logout:hover {
        box-shadow: 0 8px 20px rgba(238, 90, 36, 0.4);
    }

    .quick-actions {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 30px;
        flex-wrap: wrap;
    }

    .floating-shapes {
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        overflow: hidden;
        z-index: -1;
    }

    .shape {
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.03);
    }

    .circuit-line {
        position: absolute;
        background: rgba(255, 255, 255, 0.03);
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
        
        .dashboard-grid {
            grid-template-columns: 1fr;
        }
        
        .welcome-section h1 {
            font-size: 2rem;
        }
        
        .quick-actions {
            flex-direction: column;
            align-items: center;
        }
    }
</style>
</head>
<body>
    <div class="floating-shapes" id="floatingShapes"></div>
    
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
                        CustomerBean cb = (CustomerBean) application.getAttribute("customerBean"); 
                    %>
                    <div>Welcome, <%= (cb != null) ? cb.getCusfname() : "Customer" %></div>
                    <div style="font-size: 0.8rem; opacity: 0.7;">Customer Dashboard</div>
                </div>
            </div>
        </header>
        
        <section class="welcome-section">
            <h1>Welcome to Your Dashboard</h1>
            <p>Hello <strong><%= (cb != null) ? cb.getCusfname() + " " + cb.getCuslname() : "Valued Customer" %></strong>, we're glad to have you back!</p>
            <p>Discover the latest electronics and exclusive deals just for you.</p>
        </section>
        
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <i class="fas fa-box-open card-icon"></i>
                <h2>Browse Products</h2>
                <p>Explore our wide range of electronics, gadgets, and accessories with the latest technology.</p>
                <a href="viewcustomerproducts" class="btn">View Products</a>
            </div>
            
            <div class="dashboard-card">
                <i class="fas fa-shopping-bag card-icon"></i>
                <h2>Your Orders</h2>
                <p>Track your orders, view order history, and manage your purchases in one place.</p>
                <a href="#" class="btn">View Orders</a>
            </div>
            
            <div class="dashboard-card">
                <i class="fas fa-user-cog card-icon"></i>
                <h2>Account Settings</h2>
                <p>Update your personal information, change password, and manage your account preferences.</p>
                <a href="#" class="btn">Manage Account</a>
            </div>
        </div>
        
        <div class="quick-actions">
            <a href="viewcustomerproducts" class="btn" style="padding: 15px 40px;">
                <i class="fas fa-box-open"></i> Browse All Products
            </a>
            <a href="logout" class="btn btn-logout" style="padding: 15px 40px;">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
        
        <footer>
            <p>&copy; 2025 ElectroStore. All rights reserved. | Premium Electronics Marketplace</p>
        </footer>
    </div>

    <script>
        // GSAP Animations
        document.addEventListener('DOMContentLoaded', function() {
            // Create floating shapes for background
            const floatingShapes = document.getElementById('floatingShapes');
            
            // Add circuit board lines
            for (let i = 0; i < 6; i++) {
                const line = document.createElement('div');
                line.classList.add('circuit-line');
                line.style.width = `${Math.random() * 200 + 50}px`;
                line.style.height = '2px';
                line.style.left = `${Math.random() * 100}%`;
                line.style.top = `${Math.random() * 100}%`;
                line.style.transform = `rotate(${Math.random() * 360}deg)`;
                floatingShapes.appendChild(line);
                
                // Animate lines
                gsap.to(line, {
                    rotation: 360,
                    duration: Math.random() * 20 + 10,
                    repeat: -1,
                    ease: "none"
                });
            }
            
            // Add tech shapes
            for (let i = 0; i < 10; i++) {
                const shape = document.createElement('div');
                shape.classList.add('shape');
                shape.style.width = `${Math.random() * 80 + 20}px`;
                shape.style.height = shape.style.width;
                shape.style.left = `${Math.random() * 100}%`;
                shape.style.top = `${Math.random() * 100}%`;
                
                // Make some shapes rectangular (like chips)
                if (i % 3 === 0) {
                    shape.style.borderRadius = '5px';
                    shape.style.width = `${Math.random() * 40 + 20}px`;
                    shape.style.height = `${Math.random() * 30 + 15}px`;
                }
                
                floatingShapes.appendChild(shape);
                
                // Animate shapes
                gsap.to(shape, {
                    x: Math.random() * 100 - 50,
                    y: Math.random() * 100 - 50,
                    duration: Math.random() * 15 + 10,
                    repeat: -1,
                    yoyo: true,
                    ease: "sine.inOut"
                });
            }
            
            // Animate page elements on load
            const tl = gsap.timeline();
            tl.from('header', {duration: 1, y: -50, opacity: 0, ease: "power3.out"})
              .from('.welcome-section', {duration: 0.8, y: 30, opacity: 0, ease: "power3.out"}, "-=0.5")
              .from('.dashboard-card', {duration: 0.6, y: 30, opacity: 0, stagger: 0.2, ease: "back.out(1.7)"}, "-=0.3")
              .from('.quick-actions', {duration: 0.5, y: 20, opacity: 0, ease: "power3.out"}, "-=0.2");
            
            // Add hover animations to dashboard cards
            const dashboardCards = document.querySelectorAll('.dashboard-card');
            dashboardCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    gsap.to(this, {duration: 0.3, scale: 1.03, ease: "back.out(1.7)"});
                });
                
                card.addEventListener('mouseleave', function() {
                    gsap.to(this, {duration: 0.3, scale: 1, ease: "back.out(1.7)"});
                });
            });
            
            // Add animation to buttons on hover
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    gsap.to(this, {duration: 0.3, scale: 1.05, ease: "back.out(1.7)"});
                });
                
                button.addEventListener('mouseleave', function() {
                    gsap.to(this, {duration: 0.3, scale: 1, ease: "back.out(1.7)"});
                });
            });
        });
    </script>
</body>
</html>