using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Administrateur
{
    public partial class gerer_profil : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;
        public override void VerifyRenderingInServerForm(Control control)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
        }
        protected void EditBtn_Click (object sender, EventArgs e)
        {
            string email = txtEmail.Value;
            string currentPassword = txtMdp.Value;
            string newPassword = txtNewPassword.Value;
            string confirmNewPassword = txtConfirmNewPassword.Value;

            // Vérifier que le mot de passe actuel correspond au mot de passe stocké dans la base de données
            string currentPasswordDB = GetPasswordFromDatabase(email);
            if (currentPassword != currentPasswordDB)
            {
                ErrMsg.InnerText = "Le mot de passe actuel est incorrect.";
                return;
            }
            // Vérifier que les champs du nouveau mot de passe et de confirmation du nouveau mot de passe sont identiques
            if (newPassword != confirmNewPassword)
            {
                ErrMsg.InnerText = "Les champs du nouveau mot de passe ne correspondent pas.";
                return;
            }
       
            UpdatePasswordInDatabase(email, newPassword);

        
            ErrMsg.InnerText = "Le mot de passe a été modifié avec succès.";

        
        }
        private void UpdatePasswordInDatabase(string email, string newPassword)
        {
          
            SqlCommand cmd = new SqlCommand("UPDATE Administrateur SET MdpA = @NewPassword WHERE EmailA = @Email", con);
            cmd.Parameters.AddWithValue("@NewPassword", newPassword);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.ExecuteNonQuery();
            
        }



        private string GetPasswordFromDatabase(string email)
        {

            SqlCommand cmd = new SqlCommand("SELECT MdpA FROM Administrateur WHERE EmailA = @Email", con);
            cmd.Parameters.AddWithValue("@Email", email);
            string password = (string)cmd.ExecuteScalar();
           
            return password;
        }


    
    }
}