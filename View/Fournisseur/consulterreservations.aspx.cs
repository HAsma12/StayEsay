using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class consulterreservations : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            if (Session["Id"] != null)
            {
                int fournisseurId = int.Parse(Session["Id"].ToString());

                List<int> restaurantIds = GetRestaurantIds(fournisseurId);
   
                string query = "SELECT  r.IdReservation, r.Date, r.Temps, r.nbrp, u.NomComplet, u.Email, u.Telephone ,rt.Idrestaurant , rt.nom  FROM ReservationTable r  INNER JOIN restaurant rt  ON r.restaurantId = rt.Idrestaurant   INNER JOIN Utilisateur1 u ON r.utilisateurId = u.Id WHERE rt.Idrestaurant IN (" + string.Join(",", restaurantIds) + ")";

                SqlCommand command = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

          
                consulterReservations.DataSource = dataTable;
                consulterReservations.DataBind();
            }
        }

        private List<int> GetRestaurantIds(int fournisseurId)
        {
            List<int> restaurantIds = new List<int>();

            string query = "SELECT Idrestaurant FROM restaurant WHERE Idfournisseur = @fournisseurId";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@fournisseurId", fournisseurId);
        
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int restaurantId = Convert.ToInt32(reader["Idrestaurant"]);
                restaurantIds.Add(restaurantId);
            }
          
            return restaurantIds;
        }

      
    }
}
