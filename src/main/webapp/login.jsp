<!DOCTYPE html>
<html lang="en">
<head>
<style>
        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login Form</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    
    
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px; /* Adjusting container width */
        width: 100%;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .btn-login {
        background-color: #007bff;
        color: #fff;
        border: none;
    }
    
    .btn-login:hover {
        background-color: #0056b3;
    }

    .forgot-password {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-size: 0.9rem;
    }

    .forgot-password a {
        text-decoration: none;
        color: #007bff;
    }

    .forgot-password a:hover {
        color: #0056b3;
    }
</style>
</head>
<body>

<div class="container">
    <h2 class="text-center">User Login</h2>
    
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <p class="error-message"><%= errorMessage %></p>
    <%
        }
    %>
    
    
    <form action="executeAgain" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="userpassword" required>
        </div>
        
        <button type="submit" class="btn btn-login btn-block">Login</button>
    </form>

    <!-- Forgot Password Link -->
    <div class="forgot-password">
        <a href="changePassword.jsp">Forgot Password?</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
