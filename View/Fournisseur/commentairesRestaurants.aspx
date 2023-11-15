<%@ Page Title="" Language="C#" MasterPageFile="~/View/Fournisseur/FournisseurMaster.Master" AutoEventWireup="true" CodeBehind="commentairesRestaurants.aspx.cs" Inherits="StayEsay.View.Fournisseur.commentairesRestaurants" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


     <style>
         .comment-card {
             margin-bottom: 20px; 
         }

             .comment-card .card-body {
                 width: 500px; 
                 margin: 0 auto; 
             }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <h1 class="text-center" style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">LISTE DES COMMENTAIRES</h1>
<br />
<div class="d-flex justify-content-center align-items-center">
    <div class="comment-widgets">
        <% 
        string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT [ idComm], NomComplet, contenu, date_heure FROM Commentaires";


            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int idComm = reader.GetInt32(0);
                        string nomComplet = reader.GetString(1);
                        string contenu = reader.GetString(2);
                        DateTime dateHeure = reader.GetDateTime(3);

                        %>
                        <!-- Comment Card -->
                        <div class="card comment-card">
                            <div class="card-body">
                                <h6 class="card-title font-medium"><%= nomComplet %></h6>
                                <p class="card-text m-b-15"><%= contenu %></p>
                                <div class="comment-footer">
                                    <span class="text-muted float-right"><%= dateHeure.ToString("MMMM d, yyyy") %></span>
   <%--        <button type="button" class="btn btn-success btn-sm" onclick="toggleReplyForm(<%= idComm %>);">Répondre</button>--%>
           <button type="button" class="btn btn-danger btn-sm" data-comment-id="<%= idComm %>" onclick="deleteComment(this)">Supprimer</button>

                                </div>
                            </div>
                         
                             <!-- Formulaire de réponse pour l'administrateur -->
                            <div class="card-footer" id="replyForm<%= idComm %>" style="display: none;">
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Répondre au commentaire"></asp:TextBox>
                                <br />
                                <asp:Button ID="Button1" runat="server" Text="Envoyer" CssClass="btn btn-primary btn-sm"  CommandArgument='<%= idComm %>' />
                            </div>
                        </div>
                        <!-- Comment Card -->
                        <% 
                    }
                }
            }
        }
        %>
    </div>
    <div class="p-2">
        <img src="../../Asset/images/icons/bloom-chat-conversation.gif" alt="user" width="250" class="rounded-circle">
    </div>
</div>

<script>
   
    function deleteComment(button) {
        var commentCard = button.closest(".comment-card"); 

        // Supprimer le commentaire du DOM
        commentCard.remove();
    }

</script>

</asp:Content>
