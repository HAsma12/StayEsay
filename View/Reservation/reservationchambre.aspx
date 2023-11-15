<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="reservationchambre.aspx.cs" Inherits="StayEsay.View.Reservation.reservationchambre" EnableEventValidation="false" %>
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
            background-color: #ecabb5;
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
    
         <br /><br /><br /><br /><br />
 <div class="container1">
    <div class="reservation-form">
        <div style="text-align: center; color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">
            <h2>Réservation de chambre</h2>
        </div>
        <br /><br />
        <form>
            <label for="dateDebut">Date de début :</label>
            <input type="date" id="txtDateDebut" name="dateDebut" required runat="server">

            <label for="dateFin">Date de fin :</label>
            <input type="date" id="txtDateFin" name="dateFin" required runat="server">
            <br /><br />

          <asp:DropDownList ID="ddlTypeChambre" runat="server">

    <asp:ListItem Text="Single" Value="single"></asp:ListItem>
    <asp:ListItem Text="Double" Value="double"></asp:ListItem>
    <asp:ListItem Text="Familiale" Value="familiale"></asp:ListItem>
</asp:DropDownList>


        
            <br /><br /><br />
            <div style="display: flex; justify-content: center;">
                <asp:Button ID="btnReserver" runat="server" Text="Réserver maintenant" CssClass="styled-button" OnClick="btnReserver_Click" />
            </div>
        </form>
    </div>

    <div class="image-container">
        <img src="../../Asset/images/restaurant/Hotel Booking-amico.svg" alt="Image de la chambre d'hôtel">
    </div>
</div>

    <br /><br /><br /><br />
</asp:Content>
