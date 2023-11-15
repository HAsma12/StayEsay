using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Administrateur
{
    public partial class gererservicerestaurants : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        private void LoadData()
        {
            
            string query = "SELECT * FROM restaurant   WHERE statu = 'En attente' ";

            // Exécution de la requête SQL
            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            // Modifier la colonne statut 
            dataTable.Columns["statu"].ColumnName = "statu";
            foreach (DataRow row in dataTable.Rows)
            {
                if (row["statu"].ToString() == "Accepter")
                    row["statu"] = "Accepté";
                else if (row["statu"].ToString() == "Refuser")
                    row["statu"] = "Refusé";
            }

         
            GridViewRestaurant.DataSource = dataTable;
            GridViewRestaurant.DataBind();
        }


        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
           
            GridViewRow row = (sender as Control).NamingContainer as GridViewRow;

            if (row != null)
            {
                DropDownList ddlActions = row.FindControl("ddlActions") as DropDownList;

                if (ddlActions != null)
                {
                    string statut = ddlActions.SelectedValue;
                    string id = e.CommandArgument.ToString();

                    string updateQuery = "UPDATE restaurant SET statu = @statut WHERE Idrestaurant = @id";

                    using (SqlCommand command = new SqlCommand(updateQuery, con))
                    {
                        command.Parameters.AddWithValue("@statut", statut);
                        command.Parameters.AddWithValue("@id", id);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                           
                        
                            // La mise à jour a réussi
                        
                            LoadData();
                        }
                        else
                        {
                            // La mise à jour a échoué
                           
                        }
                    }
                }
            }


        }







        protected string GetImageUrl(object imageBytes)
        {
            byte[] bytes = (byte[])imageBytes;
            if (bytes != null && bytes.Length > 0)
            {
                string base64String = Convert.ToBase64String(bytes);
                string imageUrl = "data:image/jpeg;base64," + base64String;
                return imageUrl;
            }
            return string.Empty;
        }

    }
}