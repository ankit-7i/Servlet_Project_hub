<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out - ElectroStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --info: #17a2b8;
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
        
        .logout-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
        }
        
        .logout-header {
            background: linear-gradient(to right, var(--info), #138496);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .logo {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .tagline {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .logout-body {
            padding: 40px;
        }
        
        .logout-icon {
            font-size: 5rem;
            color: var(--info);
            margin-bottom: 20px;
        }
        
        .confirmation-message {
            background: var(--light);
            border-radius: 15px;
            padding: 25px;
            margin: 30px 0;
            border-left: 5px solid var(--info);
            text-align: center;
        }
        
        .message-text {
            font-size: 1.5rem;
            margin-bottom: 0;
            font-weight: 600;
        }
        
        .security-message {
            background: #d1ecf1;
            border: 1px solid #bee5eb;
            border-radius: 10px;
            padding: 15px;
            margin-top: 20px;
            text-align: center;
        }
        
        .security-message i {
            color: var(--info);
            margin-right: 8px;
        }
        
        .redirect-notice {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 10px;
            padding: 15px;
            margin-top: 20px;
            text-align: center;
        }
        
        .redirect-notice i {
            color: #e67e22;
            margin-right: 8px;
        }
        
        .countdown {
            font-weight: 700;
            color: var(--info);
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
        
        .admin-login {
            color: var(--primary);
        }
        
        .customer-login {
            color: var(--secondary);
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
        
        .session-details {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-top: 30px;
            border-left: 4px solid var(--info);
        }
        
        .details-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary);
        }
        
        .details-item {
            display: flex;
            margin-bottom: 10px;
        }
        
        .details-label {
            font-weight: 600;
            width: 150px;
            color: var(--dark);
        }
        
        .details-value {
            color: #6c757d;
        }
        
        @media (max-width: 768px) {
            .logout-body {
                padding: 30px 20px;
            }
            
            .logout-header {
                padding: 25px 20px;
            }
            
            .action-buttons {
                grid-template-columns: 1fr;
            }
            
            .logout-icon {
                font-size: 4rem;
            }
            
            .details-item {
                flex-direction: column;
            }
            
            .details-label {
                width: 100%;
                margin-bottom: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <div class="logout-header">
            <div class="logo">
                <i class="fas fa-laptop-code me-2"></i>ElectroStore
            </div>
            <div class="tagline">Premium Electronics & Gadgets Marketplace</div>
        </div>
        
        <div class="logout-body">
            <div class="text-center">
                <div class="logout-icon">
                    <i class="fas fa-sign-out-alt"></i>
                </div>
                <h2 class="mb-4">You've Been Logged Out</h2>
            </div>
            
            <div class="confirmation-message">
                <p class="message-text">User logged out successfully!</p>
            </div>
            
            <div class="security-message">
                <p class="mb-0">
                    <i class="fas fa-shield-alt"></i>
                    <strong>Security Notice:</strong> Your session has been securely terminated. For your safety, please close the browser if you're on a shared device.
                </p>
            </div>
            
            <div class="redirect-notice">
                <p class="mb-0">
                    <i class="fas fa-clock"></i>
                    You will be redirected to the home page in <span class="countdown" id="countdown">10</span> seconds.
                </p>
            </div>
            
            <div class="session-details">
                <div class="details-title">Session Details</div>
                <div class="details-item">
                    <div class="details-label">Status:</div>
                    <div class="details-value">Successfully Logged Out</div>
                </div>
                <div class="details-item">
                    <div class="details-label">Timestamp:</div>
                    <div class="details-value" id="timestamp">
                        <!-- JavaScript will populate this -->
                    </div>
                </div>
                <div class="details-item">
                    <div class="details-label">Security:</div>
                    <div class="details-value">All session data cleared</div>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="AdminLogin.html" class="action-card">
                    <div class="action-icon admin-login">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <div class="action-title">Admin Login</div>
                    <div class="action-description">Access the admin dashboard</div>
                </a>
                
                <a href="CustomerLogin.html" class="action-card">
                    <div class="action-icon customer-login">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="action-title">Customer Login</div>
                    <div class="action-description">Browse and purchase products</div>
                </a>
            </div>
            
            <!-- This maintains the original include but with enhanced styling -->
            <div class="text-center mt-4">
                <div class="included-content" style="display: none;">
                    <%@ include file="index.html" %>
                </div>
                <a href="index.html" class="btn btn-primary btn-lg">
                    <i class="fas fa-home me-2"></i>Return to Homepage
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add current timestamp
        const now = new Date();
        const timestampElement = document.getElementById('timestamp');
        timestampElement.textContent = now.toLocaleString();
        
        // Countdown timer for redirect
        let countdown = 10;
        const countdownElement = document.getElementById('countdown');
        
        const countdownInterval = setInterval(() => {
            countdown--;
            countdownElement.textContent = countdown;
            
            if (countdown <= 0) {
                clearInterval(countdownInterval);
                window.location.href = 'index.html';
            }
        }, 1000);
        
        // Add subtle animation to logout icon
        const logoutIcon = document.querySelector('.logout-icon');
        logoutIcon.style.transform = 'scale(0.8)';
        setTimeout(() => {
            logoutIcon.style.transition = 'transform 0.5s ease';
            logoutIcon.style.transform = 'scale(1)';
        }, 100);
    </script>
</body>
</html>