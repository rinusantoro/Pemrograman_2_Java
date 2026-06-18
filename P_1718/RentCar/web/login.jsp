<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Rent Car</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .login-container{
            width:100%;
            max-width:350px;
            background:white;
            padding:30px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }

        .login-container h2{
            text-align:center;
            margin-bottom:25px;
            color:#333;
        }

        .input-group{
            margin-bottom:15px;
        }

        .input-group input{
            width:100%;
            padding:12px;
            border-radius:8px;
            border:1px solid #ccc;
            font-size:14px;
            transition:0.3s;
        }

        .input-group input:focus{
            border-color:#4facfe;
            outline:none;
            box-shadow:0 0 5px rgba(79,172,254,0.5);
        }

        button{
            width:100%;
            padding:12px;
            border:none;
            border-radius:8px;
            background:linear-gradient(135deg,#007bff,#0056b3);
            color:white;
            font-size:16px;
            cursor:pointer;
            transition:0.3s;
        }

        button:hover{
            transform:scale(1.05);
            background:linear-gradient(135deg,#0056b3,#003f7f);
        }

        .footer{
            margin-top:15px;
            text-align:center;
            font-size:12px;
            color:#777;
        }

        /* RESPONSIVE */
        @media (max-width:480px){
            .login-container{
                margin:15px;
                padding:20px;
            }
        }
    </style>
</head>

<body>

<div class="login-container">

    <h2>Login Rent Car</h2>

    <form action="proses_login.jsp" method="post">

        <div class="input-group">
            <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="input-group">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit">Login</button>

    </form>

    <div class="footer">
        © 2026 Rent Car System
    </div>

</div>

</body>
</html>