<%@ Page Title="" Language="C#" MasterPageFile="~/View/Reservation/ReservationMaster.Master" AutoEventWireup="true" CodeBehind="ChambresDisponibles.aspx.cs" Inherits="StayEsay.View.Reservation.ChambresDisponibles"  EnableEventValidation="false"%>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         function updatePrixTotalRepas(chambreIndex) {
             var selectElement = document.getElementById("pension_" + chambreIndex);
             var prixRepasOption = parseInt(selectElement.value);
             var prixTotalChambreElement = document.getElementById("prixTotalChambre_" + chambreIndex);
             var prixTotalChambre = parseInt(prixTotalChambreElement.textContent);
             var nombreJoursElement = document.getElementById("nombreJours_" + chambreIndex);
             var nombreJours = parseInt(nombreJoursElement.textContent);

             var prixTotal = prixTotalChambre + (prixRepasOption * nombreJours);
             var prixTotalElement = document.getElementById("prixTotal_" + chambreIndex);
             prixTotalElement.textContent = prixTotal;


         }
    </script>
    <style>.table-container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.reservation-table {
   
    border-collapse: collapse;
    width: 100%;
}

.reservation-table th, .reservation-table td {
   
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
}


</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">






    <br /><br /><br /><br />  <br /><br /><br /><br />
    <%
        string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        string dateDebut = Session["DateDebut"] as string;
        string dateFin = Session["DateFin"] as string;
        string typeChambre = Session["TypeChambre"] as string;
        int ChambreId = Convert.ToInt32(Session["IdCH"]);
        string query = "SELECT * FROM Chambre WHERE type = @type ";
        string queryRepas = "SELECT * FROM Repashotel";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@type", typeChambre);
                    
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string chambreId = reader["IdCH"].ToString();
                        string vue = reader["vue"].ToString();
                        int prixParNuit = Convert.ToInt32(reader["prix"]);

                        // Conversion des chaînes de caractères en objets DateTime
                        DateTime dateDebutObj = DateTime.Parse(dateDebut);
                        DateTime dateFinObj = DateTime.Parse(dateFin);

                        // Calcul du nombre de jours entre les dates
                        int nombreJours = (dateFinObj - dateDebutObj).Days;

                        int prixTotalChambre = prixParNuit * nombreJours;
                        int prixTotalRepas = 0; // Initialisez le prix total des repas à 0
                        %>

    <div class="table-container">
    <table class="reservation-table">
                      
                            <tr>
                                <th>Chambre</th>
                                <th>Type de vue</th>
                                <th>Options de pension</th>
                                <th>Prix par nuit</th>
                                <th>Nombre de jours</th>
                                <th>Prix total chambre</th>
                                <th>Prix total</th>
                                <th></th>
                            </tr>
                            <tr>
                                <td><%= chambreId %></td>
                                <td><%= vue %></td>
                                <td>
                                    <select id="pension_<%= chambreId %>" onchange="updatePrixTotalRepas('<%= chambreId %>');">
                                        <%
                                        using (SqlCommand commandRepas = new SqlCommand(queryRepas, connection))
                                        {
                                            using (SqlDataReader readerRepas = commandRepas.ExecuteReader())
                                            {
                                                while (readerRepas.Read())
                                                {
                                                    string nomRepas = readerRepas["NomRepas"].ToString();
                                                    decimal tarifRepas = (decimal)readerRepas["Tarif"];
                                                    int prixRepasOption = (int)(tarifRepas * nombreJours);
                                                    prixTotalRepas += prixRepasOption; // Ajouter le prix de l'option repas au total
                                                    %>
                                                    <option value="<%= prixRepasOption %>"><%= nomRepas %></option>
                                                    <% 
                                                }
                                            }
                                        } %>
                                    </select>
                                </td>
                                <td><%= prixParNuit %></td>
                                <td id="nombreJours_<%= chambreId %>"><%= nombreJours %></td>
                                <td id="prixTotalChambre_<%= chambreId %>"><%= prixTotalChambre %></td>
                                <td id="prixTotal_<%= chambreId %>"><%= prixTotalChambre + prixTotalRepas %></td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Réserver" OnClick="btnReserver_Click" CommandArgument='<%= chambreId %>' />
                                </td>
                            </tr>
                        </table>
        </div>
                        <%
                    }
                }
            }
        }
    %>




<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
