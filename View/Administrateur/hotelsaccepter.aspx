<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="hotelsaccepter.aspx.cs" Inherits="StayEsay.View.Administrateur.hotelsaccepter" %>
 <%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Start Content -->
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-12">

                <div class="row">

                    <% 
                        string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

                        // Récupération des données de la table "hotel"
                        string sql = "SELECT Idhotel , nom, categorie,image_hotel FROM hotel WHERE statu = 'Accepter'";
                        using (SqlCommand command = new SqlCommand(sql, StayEsay.Global.connection))
                        {

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    int Idhotel = reader.GetInt32(0);
                                    string nom = reader.GetString(1);
                                    string categorie = reader.GetString(2);


                                    byte[] imageBytes = (byte[])reader["image_hotel"];
                                    string imageBase64 = Convert.ToBase64String(imageBytes);
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">

                   <img class="card-img rounded-0 img-fluid hotel-img" src="data:image/png;base64,<%= imageBase64  %>" />
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white mt-2" href="detilshotelsacceptes.aspx?Idhotel=<%= reader.GetInt32(0).ToString() %>">details</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="h3 text-decoration-none"><%= nom %></p>
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
