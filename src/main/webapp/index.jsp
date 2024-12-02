<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            font-size: 36px;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            transition: background-color 0.3s;
        }
        .btn-login {
            background-color: #4CAF50;
            color: white;
        }
        .btn-login:hover {
            background-color: #45a049;
        }
        .btn-signup {
            background-color: #008CBA;
            color: white;
        }
        .btn-signup:hover {
            background-color: #007bb5;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome</h1>
        <a href="login.jsp" class="btn btn-login">Login</a>
        <a href="signup.jsp" class="btn btn-signup">Signup</a>
    </div>

</body>
</html>
