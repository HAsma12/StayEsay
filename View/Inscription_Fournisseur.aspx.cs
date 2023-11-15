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
    public partial class Inscription_Fournisseur : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDevenirFournisseur_Click(object sender, EventArgs e)
        {
            try
            {
                string nomComplet = fournisseur_txtNomcomplet.Value;
                string email = fournisseur_txtEmail.Value;
                string mdp = fournisseur_txtMdp.Value;
                string tel = fournisseur_txtTel.Value;
                string adresse = fournisseur_txtAdresse.Value;
                string typeservice = type_service.Value;

                // Générer le code d'activation
                string activationCode = GenerateActivationCode();

                string hashedPassword = HashPassword(mdp);

                // Requête SQL d'insertion
                string query = "INSERT INTO [dbo].[Fournisseur] ([NomComplet], [Email], [Mdp], [tel], [adresse],[typeservice], [ActivationCode]) VALUES (@NomComplet, @Email, @Mdp, @tel, @adresse , @typeservice ,@ActivationCode)";

                // Création de la commande SQL
                SqlCommand cmd = new SqlCommand(query, con);
                // Ajout des paramètres
                cmd.Parameters.AddWithValue("@NomComplet", nomComplet);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Mdp", hashedPassword);
                cmd.Parameters.AddWithValue("@tel", tel);
                cmd.Parameters.AddWithValue("@Adresse", adresse);
                cmd.Parameters.AddWithValue("@typeservice", typeservice);
                cmd.Parameters.AddWithValue("@ActivationCode", activationCode);


                int result = cmd.ExecuteNonQuery();

                //// Envoyer le code d'activation par e-mail à l'utilisateur
                SendActivationCodeByEmail(email, activationCode);

                //// Rediriger l'utilisateur vers une page où il peut entrer le code d'activation
                Response.Redirect("CodeActivationF.aspx?email=" + email);


                Label1.InnerText = "Fournisseur ajouté avec succès.";

                fournisseur_txtNomcomplet.Value = "";
                fournisseur_txtEmail.Value = "";
                fournisseur_txtMdp.Value = "";
                fournisseur_txtTel.Value = "";
                fournisseur_txtAdresse.Value = "";
                type_service.Value = "";


            }
            catch (Exception Ex)
            {
                Label1.InnerText = Ex.Message;
            }


        }

        private bool IsEmailAlreadyUsed(string email)
        {
            string query = "SELECT COUNT(*) FROM [dbo].[Fournisseur] WHERE [Email] = @Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            int count = (int)cmd.ExecuteScalar();
            return count > 0;
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
            mailMessage.Body = "Your activation code is: " + activationCode;

            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential("stayesay16@gmail.com", "rvruaxexihmtyicy");
            smtpClient.EnableSsl = true;

            // Send the email
            smtpClient.Send(mailMessage);
        }

        //protected void ButtonRedirection_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/View/Inscription.aspx");
        //}
              
    }
}