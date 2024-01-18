<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
            margin: 100px;
        }

        .error-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #d9534f;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1> 웁스! 오류가 발생했습니다.</h1>
        <p><strong>Error Message:</strong> ${error}</p>
        <p> Please try again later. </p>
    </div>
</body>
</html>