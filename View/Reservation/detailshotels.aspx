<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="detailshotels.aspx.cs" Inherits="StayEsay.View.Reservation.detailshotels" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-card {
            width: 150%;
            height: 200px;
        }

        .styled-button {
            background-color: #ecabb5;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            margin: auto;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <% 
                        string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

                        // Récupération des données de la table "hotel"
                        int Idhotel = Convert.ToInt32(Request.QueryString["Idhotel"]);


                        string sql = "SELECT  Idhotel ,  nom, description, categorie, image_hotel, imgsupp1, imgsupp2, imgsupp3, adresse, telephone FROM hotel where Idhotel=@Idhotel ";
                        using (SqlCommand command = new SqlCommand(sql, StayEsay.Global.connection))
                        {
                            command.Parameters.AddWithValue("@Idhotel", Idhotel);

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    string nom = reader["nom"].ToString();
                                    string categorie = reader["categorie"].ToString();
                                    string description = reader["description"].ToString();
                                    string adresse = reader["adresse"].ToString();
                                    string telephone = reader["telephone"].ToString();
                                    byte[] image_hotel = (byte[])reader["image_hotel"];
                                    byte[] imgsupp1 = (byte[])reader["imgsupp1"];
                                    byte[] imgsupp2 = (byte[])reader["imgsupp2"];
                                    byte[] imgsupp3 = (byte[])reader["imgsupp3"];
                    %>

                    <div class="card mb-3">
                        <% if (image_hotel != null)
                           { %>
                        <img class="card-img img-fluid" src="data:image/jpeg;base64,<%= Convert.ToBase64String(image_hotel) %>" alt="image_hotel" />
                        <% } %>
                    </div>
                    <div class="row">

                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">

                            <div class="carousel-inner product-links-wap" role="listbox">

                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-4">
                                            <%--<a href="#">--%>
                                            <% if (imgsupp1 != null)
                                               { %>
                                            <img class="card-img img-fluid img-card" src="data:image/jpeg;base64,<%= Convert.ToBase64String(imgsupp1) %>" alt="imgsupp1" />
                                            <% } %>
                                        </div>
                                        <div class="col-4">
                                            <% if (imgsupp2 != null)
                                               { %>
                                            <img class="card-img img-fluid img-card" src="data:image/jpeg;base64,<%= Convert.ToBase64String(imgsupp2) %>" alt="imgsupp2" />
                                            <% } %>
                                        </div>
                                        <div class="col-4">
                                            <% if (imgsupp3 != null)
                                               { %>
                                            <img class="card-img img-fluid img-card" src="data:image/jpeg;base64,<%= Convert.ToBase64String(imgsupp3) %>" alt="imgsupp3" />
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Nom d'hotel:</h4>
                            <p class="h2" style="font-size: 24px;"><%= nom %></p>
                            <p class="py-2">
                                <% int categorieInt; %>
                                <% if (Int32.TryParse(categorie, out categorieInt))
                                   { %>
                                <ul class="list-unstyled d-flex ">
                                    <% for (int i = 0; i < categorieInt; i++)
                                       { %>
                                    <li><i class="text-warning fa fa-star"></i></li>
                                    <% } %>
                                </ul>
                                <% }
                                   else
                                   { %>
                                <p>Catégorie non valide</p>
                                <% } %>
                            </p>



                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Description:</h4>
                            <p><%= description %></p>
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">adresse:</h4>
                            <p><%= adresse %></p>


                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">telephone:</h4>
                            <p><%= telephone %></p>

                            <div>
                                <a class="btn btn-secondary btn-sm" href="reservationchambre.aspx?Idhotel=<%= reader.GetInt32(0).ToString() %>" style="background-color: #ecabb5">reserver</a>

                            </div>


                        </div>
                    </div>
                </div>
                <% } %>
                <% } %>
                <% } %>
            </div>
        </div>
    </section>
</asp:Content>
