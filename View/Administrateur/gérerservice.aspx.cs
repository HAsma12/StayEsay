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
    public partial class gérerservice : System.Web.UI.Page
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
            // Création de la requête SQL avec le filtre sur le statut "En attente"
            string query = "SELECT * FROM hotel WHERE statu = 'En attente'";

            // Exécution de la requête SQL
            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            // Modifier la statut 
            dataTable.Columns["statu"].ColumnName = "statu";
            foreach (DataRow row in dataTable.Rows)
            {
                if (row["statu"].ToString() == "Accepter")
                    row["statu"] = "Accepté";
                else if (row["statu"].ToString() == "Refuser")
                    row["statu"] = "Refusé";
            }

            // taamel affichage de donnes f GridView
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }





        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            // Récupérer la ligne sélectionnée dans le GridView
            GridViewRow row = (sender as Control).NamingContainer as GridViewRow;

            if (row != null)
            {
                DropDownList ddlActions = row.FindControl("ddlActions") as DropDownList;

                if (ddlActions != null)
                {
                    string statut = ddlActions.SelectedValue;
                    string id = e.CommandArgument.ToString();

                    string updateQuery = "UPDATE hotel SET statu = @statut WHERE Idhotel = @id";

                    using (SqlCommand command = new SqlCommand(updateQuery, con))
                    {
                        command.Parameters.AddWithValue("@statut", statut);
                        command.Parameters.AddWithValue("@id", id);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                           
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

        protected string GetImageUrl(object image)
        {
            if (image != null && image != DBNull.Value)
            {
                byte[] imageData = (byte[])image;
                string base64String = Convert.ToBase64String(imageData);
                return "data:image/jpeg;base64," + base64String;
            }
            return string.Empty;
        }

    }
}