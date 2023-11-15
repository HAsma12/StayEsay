<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="historique.aspx.cs" Inherits="StayEsay.View.User.historique" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


    <style>
        .center-grid {
            margin-left: auto;
            margin-right: auto;
        }

        .large-grid {
            width: 80%;
        }


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

        .h2 {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <br /><br /><br /><br /> <br /><br /><br /> <br /><br /><br />
     <h5 class="text-center" style="color: #f6bf9f;  text-align: center; font-family: 'Medula One', cursive;">HISTORIQUE DE VOS RESERVATIONS</h5>
    <br />
    
<asp:GridView ID="GridView1"  CssClass="large-grid  center-grid" runat="server"   AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="historique_SelectedIndexChanged">
    <Columns>

<asp:BoundField DataField="IdReservation" HeaderText="IdReservation" />
   <asp:BoundField DataField="Emplacement" HeaderText="Emplacement" />
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:BoundField DataField="Temps" HeaderText="Temps" />
         
        <asp:BoundField DataField="nbrp" HeaderText=" nombre de personne" />
        <asp:BoundField DataField="telephone" HeaderText=" telephone" />


    </Columns>
</asp:GridView>
     
 <br /><br /><br /> <br /><br /><br />
  
   <div class="container1">
        <div class="reservation-form">
            <div style="text-align: center;
                 color: #f6bf9f; text-align: center; font-family: 'Medula One', cursive;">
                    <h2>Modifier réservation</h2>
                </div>
            <br /><br />
           <form>
               
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
                <input type="text" id="txttel" name="guests" required runat="server">
                  <br /> <br />

                    <label runat="server" id="ErrMsg" class="text-danger"></label>
                <div style="display: flex; justify-content: center;">
                 <asp:Button ID="btnModifier" runat="server" Text="Modifier" CssClass="styled-button"  OnClick="btnModifier_Click" />
                         <asp:Button ID="btnDelete" runat="server" Text="Modifier" CssClass="styled-button"  OnClick="btnDelete_Click" />

                </div>
            </form>
        </div>
       </div>
   
</asp:Content>
