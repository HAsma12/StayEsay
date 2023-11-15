using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class DashboardF : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Idfournisseur = GetLoggedInSupplierId(); // Méthode pour obtenir l'ID du fournisseur connecté

                BindRestaurantReservations(Idfournisseur);


                int commCount = GetTotalcomm(Idrestaurant);
                CommenatiresLabel.Text = commCount.ToString();
            }
        }



        private int GetTotalcomm(int Idrestaurant)
        {
            // Code pour récupérer le nombre total de comptes fournisseurs depuis votre source de données
            // Par exemple, vous pouvez exécuter une requête SQL ou utiliser une méthode d'accès aux données

            int totalcomm = 0;

            // Exemple de récupération du nombre total de comptes fournisseurs depuis une base de données SQL


            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Commentaires WHERE  restaurant_id =@Idrestaurant", con);
            command.Parameters.AddWithValue("@Idrestaurant", Idrestaurant);
            totalcomm = (int)command.ExecuteScalar();


            return totalcomm;
        }


        private void BindRestaurantReservations(int Idfournisseur)
        {
            SqlCommand command = new SqlCommand("SELECT COUNT(*) AS ReservationCount, r.[nom] AS RestaurantName FROM ReservationTable rt INNER JOIN restaurant r ON rt.[restaurantId] = r.[Idrestaurant] WHERE r.[Idfournisseur] = @Idfournisseur GROUP BY r.[nom]", con);
            command.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);

            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dt);

            restaurantReservationRepeater.DataSource = dt;
            restaurantReservationRepeater.DataBind();
        }

        private int GetLoggedInSupplierId()
        {
            // Code pour obtenir l'ID du fournisseur connecté
            // Par exemple, vous pouvez utiliser des informations de session, des cookies, etc.

            // Retourne l'ID du fournisseur connecté (à adapter selon votre logique d'authentification)
            return 123;
        }



        public int Idrestaurant { get; set; }
    }
}