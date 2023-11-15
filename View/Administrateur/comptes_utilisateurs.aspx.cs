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
using System.Data;

namespace StayEsay.View.Administrateur
{
    public partial class comptes_utilisateurs : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {

            Showuser();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        private void Showuser()
        {
            string Query = "Select * from [Utilisateur1]";
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(dr);
            UtilisateurA.DataSource = table;
            UtilisateurA.DataBind();
            dr.Close();
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {

                string email = txtEmail.Value;
                string mdp = txtMdp.Value;
                string tel = txtTel.Value;
                string adresse = txtAdresse.Value;
                string nomComplet = txtNomcomplet.Value;


                if (IsEmailAlreadyUsed(email))
                {
                    ErrMsg.InnerText = "Cet e-mail est déjà utilisé. Veuillez utiliser une autre adresse e-mail.";
                    return;
                }


                string hashedPassword = HashPassword(mdp);

              
                string query = "INSERT INTO [dbo].[Utilisateur1] ([NomComplet], [Email], [Mdp], [Telephone], [Adresse]) VALUES (@NomComplet, @Email, @Mdp, @Telephone, @Adresse)";

                // Création de la commande SQL
                SqlCommand cmd = new SqlCommand(query, con);


              
                cmd.Parameters.AddWithValue("@NomComplet", nomComplet);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Mdp", hashedPassword);
                cmd.Parameters.AddWithValue("@Telephone", tel);
                cmd.Parameters.AddWithValue("@Adresse", adresse);

                int result = cmd.ExecuteNonQuery();
               


                ErrMsg.InnerText = "Utilisateur ajouté avec succès.";
                txtNomcomplet.Value = "";
                txtEmail.Value = "";
                txtMdp.Value = "";
                txtTel.Value = "";
                txtAdresse.Value = "";

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }


        }
        protected void edit_Click(object sender, EventArgs e)
        {
            try
            {
                string nomComplet = txtNomcomplet.Value;
                string email = txtEmail.Value;
                string mdp = txtMdp.Value; // Mot de passe non hashé
                string tel = txtTel.Value;
                string adresse = txtAdresse.Value;

                // Hasher le nouveau mot de passe
                string mdpHashed = HashPassword(mdp); // Remplacez HashPassword par la fonction de hachage appropriée

                string Query = "update [Utilisateur1] set NomComplet = '{0}',Email = '{1}',Mdp = '{2}' ,Telephone = '{3}', Adresse ='{4}'  where Id = {5} ";
                Query = string.Format(Query, nomComplet, email, mdpHashed, tel, adresse, Convert.ToInt32(UtilisateurA.SelectedRow.Cells[1].Text));

                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "Utilisateur Modifié avec succès !!! ";

                txtNomcomplet.Value = "";
                txtEmail.Value = "";
                txtMdp.Value = "";
                txtTel.Value = "";
                txtAdresse.Value = "";
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }


         protected void Delete_Click(object sender, EventArgs e)
         {
             try
             {
                 string nomComplet = txtNomcomplet.Value;
                 string Query = "delete from [Utilisateur1] where Id = {0} ";
                 Query = string.Format(Query, UtilisateurA.SelectedRow.Cells[1].Text);
              
                 SqlCommand cmd = new SqlCommand(Query, con);
                 cmd.ExecuteNonQuery();
                 Showuser();

                 ErrMsg.InnerText = "Utilisateur Supprimé avec succès !!! ";

             }
             catch (Exception Ex)
             {
                 ErrMsg.InnerText = Ex.Message;
             }

         }

        int key = 0;
        protected void UtilisateurA_SelectedIndexChanged(object sender, EventArgs e)
        {
             txtNomcomplet.Value = UtilisateurA.SelectedRow.Cells[2].Text;
        txtEmail.Value = UtilisateurA.SelectedRow.Cells[3].Text;
        txtMdp.Value = UtilisateurA.SelectedRow.Cells[4].Text;
        txtTel.Value = UtilisateurA.SelectedRow.Cells[5].Text;
        txtAdresse.Value = UtilisateurA.SelectedRow.Cells[6].Text;

        if (txtNomcomplet.Value == "")
        {
            key = 0;
        }
        else
        {
            key = Convert.ToInt32(UtilisateurA.SelectedRow.Cells[1].Text);

        }
    }




        private bool IsEmailAlreadyUsed(string email)
        {
            string query = "SELECT COUNT(*) FROM [dbo].[Utilisateur1] WHERE [Email] = @Email";
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
   
        }
    }
