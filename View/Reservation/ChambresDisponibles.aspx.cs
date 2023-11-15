using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Reservation
{
    public partial class ChambresDisponibles : Page
    {
            protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
            }
        }

        protected void btnReserver_Click(object sender, EventArgs e)
        {
            string dateDebut = Session["DateDebut"] as string;
            string dateFin = Session["DateFin"] as string;
            string typeChambre = Session["TypeChambre"] as string;

            Button button = (Button)sender;
            int utilisateurId = Convert.ToInt32(Session["Id"]);
            decimal prixtotal = 0; 

            string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                

                string availabilityQuery = "SELECT COUNT(*) FROM ReservationChambre " +
                    "WHERE (@dateDebut BETWEEN datedebut AND datefin OR @dateFin BETWEEN datedebut AND datefin)";

                using (SqlCommand availabilityCommand = new SqlCommand(availabilityQuery, connection))
                {
                    availabilityCommand.Parameters.AddWithValue("@dateDebut", dateDebut);
                    availabilityCommand.Parameters.AddWithValue("@dateFin", dateFin);

                    connection.Open();
                    int existingReservations = (int)availabilityCommand.ExecuteScalar();

                    if (existingReservations > 0)
                    {
                        

                        string errorMessage = "La chambre est déjà réservée pour les dates spécifiées.";
                        ClientScript.RegisterStartupScript(this.GetType(), "ReservationError", "alert('{errorMessage}');", true);
                        return;
                    }
                }

                string query = "INSERT INTO ReservationChambre (datedebut, datefin, prixtotal, utilisateurId, ChambreId) " +
                    "SELECT @datedebut, @datefin, @prixtotal, @utilisateurId, c.IdCH " +
                    "FROM Chambre c " +
                    "WHERE c.type = @type";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@datedebut", dateDebut);
                    command.Parameters.AddWithValue("@datefin", dateFin);
                    command.Parameters.AddWithValue("@prixtotal", prixtotal);
                    command.Parameters.AddWithValue("@utilisateurId", Convert.ToInt32(Session["Id"]));
                    command.Parameters.AddWithValue("@type", typeChambre);

                    command.ExecuteNonQuery();

                    string script = "alert('Réservation effectuée avec succès.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ReservationSuccess", script, true);
                }
            }
        }


        }




        }
  

