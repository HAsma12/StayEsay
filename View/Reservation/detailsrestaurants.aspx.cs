using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace StayEsay.View.Reservation
{ 
   

    public partial class detailsrestaurants : System.Web.UI.Page

    {
       
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            string NomComplet = NomTextBox.Value;
            string contenu = ContenuTextBox.Value;

            //int note = Convert.ToInt32(Request.Form["rating"]);

            //// Récupérer la note sélectionnée
            //if (Rating1.Checked)
            //    note = 1;
            //else if (Rating2.Checked)
            //    note = 2;
            //else if (Rating3.Checked)
            //    note = 3;
            //else if (Rating4.Checked)
            //    note = 4;
            //else if (Rating5.Checked)
            //    note = 5;

            // Insérer le commentaire dans la base de données
            int restaurantId = Convert.ToInt32(Request.QueryString["Idrestaurant"]);

            string connectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
            string query = "INSERT INTO Commentaires (NomComplet, contenu,  date_heure, restaurant_id) VALUES (@NomComplet, @contenu,@dateHeure, @restaurantId)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NomComplet", NomComplet);
                    command.Parameters.AddWithValue("@contenu", contenu);
                
                    command.Parameters.AddWithValue("@dateHeure", DateTime.Now);
                    command.Parameters.AddWithValue("@restaurantId", restaurantId);

                    command.ExecuteNonQuery();
                }
            }

            // Réinitialiser les valeurs du formulaire si nécessaire

            // Afficher un message de succès ou rediriger l'utilisateur vers une autre page
        }
        protected void AnnulerBtn_Click(object sender, EventArgs e)
        {
            // Code pour gérer l'annulation du formulaire si nécessaire
        }

    }
}