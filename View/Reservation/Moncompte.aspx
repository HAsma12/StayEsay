﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="Moncompte.aspx.cs" Inherits="StayEsay.View.Reservation.Moncompte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        body{margin-top:20px;}

.card-big-shadow {
    max-width: 320px;
    position: relative;
}

.coloured-cards .card {
    margin-top: 30px;
}

.card[data-radius="none"] {
    border-radius: 0px;
}
.card {
    border-radius: 8px;
    box-shadow: 0 2px 2px rgba(204, 197, 185, 0.5);
    background-color: #FFFFFF;
    color: #252422;
    margin-bottom: 20px;
    position: relative;
    z-index: 1;
}


.card[data-background="image"] .title, .card[data-background="image"] .stats, .card[data-background="image"] .category, .card[data-background="image"] .description, .card[data-background="image"] .content, .card[data-background="image"] .card-footer, .card[data-background="image"] small, .card[data-background="image"] .content a, .card[data-background="color"] .title, .card[data-background="color"] .stats, .card[data-background="color"] .category, .card[data-background="color"] .description, .card[data-background="color"] .content, .card[data-background="color"] .card-footer, .card[data-background="color"] small, .card[data-background="color"] .content a {
    color: #FFFFFF;
}
.card.card-just-text .content {
    padding: 50px 65px;
    text-align: center;
}
.card .content {
    padding: 20px 20px 10px 20px;
}
.card[data-color="blue"] .category {
    color: #7a9e9f;
}

.card .category, .card .label {
    font-size: 14px;
    margin-bottom: 0px;
}
.card-big-shadow:before {
    background-image: url("http://static.tumblr.com/i21wc39/coTmrkw40/shadow.png");
    background-position: center bottom;
    background-repeat: no-repeat;
    background-size: 100% 100%;
    bottom: -12%;
    content: "";
    display: block;
    left: -12%;
    position: absolute;
    right: 0;
    top: 0;
    z-index: 0;
}
h4, .h4 {
    font-size: 1.5em;
    font-weight: 600;
    line-height: 1.2em;
}
h6, .h6 {
    font-size: 0.9em;
    font-weight: 600;
    text-transform: uppercase;
}
.card .description {
    font-size: 16px;
    color: #66615b;
}
.content-card{
    margin-top:30px;    
}
a:hover, a:focus {
    text-decoration: none;
}

/*======== COLORS ===========*/
.card[data-color="blue"] {
    background: #b8d8d8;
}
.card[data-color="blue"] .description {
    color: #506568;
}

.card[data-color="green"] {
    background: #d5e5a3;
}
.card[data-color="green"] .description {
    color: #60773d;
}
.card[data-color="green"] .category {
    color: #92ac56;
}

.card[data-color="yellow"] {
    background: #ffe28c;
}
.card[data-color="yellow"] .description {
    color: #b25825;
}
.card[data-color="yellow"] .category {
    color: #d88715;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <br /><br /><br /><br /><br /><br />
     <div class="row d-flex justify-content-center">
        
        <div class="col-md-4 col-sm-8 content-card">
            <div class="card-big-shadow">
                <div class="card card-just-text" data-background="color" data-color="green" data-radius="none">
                    <div class="content">
                       <%-- <h6 class="category">Best cards</h6>
                        <h4 class="title"><a href="#">Green Card</a></h4>--%>
                        <img  src="../../Asset/images/icons/utilisateur.png" style="width:40px" />
                        <br />  <br /> 
                        <a class="description" href="informations.aspx">Informations</a>
                    </div>
                </div> <!-- end card -->
            </div>
        </div>
        
        <div class="col-md-4 col-sm-6 content-card">
            <div class="card-big-shadow">
                <div class="card card-just-text" data-background="color" data-color="yellow" data-radius="none">
                    <div class="content">
                  
              <img  src="../../Asset/images/icons/historique.png" style="width:40px" />
                        <br />
                       <a class="description" href="historique.aspx">Historique de Mes Réservations</a>
       

                    </div>
                </div> <!-- end card -->
            </div>
        </div>
        
       
      
      
    </div>
  <br /><br /><br />

</asp:Content>
