using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Reservation
{
    public partial class ReservationMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] != null)
            {
                int Id = Convert.ToInt32(Session["Id"]);

                // Utilisez l'identifiant de l'utilisateur pour effectuer des opérations spécifiques à l'utilisateur connecté

                ////// Exemple : Afficher le nom de l'utilisateur connecté
                ////lblUtilisateur.Text = "Bienvenue, Utilisateur #" + userId.ToString();
            }
            else
            {
                // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
                Response.Redirect("~/View/Login.aspx");
            }
        }

    }
}