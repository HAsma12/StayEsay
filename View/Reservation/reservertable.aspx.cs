using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Reservation
{
    public partial class reservertable : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnReserver_Click(object sender, EventArgs e)
        {
            // Récupérer les valeurs saisies par l'utilisateur
            string nom = txtnom.Value;
            string email = txtemail.Value;
            string date = txtdate.Value;
            string heure = txttime.Value;
            int nombrePersonnes = Convert.ToInt32(txtnbrp.Value);
            string telephone = txttel.Value;

            string Emplacement = "";
            if (Radio3.Checked)
            {
                Emplacement = "Zone intérieure";
            }
            else if (Radio4.Checked)
            {
                Emplacement = "Terrasse";
            }
            else if (Radio5.Checked)
            {
                Emplacement = "Balcon";
            }

            // Vérifier si la table est déjà réservée pour la même date, heure et nombre de personnes spécifiés
            int restaurantId = Convert.ToInt32(Request.QueryString["Idrestaurant"]);
            if (IsTableReserved(restaurantId, Convert.ToDateTime(date), TimeSpan.Parse(heure), nombrePersonnes))
            {
                string script = @"Swal.fire({
                    icon: 'error',
                    title: 'Cette table est déjà réservée',
                    text: 'Veuillez choisir une autre date ou heure.',
                    footer: '<a href="">Pourquoi ai-je ce problème?</a>'
                })";

                ScriptManager.RegisterStartupScript(this, GetType(), "ReservationError", script, true);
                return;
            }

            // Vérifier si la table choisie est disponible pour la réservation
            if (!IsTableAvailable(restaurantId, Emplacement, nombrePersonnes))
            {
                string script = @"Swal.fire({
                    icon: 'error',
                    title: 'Table non disponible',
                    text: 'La table choisie n'est pas disponible pour la réservation.',
                    footer: '<a href="">Pourquoi ai-je ce problème?</a>'
                })";

                ScriptManager.RegisterStartupScript(this, GetType(), "TableNotAvailable", script, true);
                return;
            }


            DateTime reservationDate = Convert.ToDateTime(date);
            TimeSpan reservationTime = TimeSpan.Parse(heure);

            if (IsTableReserve(restaurantId, Emplacement, nombrePersonnes, reservationDate, reservationTime))
            {
                string script = @"Swal.fire({
        icon: 'error',
        title: 'Cette table est déjà réservée',
        text: 'Veuillez choisir une autre date ou heure.'
    })";

                ScriptManager.RegisterStartupScript(this, GetType(), "TableAlreadyReserved", script, true);
                return;
            }






            int utilisateurId = Convert.ToInt32(Session["Id"]);

            // Le reste de votre code pour ajouter la réservation à la base de données

            string query = "INSERT INTO [dbo].[ReservationTable] ([Date],[Temps], [nbrp],  [Emplacement], [utilisateurId], [restaurantId]) VALUES (@Date, @Temps, @nbrp,@Emplacement, @utilisateurId , @restaurantId)";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Paramètres de la requête
                cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(date));
                cmd.Parameters.AddWithValue("@Temps", TimeSpan.Parse(heure));
                cmd.Parameters.AddWithValue("@nbrp", nombrePersonnes);
                cmd.Parameters.AddWithValue("@Emplacement", Emplacement);
                cmd.Parameters.AddWithValue("@utilisateurId", utilisateurId);
                cmd.Parameters.AddWithValue("@restaurantId", restaurantId);

                int result = cmd.ExecuteNonQuery();
            }

            string succesScript = "alert('Réservation effectuée avec succès.');";
            ClientScript.RegisterStartupScript(this.GetType(), "ReservationSuccess", succesScript, true);
        }


        private bool IsTableReserved(int restaurantId, DateTime reservationDate, TimeSpan reservationTime, int nombrePersonnes)
        {
            // Requête SQL pour vérifier si la table est réservée pour la date, l'heure et le nombre de personnes spécifiés
            string checkQuery = "SELECT COUNT(*) FROM [dbo].[ReservationTable] WHERE [restaurantId] = @restaurantId AND [Date] = @reservationDate AND [Temps] = @reservationTime AND [nbrp] = @nombrePersonnes ";

            bool isReserved;
            using (SqlCommand checkCmd = new SqlCommand(checkQuery, Global.connection))
            {
                checkCmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                checkCmd.Parameters.AddWithValue("@reservationDate", reservationDate.Date);
                checkCmd.Parameters.AddWithValue("@reservationTime", reservationTime);
                checkCmd.Parameters.AddWithValue("@nombrePersonnes", nombrePersonnes);

                int reservationCount = (int)checkCmd.ExecuteScalar();

                isReserved = reservationCount > 0;
            }

            if (isReserved)
            {
                ErrMsg.InnerText = "La table choisie n'est pas disponible pour la réservation ressssssssssssssssseevre.";
                ErrMsg.Visible = true;
            }

            return isReserved;
        }

        private bool IsTableAvailable(int restaurantId, string emplacement, int nombrePersonnes)
        {
            // Requête SQL pour vérifier si la table est disponible pour la réservation
            string checkQuery = "SELECT COUNT(*) FROM [dbo].[tablerestaurant] WHERE [restaurantId] = @restaurantId AND [Emplacement] = @emplacement AND  [Capacité] = @nombrePersonnes AND [etat] = 'Libre'";

            bool isAvailable;
            using (SqlCommand checkCmd = new SqlCommand(checkQuery, Global.connection))
            {
                checkCmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                checkCmd.Parameters.AddWithValue("@emplacement", emplacement);
                checkCmd.Parameters.AddWithValue("@nombrePersonnes", nombrePersonnes);

                int availableTableCount = (int)checkCmd.ExecuteScalar();

                isAvailable = availableTableCount > 0;
            }

            if (!isAvailable)
            {
                ErrMsg.InnerText = "La table choisie n'est pas disponible pour la réservation.";
                ErrMsg.Visible = true;
            }

            return isAvailable;
        }




        private bool IsTableReserve(int restaurantId, string emplacement, int nombrePersonnes, DateTime reservationDate, TimeSpan reservationTime)
        {
            // Requête SQL pour vérifier si la table est réservée pour la réservation
            string checkQuery = "SELECT COUNT(*) FROM [dbo].[tablerestaurant] WHERE [restaurantId] = @restaurantId AND [Emplacement] = @emplacement AND [Capacité] = @nombrePersonnes AND [etat] = 'Réservé' AND [Date] = @reservationDate AND [heuredebut] = @reservationTime";

            bool isReserve;
            using (SqlCommand checkCmd = new SqlCommand(checkQuery, Global.connection))
            {
                checkCmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                checkCmd.Parameters.AddWithValue("@emplacement", emplacement);
                checkCmd.Parameters.AddWithValue("@nombrePersonnes", nombrePersonnes);
                checkCmd.Parameters.AddWithValue("@reservationDate", reservationDate);
                checkCmd.Parameters.AddWithValue("@reservationTime", reservationTime);

                int reserveTableCount = (int)checkCmd.ExecuteScalar();

                isReserve = reserveTableCount > 0;
            }

            if (isReserve)
            {
                ErrMsg.InnerText = "Cette table est déjà réservée pour la date et l'heure spécifiées. Veuillez choisir une autre date ou heure.";
                ErrMsg.Visible = true;
            }

            return isReserve;
        }







    }
}