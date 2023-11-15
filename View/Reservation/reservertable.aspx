<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="reservertable.aspx.cs" Inherits="StayEsay.View.Reservation.reservertable" EnableEventValidation="false" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
            background-color: #ecabb5;
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
                <input type="text" id="txtnom" name="name" required runat="server">
              
                <label for="email">Email :</label>
                <input type="Email" id="txtemail" name="email" required runat="server">
                   <br />
                <div class="col-2">
                            <label for="free">Emplacement </label>
                            <div class="form-check" id="ddlEmplacement">
                                <input class="form-check-input" type="radio" name="emplacement" id="Radio3" groupname="free" value="yes" runat="server" />
                                <label class="form-check-label">Zone intérieure</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="emplacement" id="Radio4" groupname="free" value="no" runat="server" />
                                <label class="form-check-label">Terrasse</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="emplacement" id="Radio5" groupname="free" value="no" runat="server" />
                                <label class="form-check-label" for="free-no">Balcon</label>
                            </div>
                        </div>

                <label for="date">Date :</label>
                <input type="date" id="txtdate" name="date" required runat="server">
                  
                <label for="time">Heure :</label>
                <input type="time" id="txttime" name="time" required runat="server">
                <br />
                <label for="guests">Nombre  :</label>
                <input type="number" id="txtnbrp" name="guests" required runat="server">


                 <label for="tel ">Télphone :</label>
                <input type="text" id="txttel" name="guests"  runat="server"     pattern="^[2,3,5,7,9]\d{7}$" required>
                  <br /> <br />

                    <label runat="server" id="ErrMsg" class="text-danger"></label>
                <div style="display: flex; justify-content: center;">
                 <asp:Button ID="btnReserver" runat="server" Text="Réserver maintenant" CssClass="styled-button" OnClick="btnReserver_Click" />

                </div>
            </form>
        </div>

        <div class="image-container">
            <img src="../../Asset/images/restaurant/Eating together-amico.svg"  alt="Image du restaurant">
        </div>
    </div>
    <br /><br /><br /><br />
</asp:Content>
