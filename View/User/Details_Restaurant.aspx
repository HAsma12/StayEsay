<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Details_Restaurant.aspx.cs" Inherits="StayEsay.View.User.Details_Restaurant" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="../../Asset/css/commentaire.css" rel="stylesheet" media="all" />

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
                        int Idrestaurant = Convert.ToInt32(Request.QueryString["Idrestaurant"]);
                        // Response.Write(" <script>alert('" + Idhotel.ToString().Replace("'", " ") + "')</script>");

                        string sql = "SELECT   Idrestaurant,nom, description, cuisine, repas, regimesspeciaux, image_restau , imgsupp1, imgsupp2, imgsupp3, adresse, telephone FROM restaurant where Idrestaurant=@Idrestaurant"; 
                        using (SqlCommand command = new SqlCommand(sql, StayEsay.Global.connection))
                        {
                            command.Parameters.AddWithValue("@Idrestaurant", Idrestaurant);

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    string nom = reader["nom"].ToString();
                                    string description = reader["description"].ToString();
                                    string cuisine = reader["cuisine"].ToString();
                                    string repas = reader["repas"].ToString();
                                    string regimesspeciaux = reader["regimesspeciaux"].ToString();
                                    string adresse = reader["adresse"].ToString();
                                    string telephone = reader["telephone"].ToString();
                                    byte[] image_restau = (byte[])reader["image_restau"];
                                    byte[] imgsupp1 = (byte[])reader["imgsupp1"];
                                    byte[] imgsupp2 = (byte[])reader["imgsupp2"];
                                    byte[] imgsupp3 = (byte[])reader["imgsupp3"];

                    %>

                    <div class="card mb-3">
                        <% if (image_restau != null)
                           { %>
                        <img class="card-img img-fluid" src="data:image/jpeg;base64,<%= Convert.ToBase64String(image_restau) %>" alt="image_restau" />
                        <% } %>
                    </div>
                    <div class="row">
                       
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                            <!--Start Slides-->
                            <div class="carousel-inner product-links-wap" role="listbox">

                                <!--First slide-->
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
                            <!--End Slides-->
                        </div>
                   
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Nom d'hotel:</h4>
                            <p class="h2" style="font-size: 24px;"><%= nom %></p>
                         <%--   <p class="py-2">
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
                            </p>--%>



                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Description:</h4>
                            <p><%= description %></p>
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Cuisine:</h4>
                            <p><%= cuisine %></p>
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Repas:</h4>
                            <p><%= repas %></p>
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">Regimes Speciaux:</h4>
                            <p><%= regimesspeciaux %></p>
                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">adresse:</h4>
                            <p><%= adresse %></p>


                            <h4 class="h2" style="font-size: 24px; color: #ecabb5">telephone:</h4>
                            <p><%= telephone %></p>


                            <div runat="server">
                                <a href=" /View/Login.aspx">Réserver maintenant</a>
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
  <div class="card2">
     <% 

// Récupération des commentaires de la base de données
        string query = "SELECT  NomComplet , contenu, date_heure FROM Commentaires WHERE restaurant_id  = @restaurant_id ";
using (SqlConnection connection = new SqlConnection(connectionString))
{
    connection.Open();

    using (SqlCommand command = new SqlCommand(query, connection))
    {
        command.Parameters.AddWithValue("@restaurant_id", Idrestaurant);

        using (SqlDataReader reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                string NomComplet = reader.GetString(0); // Récupérer le nom du commentaire
                string contenu = reader.GetString(1); // Récupérer le contenu du commentaire
                DateTime dateHeure = reader.GetDateTime(2); 

                %>

                <!-- Comment Row -->
                <div class='d-flex flex-row comment-row m-t-0'>
                    <div class='comment-text w-100'>
                        <h6 class='font-medium'><%= NomComplet %></h6>
                        <span class='m-b-15 d-block'><%= contenu %></span>
                        <div class='comment-footer'>
                            <span class='text-muted float-right'><%= dateHeure.ToString("MMMM d, yyyy") %></span>
                        </div>
                    </div>
                </div>
                <!-- Comment Row -->

                <% 
            }
        }
    }
}
%>
      <div class="row">
        <div class="col-2">
            <img src="https://i.imgur.com/xELPaag.jpg" width="70" class="rounded-circle mt-2">
        </div>
        <div class="col-10">
            <div class="comment-box ml-2">
                <h4>Écrivez un commentaire</h4>
                <div class="comment-info mt-2">
                    <input type="text" class="form-control" placeholder="Votre nom ou pseudonyme" runat="server" id="NomTextBox" />
                </div>
                <br />
               
                <div class="comment-area">
                    <textarea class="form-control" placeholder="what is your view?" rows="4" runat="server" id="ContenuTextBox"></textarea>
                </div>
                <div class="comment-btns mt-2">
                    <div class="row">
                        <div class="col-6">
                            <div class="pull-left">
                                <asp:Button class="btn btn-success btn-sm" ID="AnnulerBtn" runat="server" Text="Annuler" OnClick="AnnulerBtn_Click" />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="pull-right">
                               
                                <asp:Button class="btn btn-success btn-sm" ID="AddBtn" runat="server" Text="Envoyer" OnClick="AddBtn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
   

</asp:Content>
