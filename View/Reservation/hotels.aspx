<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="hotels.aspx.cs" Inherits="StayEsay.View.Reservation.hotels" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Asset/css/templatemo.css" />
    <link rel="stylesheet" href="../../Asset/css/bootstrap.min.css" />


    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap" />
    <link rel="stylesheet" href="assets/css/fontawesome.min.css" />
    <style>
        .hotel-img {
            width: 600%;
            height: 500px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
            text-align: center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <br />
    <br />
    <!-- Start Content -->
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-12">

                <div class="row">

                    <% 
      string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

      // Récupération des données de la table "hotel"
      string sql = "SELECT Idhotel , nom, categorie,image_hotel FROM hotel WHERE statu='Accepter' ";
      using (SqlCommand command = new SqlCommand(sql, StayEsay.Global.connection))
      {

          using (SqlDataReader reader = command.ExecuteReader())
          {
              while (reader.Read())
              {
                  int Idhotel = reader.GetInt32(0);
                  string nom = reader.GetString(1);
                  string categorie = reader.GetString(1);
                  byte[] imageBytes = (byte[])reader["image_hotel"];
                  string imageBase64 = Convert.ToBase64String(imageBytes);
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">

                                <img class="card-img rounded-0 img-fluid hotel-img" src="data:image/png;base64,<%= imageBase64  %>" />

                            </div>
                            <div class="card-body">
                                <p class="h3 text-decoration-none"><%= nom %></p>
                                <ul class="list-unstyled">
                                    <li><a class="btn btn-secondary btn-sm" href="detailshotels.aspx?Idhotel=<%= reader.GetInt32(0).ToString() %>" style="background-color: #ecabb5">Details</a></li>

                                </ul>

                            </div>
                        </div>
                    </div>
                    <%
                                }

                            }

                        }
                    %>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
