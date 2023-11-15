<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reserverchambre.aspx.cs" Inherits="StayEsay.View.User.reserverchambre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<
<head>
    <title>Réservation de chambre d'hôtel</title>
    <style>
        body {
            background: linear-gradient(-145deg, rgba(219,138,222,1) 0%, rgba(246,191,159,1) 100%);
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        
        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .form-header h2 {
            color: #333;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #FF6B6B;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .form-group input[type="submit"]:hover {
            background-color: #FF4949;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h2>Réservation de chambre d'hôtel</h2>
        </div>
        <form>
            <div class="form-group">
                <label for="name">Nom</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="check-in">Date d'arrivée</label>
                <input type="date" id="check-in" name="check-in" required>
            </div>
            <div class="form-group">
                <label for="check-out">Date de départ</label>
                <input type="date" id="check-out" name="check-out" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Réserver">
            </div>
        </form>
    </div>
</body>


</html>
