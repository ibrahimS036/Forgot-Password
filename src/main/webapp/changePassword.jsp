<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
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
            max-width: 400px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-update {
            background-color: #007bff;
            color: #fff;
            border: none;
        }

        .btn-update:hover {
            background-color: #0056b3;
        }

        .back-to-login {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 0.9rem;
        }

        .back-to-login a {
            text-decoration: none;
            color: #007bff;
        }

        .back-to-login a:hover {
            color: #0056b3;
        }

        .message {
            text-align: center;
            margin-bottom: 20px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Change Your Password</h2>

        <!-- Display success or error message -->
        <div class="message">
            <% 
                String successMessage = (String) request.getAttribute("successMessage");
                String errorMessage = (String) request.getAttribute("errorMessage");
            %>
            <% if (successMessage != null) { %>
                <p class="success"><%= successMessage %></p>
            <% } %>
            <% if (errorMessage != null) { %>
                <p class="error"><%= errorMessage %></p>
            <% } %>
        </div>

        <form action="updatePassword" method="post">
            <div class="form-group">
                <label for="new-password">Enter User Name:</label>
                <input type="text" class="form-control" id="new-password" name="UserName" required>
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm New Password:</label>
                <input type="password" class="form-control" id="confirm-password" name="confirmPassword" required>
            </div>

            <button type="submit" class="btn btn-update btn-block">Update Password</button>
        </form>

        <!-- Back to Login Link -->
        <div class="back-to-login">
            <a href="login.jsp">Back to Login</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
