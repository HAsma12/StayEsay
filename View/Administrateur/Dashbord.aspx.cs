using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Administrateur
{
    public partial class Dashbord : System.Web.UI.Page


    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int userCount = GetTotalUsers(); // le nombre de comptes utilisateurs depuis la base de données
                userCountLabel.Text = userCount.ToString();


                int supplierCount = GetTotalSuppliers(); 
                supplierCountLabel.Text = supplierCount.ToString();

                int hotelCount = GetTotalhotel(); 
                HotelLabel.Text = hotelCount.ToString();

                int RestaurantCount = GetTotalrestaurant();
                serviceRestaurantLabel.Text = hotelCount.ToString();


            }
        }

        private int GetTotalUsers()
        {
           

            int totalUsers = 0;

  
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Utilisateur1", con);

                totalUsers = (int)command.ExecuteScalar();
            

            return totalUsers;
        }

        private int GetTotalhotel()
        {
           

            int totalHotels = 0;

 
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM hotel", con);

            totalHotels = (int)command.ExecuteScalar();


            return totalHotels;
        }





        private int GetTotalrestaurant()
        {
          

            int totalRestaurants = 0;

          



            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM restaurant", con);
            totalRestaurants = (int)command.ExecuteScalar();


            return totalRestaurants;
        }


        private int GetTotalSuppliers()
        {
           

            int totalSuppliers = 0;

                SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Fournisseur", con);
                totalSuppliers = (int)command.ExecuteScalar();
            

            return totalSuppliers;
        }

    }
}