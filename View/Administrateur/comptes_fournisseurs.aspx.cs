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
    public partial class comptes_fournisseurs : System.Web.UI.Page
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
            // Récupérez l'ID du fournisseur connecté à partir de la session
            

            string Query = "Select * from [Fournisseur]";
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(dr);
            FournisseurA.DataSource = table;
            FournisseurA.DataBind();
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
                string typeservice = type_service.Value;

                string hashedPassword = HashPassword(mdp);


               
                string query = "INSERT INTO [dbo].[Fournisseur] ([NomComplet], [Email], [Mdp], [tel], [adresse],[typeservice]) VALUES (@NomComplet, @Email, @Mdp, @tel, @adresse , @typeservice)";

                // Création de la commande SQL
                SqlCommand cmd = new SqlCommand(query, con);


                // Ajout des paramètres
                cmd.Parameters.AddWithValue("@NomComplet", nomComplet);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Mdp", hashedPassword);
                cmd.Parameters.AddWithValue("@tel", tel);
                cmd.Parameters.AddWithValue("@Adresse", adresse);
                cmd.Parameters.AddWithValue("@typeservice", typeservice);
             

                int result = cmd.ExecuteNonQuery();

                Showuser();


                ErrMsg.InnerText = "Fournisseur ajouté avec succès.";
                txtNomcomplet.Value = "";
                txtEmail.Value = "";
                txtMdp.Value = "";
                txtTel.Value = "";
                txtAdresse.Value = "";
                type_service.Value = "";
              
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }


        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string nomComplet = txtNomcomplet.Value;
                string email = txtEmail.Value;
                string mdp = txtMdp.Value;
                string tel = txtTel.Value;
                string adresse = txtAdresse.Value;
                string typeservice = type_service.Value;

                string mdpHashed = HashPassword(mdp); 

                string Query = "update [Fournisseur] set NomComplet = '{0}',Email = '{1}',Mdp = '{2}' ,tel = '{3}', adresse ='{4}' , typeservice ='{5}'  where Id = {6} ";
                Query = string.Format(Query, nomComplet, email, mdpHashed , tel, adresse, typeservice, Convert.ToInt32(FournisseurA.SelectedRow.Cells[1].Text));
                // Con.SetData(Query);
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();


                ErrMsg.InnerText = "Fournisseur de service Modifiée avec succès !!! ";

                txtNomcomplet.Value = "";
                txtEmail.Value = "";
                txtMdp.Value = "";
                txtTel.Value = "";
                txtAdresse.Value = "";
                type_service.Value = "";
               

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string nomComplet = txtNomcomplet.Value;
                string Query = "delete from [Fournisseur] where Id = {0} ";
                Query = string.Format(Query, FournisseurA.SelectedRow.Cells[1].Text);
                // Con.SetData(Query);
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "Fournisseur Supprimé avec succès !!! ";

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }


        int key = 0;

        protected void FournisseurA_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNomcomplet.Value = FournisseurA.SelectedRow.Cells[2].Text;
            txtEmail.Value = FournisseurA.SelectedRow.Cells[3].Text;
            txtMdp.Value = FournisseurA.SelectedRow.Cells[4].Text;
            txtTel.Value = FournisseurA.SelectedRow.Cells[5].Text;
            txtAdresse.Value = FournisseurA.SelectedRow.Cells[6].Text;
            type_service.Value = FournisseurA.SelectedRow.Cells[7].Text;
            
            if (txtNomcomplet.Value == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(FournisseurA.SelectedRow.Cells[1].Text);

            }
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
