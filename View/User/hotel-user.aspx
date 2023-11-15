<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="hotel-user.aspx.cs" Inherits="StayEsay.View.User.hotel_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Booking Form HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet"/>

	<!-- Bootstrap -->


	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="../../Asset/css/hotel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
     <body>
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            <div class="form-header">
                                <h2>Réservez votre chambre</h2>
                            </div>
                            <br />
                            <br />
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span class="form-label">Début du séjour</span>
                                            <input class="form-control" type="date" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span class="form-label">Fin du séjour</span>
                                            <input class="form-control" type="date" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <span class="form-label">Chambres</span>
                                            <select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </select>
                                            <span class="select-arrow"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <span class="form-label">Adults</span>
                                            <select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </select>
                                            <span class="select-arrow"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <span class="form-label">Enfants</span>
                                            <select class="form-control">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                            </select>
                                            <span class="select-arrow"></span>
                                        </div>
                                    </div>
                                </div>
                               <div class="form-btn" style="display: flex; justify-content: center;">
    <button class="submit-btn" style="width: 500px;">Vérifier la disponibilité</button>
                                   <br /><br /><br />
</div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</asp:Content>
