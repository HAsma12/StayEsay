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
    public partial class FournisseurMaster : System.Web.UI.MasterPage
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                // L'utilisateur a accès à cette page réservée aux administrateurs
                Response.Redirect("/View/Login.aspx");
            }

            if (Session["Id"] != null)
            {
                int Id = (int)Session["Id"];

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT NomComplet FROM [Fournisseur] WHERE Id = @Id";
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@Id", Id); // utilisation de la variable Id
                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        string nomComplet = reader["NomComplet"].ToString();
                        lblFournisseur.Text = nomComplet;
                    }
                    reader.Close();
                }
             

            }

        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Supprimer la session
            Session.Abandon();

            // Redirection POST vers la page de connexion
            Response.Clear();
            Response.Write("<html><head>");
            Response.Write("<script language='javascript'>window.location.href='/View/Login.aspx';</script>");
            Response.Write("</head><body></body></html>");
            Response.End();
        }
       

    }
}
