using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace StayEsay.View
{
    public partial class Inscription : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;


        protected void btnDevenirUtilisateur_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Value;
                string mdp = txtMdp.Value;
                string tel = txtTel.Value;
                string adresse = txtAdresse.Value;
                string nomComplet = txtNomcomplet.Value;

                //// Vérifier si l'e-mail est déjà utilisé
                //if (IsEmailAlreadyUsed(email))
                //{
                //    ErrMsg.InnerText = "Cet e-mail est déjà utilisé. Veuillez utiliser une autre adresse e-mail.";
                //    return;
                //}

                // Générer le code d'activation
                string activationCode = GenerateActivationCode();

                string hashedPassword = HashPassword(mdp);

                // Enregistrer le compte de l'utilisateur dans la base de données
                string query = "INSERT INTO [dbo].[Utilisateur1] ([NomComplet], [Email], [Mdp], [Telephone], [Adresse], [ActivationCode], [Confirmed]) VALUES (@NomComplet, @Email, @Mdp, @Telephone, @Adresse, @ActivationCode, 0)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@NomComplet", nomComplet);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Mdp", hashedPassword);
                cmd.Parameters.AddWithValue("@Telephone", tel);
                cmd.Parameters.AddWithValue("@Adresse", adresse);
                cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                int result = cmd.ExecuteNonQuery();

                // Envoyer le code d'activation par e-mail à l'utilisateur
                SendActivationCodeByEmail(email, activationCode);

                // Rediriger l'utilisateur vers la page de code d'activation
                Response.Redirect("CodeActivation.aspx?email=" + email);
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        //private bool IsEmailAlreadyUsed(string email)
        //{
        //    string query = "SELECT COUNT(*) FROM [dbo].[Utilisateur1] WHERE [Email] = @Email";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@Email", email);
        //    int count = (int)cmd.ExecuteScalar();
        //    return count > 0;
        //}

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

        private string GenerateActivationCode()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, 8).Select(s => s[random.Next(s.Length)]).ToArray());
        }


               private void SendActivationCodeByEmail(string email, string activationCode)
        {

           
            // Configure the email message
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("stayesay16@gmail.com", "stay easy");
            mailMessage.To.Add(email);
            mailMessage.Subject = "Activation Code";
            mailMessage.Body = "Félicitations, vous êtes maintenant un membre enregistré de notre site ! Veuillez saisir le code d'activation suivant pour confirmer votre compte :" + activationCode;

            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential("stayesay16@gmail.com", "rvruaxexihmtyicy");
            smtpClient.EnableSsl = true;

            // Send the email
            smtpClient.Send(mailMessage);
        }

              




        public  string activationCode { get; set; }}

}

    

