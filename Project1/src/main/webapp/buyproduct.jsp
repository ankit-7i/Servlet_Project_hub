<%@page import="com.project.product_management.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Product - ElectroStore</title>
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
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .container {
        width: 100%;
        max-width: 800px;
        display: flex;
        flex-wrap: wrap;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        border-radius: 20px;
        overflow: hidden;
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .product-image-section {
        flex: 1;
        min-width: 300px;
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .product-image-section::before {
        content: '';
        position: absolute;
        width: 200px;
        height: 200px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        top: -50px;
        left: -50px;
    }

    .product-image-section::after {
        content: '';
        position: absolute;
        width: 150px;
        height: 150px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        bottom: -50px;
        right: -50px;
    }

    .product-icon {
        font-size: 5rem;
        margin-bottom: 20px;
        color: white;
        z-index: 1;
    }

    .product-tag {
        background: rgba(255, 255, 255, 0.2);
        padding: 8px 20px;
        border-radius: 20px;
        font-size: 0.9rem;
        margin-top: 15px;
        z-index: 1;
    }

    .buy-section {
        flex: 1;
        min-width: 300px;
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        background: rgba(255, 255, 255, 0.05);
    }

    .buy-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .buy-header h1 {
        color: white;
        font-size: 2rem;
        margin-bottom: 10px;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
    }

    .buy-header p {
        color: rgba(255, 255, 255, 0.7);
        font-size: 1rem;
    }

    .form-group {
        margin-bottom: 20px;
        position: relative;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        color: rgba(255, 255, 255, 0.8);
        font-weight: 500;
        font-size: 0.9rem;
    }

    .input-with-icon {
        position: relative;
    }

    .input-with-icon i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #00c6ff;
    }

    .form-control {
        width: 100%;
        padding: 14px 15px 14px 45px;
        border: 2px solid rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: rgba(255, 255, 255, 0.05);
        color: white;
    }

    .form-control:focus {
        border-color: #00c6ff;
        box-shadow: 0 0 0 3px rgba(0, 198, 255, 0.1);
        outline: none;
        background: rgba(255, 255, 255, 0.08);
    }

    .form-control:read-only {
        background: rgba(255, 255, 255, 0.03);
        color: rgba(255, 255, 255, 0.6);
        cursor: not-allowed;
    }

    .btn-buy {
        background: linear-gradient(135deg, #00c6ff 0%, #0072ff 100%);
        color: white;
        border: none;
        padding: 16px;
        border-radius: 10px;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        width: 100%;
        margin-top: 10px;
        box-shadow: 0 5px 15px rgba(0, 114, 255, 0.3);
    }

    .btn-buy:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0, 114, 255, 0.4);
        background: linear-gradient(135deg, #00ff88 0%, #00c851 100%);
    }

    .back-link {
        text-align: center;
        margin-top: 25px;
    }

    .back-link a {
        color: #00c6ff;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }

    .back-link a:hover {
        color: #0072ff;
        text-decoration: underline;
    }

    .floating-shapes {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        overflow: hidden;
        z-index: 0;
    }

    .shape {
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.05);
    }

    .circuit-line {
        position: absolute;
        background: rgba(255, 255, 255, 0.05);
    }

    .price-tag {
        background: rgba(255, 255, 255, 0.2);
        padding: 10px 20px;
        border-radius: 10px;
        font-size: 1.5rem;
        font-weight: bold;
        margin-top: 10px;
        z-index: 1;
    }

    .buy-now-section {
        text-align: center;
        margin-top: 20px;
        padding: 20px;
        background: rgba(0, 198, 255, 0.1);
        border-radius: 15px;
        border: 2px solid rgba(0, 198, 255, 0.3);
    }

    .buy-now-title {
        font-size: 1.2rem;
        margin-bottom: 15px;
        color: #00c6ff;
        font-weight: 600;
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }
        
        .product-image-section, .buy-section {
            width: 100%;
        }
        
        .product-image-section {
            padding: 30px 20px;
        }
        
        .buy-section {
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="product-image-section">
            <div class="floating-shapes" id="floatingShapes"></div>
            <%
                ProductBean pb = (ProductBean)request.getAttribute("ProductInfo");
                String icon = "fas fa-microchip";
                if (pb != null && pb.getP_name() != null) {
                    String productName = pb.getP_name().toLowerCase();
                    if (productName.contains("phone") || productName.contains("mobile")) icon = "fas fa-mobile-alt";
                    else if (productName.contains("laptop")) icon = "fas fa-laptop";
                    else if (productName.contains("tablet")) icon = "fas fa-tablet-alt";
                    else if (productName.contains("camera")) icon = "fas fa-camera";
                    else if (productName.contains("headphone")) icon = "fas fa-headphones";
                }
            %>
            <i class="<%= icon %> product-icon"></i>
            <div class="product-tag">Premium Electronics</div>
            <div class="price-tag">
                <%
                    if (pb != null) {
                %>
                $<%=pb.getP_price()%>
                <%
                    }
                %>
            </div>
        </div>
        
        <div class="buy-section">
            <div class="buy-header">
                <h1>Buy Now</h1>
                <p>Complete your purchase in seconds</p>
            </div>
            
            <form action="updateproduct" method="post" id="buyForm">
                <div class="form-group">
                    <label for="pcode">Product Code</label>
                    <div class="input-with-icon">
                        <i class="fas fa-barcode"></i>
                        <input type="text" id="pcode" name="pcode" class="form-control" 
                               value="<%=pb != null ? pb.getP_code() : ""%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="pname">Product Name</label>
                    <div class="input-with-icon">
                        <i class="fas fa-cube"></i>
                        <input type="text" id="pname" name="pname" class="form-control" 
                               value="<%=pb != null ? pb.getP_name() : ""%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="pcompany">Brand</label>
                    <div class="input-with-icon">
                        <i class="fas fa-building"></i>
                        <input type="text" id="pcompany" name="pcompany" class="form-control" 
                               value="<%=pb != null ? pb.getP_company() : ""%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="price">Price</label>
                    <div class="input-with-icon">
                        <i class="fas fa-tag"></i>
                        <input type="text" id="price" name="price" class="form-control" 
                               value="<%=pb != null ? pb.getP_price() : ""%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="qty">Available Stock</label>
                    <div class="input-with-icon">
                        <i class="fas fa-boxes"></i>
                        <input type="text" id="qty" name="qty" class="form-control" 
                               value="<%=pb != null ? pb.getP_qty() : ""%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="reqqty">Quantity You Want</label>
                    <div class="input-with-icon">
                        <i class="fas fa-shopping-cart"></i>
                        <input type="number" id="reqqty" name="reqqty" class="form-control" 
                               placeholder="Enter quantity" required min="1" max="<%=pb != null ? pb.getP_qty() : "1"%>">
                    </div>
                </div>
                
                <div class="buy-now-section">
                    <div class="buy-now-title">Ready to Purchase?</div>
                    <button type="submit" class="btn-buy">
                        <i class="fas fa-bolt"></i> BUY NOW
                    </button>
                </div>
            </form>
            
            <div class="back-link">
                <a href="viewcustomerproducts">
                    <i class="fas fa-arrow-left"></i> Back to Products
                </a>
            </div>
        </div>
    </div>

    <script>
        // GSAP Animations
        document.addEventListener('DOMContentLoaded', function() {
            // Create floating shapes for background
            const floatingShapes = document.getElementById('floatingShapes');
            
            // Add circuit board lines
            for (let i = 0; i < 5; i++) {
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
            for (let i = 0; i < 8; i++) {
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
            
            // Animate form elements on load
            const tl = gsap.timeline();
            tl.from('.product-image-section', {duration: 1, x: -100, opacity: 0, ease: "power3.out"})
              .from('.buy-section', {duration: 0.8, x: 100, opacity: 0, ease: "power3.out"}, "-=0.5")
              .from('.form-group', {duration: 0.5, y: 20, opacity: 0, stagger: 0.1, ease: "back.out(1.7)"}, "-=0.3")
              .from('.buy-now-section', {duration: 0.6, scale: 0.8, opacity: 0, ease: "back.out(1.7)"}, "-=0.2")
              .from('.back-link', {duration: 0.5, y: 20, opacity: 0}, "-=0.2");
            
            // Add hover animations to form inputs
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                if (!input.readOnly) {
                    input.addEventListener('focus', function() {
                        gsap.to(this, {duration: 0.3, scale: 1.02, ease: "back.out(1.7)"});
                        gsap.to(this.parentNode.querySelector('i'), {duration: 0.3, color: "#00c6ff", scale: 1.2});
                    });
                    
                    input.addEventListener('blur', function() {
                        gsap.to(this, {duration: 0.3, scale: 1, ease: "back.out(1.7)"});
                        gsap.to(this.parentNode.querySelector('i'), {duration: 0.3, color: "#00c6ff", scale: 1});
                    });
                }
            });
            
            // Add animation to buy button on hover
            const buyBtn = document.querySelector('.btn-buy');
            buyBtn.addEventListener('mouseenter', function() {
                gsap.to(this, {duration: 0.3, scale: 1.05, ease: "back.out(1.7)"});
            });
            
            buyBtn.addEventListener('mouseleave', function() {
                gsap.to(this, {duration: 0.3, scale: 1, ease: "back.out(1.7)"});
            });
            
            // Form submission animation
            const form = document.getElementById('buyForm');
            form.addEventListener('submit', function(e) {
                const reqQty = document.getElementById('reqqty').value;
                const availableQty = document.getElementById('qty').value;
                
                if (!reqQty || reqQty <= 0) {
                    e.preventDefault();
                    // Shake animation for empty field
                    gsap.to('#reqqty', {
                        duration: 0.1, 
                        x: 10, 
                        repeat: 5, 
                        yoyo: true, 
                        ease: "power1.inOut"
                    });
                    return;
                }
                
                if (parseInt(reqQty) > parseInt(availableQty)) {
                    e.preventDefault();
                    // Enhanced error animation
                    gsap.to('#reqqty', {
                        duration: 0.1, 
                        x: 10, 
                        repeat: 5, 
                        yoyo: true, 
                        ease: "power1.inOut",
                        backgroundColor: "rgba(255, 0, 0, 0.2)"
                    });
                    alert("Sorry! You can't order more than available stock!");
                    return;
                }
                
                // Success animation
                gsap.to('.btn-buy', {
                    duration: 0.5, 
                    backgroundColor: "#00c851", 
                    scale: 0.95, 
                    ease: "power2.inOut"
                });
            });
        });
    </script>
</body>
</html>