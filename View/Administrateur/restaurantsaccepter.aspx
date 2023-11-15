<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="restaurantsaccepter.aspx.cs" Inherits="StayEsay.View.Administrateur.restaurantsaccepter" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
    .hotel-img {
  width: 600%;
  height: 500px; /* ou la hauteur de votre choix */
  object-fit: cover; /* pour ajuster l'image dans le conteneur */
  display: block; /* pour activer la propriété margin */
  margin: 0 auto; /* pour centrer l'image horizontalement */
  text-align: center;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Start Content -->
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-12">

                <div class="row">

                    <% 
                        string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

                        // Récupération des données de la table "hotel"
                        string sql = "SELECT Idrestaurant, nom , image_restau FROM restaurant  WHERE statu = 'Accepter'  ";
                        using (SqlCommand command = new SqlCommand(sql, StayEsay.Global.connection))
                        {

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    int Idrestaurant = reader.GetInt32(0);
                                    string nom = reader.GetString(1);
                                   
                                    byte[] imageBytes = (byte[])reader["image_restau"];
                                    string imageBase64 = Convert.ToBase64String(imageBytes);
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">

                                <img class="card-img rounded-0 img-fluid hotel-img" src="data:image/png;base64,<%= imageBase64  %>" />
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white mt-2" href="Details_Restaurant.aspx?Idrestaurant=<%= reader.GetInt32(0).ToString() %>">details</a></li>

                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="h3 text-decoration-none"><%= nom %></p>
                                <button class="text-center mb-0">reserver votre place </button>
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
