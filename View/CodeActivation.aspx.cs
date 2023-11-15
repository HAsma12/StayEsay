using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View
{
    public partial class CodeActivation : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

    
        string userEmail;

        protected void Page_Load(object sender, EventArgs e)
        {
            userEmail = Request.QueryString["email"];

            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(userEmail))
                {
                    // L'e-mail de l'utilisateur est manquant dans la requête, rediriger vers la page d'inscription
                    Response.Redirect("Inscription.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string activationCode = txtActivationCode.Value.Trim();

            // Vérifier si le code d'activation est correct pour l'utilisateur correspondant à l'e-mail
            if (IsValidActivationCode(userEmail, activationCode))
            {
                // Mettre à jour la colonne "Confirmed" du compte de l'utilisateur à true dans la base de données
                UpdateConfirmedStatus(userEmail);

                // Rediriger vers la page de connexion
                Response.Redirect("Login.aspx");
            }
            else
            {
                ErrMsg.InnerText = "Le code d'activation est incorrect.";
            }
        }

        private bool IsValidActivationCode(string email, string activationCode)
        {
            string query = "SELECT COUNT(*) FROM [dbo].[Utilisateur1] WHERE [Email] = @Email AND [ActivationCode] = @ActivationCode";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
            int count = (int)cmd.ExecuteScalar();
            return count > 0;
        }

        private void UpdateConfirmedStatus(string email)
        {
            string query = "UPDATE [dbo].[Utilisateur1] SET [Confirmed] = 1 WHERE [Email] = @Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.ExecuteNonQuery();
        }

        }
    }

