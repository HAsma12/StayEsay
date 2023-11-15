using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class changermotdepasse : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in hashedBytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;
            string currentPassword = txtMdp.Value;
            string newPassword = txtNewPassword.Value;
            string confirmNewPassword = txtConfirmNewPassword.Value;

            // Vérifier que le mot de passe actuel correspond au mot de passe stocké dans la base de données

            string currentPasswordDB = GetPasswordFromDatabase(email);
            string hashedCurrentPassword = HashPassword(currentPassword);

            if (hashedCurrentPassword != currentPasswordDB)
            {
                ErrMsg.InnerText = "Le mot de passe actuel est incorrect.";
                return;
            }

          

            if (newPassword != confirmNewPassword)
            {
                ErrMsg.InnerText = "Les champs du nouveau mot de passe ne correspondent pas.";
                return;
            }

            string hashedNewPassword = HashPassword(newPassword);

          
            UpdatePasswordInDatabase(email, newPassword);

            ErrMsg.InnerText = "Le mot de passe a été modifié avec succès.";


        }
        private void UpdatePasswordInDatabase(string email, string newPassword)
        {
            string hashedNewPassword = HashPassword(newPassword);

            SqlCommand cmd = new SqlCommand("UPDATE Fournisseur SET Mdp = @NewPassword WHERE Email = @Email", con);
            cmd.Parameters.AddWithValue("@NewPassword", hashedNewPassword);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.ExecuteNonQuery();
        }





        private string GetPasswordFromDatabase(string email)
        {

            SqlCommand cmd = new SqlCommand("SELECT Mdp FROM Fournisseur WHERE Email = @Email", con);
            cmd.Parameters.AddWithValue("@Email", email);
            string password = (string)cmd.ExecuteScalar();

            return password;
        }



    }
}