<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="restaurants.aspx.cs" Inherits="StayEsay.View.User.restaurants" %>
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
    .card-body {
  /* Styles spécifiques pour la div du bouton */
}

.card-body button {
  background-color: #ecabb5;
  color: #fff; 
  padding: 10px 20px; 
  border: none; 
  border-radius: 5px; 
  cursor: pointer; 
}

.card-body button:hover {
  background-color: #ecabb5; 
}

.card-body button:focus {
  outline: none;
}



</style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
     <br /><br />
     <!-- Start Content -->
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-12">

                <div class="row">

                    <% 
                        string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

                        // Récupération des données de la table "hotel"
                        string sql = "SELECT Idrestaurant, nom , image_restau FROM restaurant  WHERE statu = 'Accepter'";
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
                            
                            </div>
                            <div class="card-body">
                                <p class="h3 text-decoration-none"><%= nom %></p>
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-secondary btn-sm" href="Details_Restaurant.aspx?Idrestaurant=<%= reader.GetInt32(0).ToString() %>" style="background-color:#ecabb5">Details</a></li>

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
