<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="reservationtable.aspx.cs" Inherits="StayEsay.View.User.reservationtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />

     <style>
        .container1 {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .reservation-form {
            width: 50%;
            border: 1px solid #ccc;
border-radius: 10px;
padding: 20px;

        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="time"],
        input[type="number"],
        input[type="tel"] {
            border: none;
            background-color: #f2f2f2;
            border-radius: 50px;
            padding: 10px 15px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #0097ff;
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0069d9;
        }

        .image-container {
            width: 40%;
            margin-left: 20px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
        }
        .h2{text-align: center;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
      <br /><br /><br /><br />
    <div class="container1">
        <div class="reservation-form">
            <div style="text-align: center;
                 color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">
                    <h2>Réservation de table</h2>
                </div>
            <br /><br />
            <form>
                <label for="name">Nom :</label>
                <input type="text" id="name" name="name" required>
              
                <label for="email">Email :</label>
                <input type="email" id="email" name="email" required>
                   <br />
                <label for="date">Date :</label>
                <input type="date" id="date" name="date" required>
                  
                <label for="time">Heure :</label>
                <input type="time" id="time" name="time" required>
                <br />
                <label for="guests">Nombre  :</label>
                <input type="number" id="guests" name="guests" required>


                 <label for="tel ">Télphone :</label>
                <input type="text" id="tel" name="guests" required>
                  <br /> <br />
                <div style="display: flex; justify-content: center;">
                    <input type="submit" value="Réserver">
                </div>
            </form>
        </div>

        <div class="image-container">
            <img src="../../Asset/images/restaurant/Hotel-2978-20230102-094217.jpg"  alt="Image du restaurant">
        </div>
    </div>
    <br /><br /><br /><br />
</asp:Content>
