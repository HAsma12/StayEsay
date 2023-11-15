using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace StayEsay.View
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public static string email;
      

        public override void VerifyRenderingInServerForm(Control control)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Récupérer l'adresse e-mail et le mot de passe saisis par l'utilisateur
            string enteredEmail = txtEmail.Value;
            string enteredPassword = txtMdp.Value;

            // Vérifier si c'est un compte administrateur
            string adminQuery = "SELECT Id FROM Administrateur WHERE EmailA = '{0}' AND MdpA = '{1}'";
            adminQuery = string.Format(adminQuery, txtEmail.Value, txtMdp.Value);
            DataTable adminDt = Global.GetDatas(adminQuery);

            // Vérifier si c'est un compte fournisseur
            string fournisseurQuery = "SELECT Id FROM Fournisseur WHERE Email = @Email AND Mdp = @Password";
            SqlCommand fournisseurCommand = new SqlCommand(fournisseurQuery, con);
            fournisseurCommand.Parameters.AddWithValue("@Email", enteredEmail);
            fournisseurCommand.Parameters.AddWithValue("@Password", HashPassword(enteredPassword));
            DataTable fournisseurDt = new DataTable();
            SqlDataAdapter fournisseurAdapter = new SqlDataAdapter(fournisseurCommand);
            fournisseurAdapter.Fill(fournisseurDt);

            // Vérifier si c'est un compte utilisateur
            string userQuery = "SELECT Id FROM Utilisateur1 WHERE Email = @Email AND Mdp = @Password";
            SqlCommand userCommand = new SqlCommand(userQuery, con);
            userCommand.Parameters.AddWithValue("@Email", enteredEmail);
            userCommand.Parameters.AddWithValue("@Password", HashPassword(enteredPassword));
            DataTable userDt = new DataTable();
            SqlDataAdapter userAdapter = new SqlDataAdapter(userCommand);
            userAdapter.Fill(userDt);

            if (adminDt.Rows.Count > 0)
            {
                // Connexion réussie, rediriger vers la page d'administration
                Session["id"] = "true";
                Response.Redirect("Administrateur/Dashbord.aspx");
            }
            else if (fournisseurDt.Rows.Count > 0)
            {
                // Connexion réussie, rediriger vers la page de profil du fournisseur
                int fournisseurId = Convert.ToInt32(fournisseurDt.Rows[0][0]);
                Session["Id"] = fournisseurId;
                Response.Redirect("Fournisseur/test.aspx?fournisseurId=" + fournisseurId);
            }
            else if (userDt.Rows.Count > 0)
            {
                // Connexion réussie en tant qu'utilisateur confirmé
                int userId = Convert.ToInt32(userDt.Rows[0]["Id"]);
                Session["Id"] = userId;
                Response.Redirect("Reservation/apropos.aspx?userId=" + userId);
            }
            else
            {
                // Compte invalide
                InfoMsg.InnerText = "Invalid credentials. Please try again.";
            }
        }


        private string HashPassword(string enteredPassword)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(enteredPassword));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in hashedBytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

       

    }
}