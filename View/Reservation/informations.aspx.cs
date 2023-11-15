using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Reservation
{
    public partial class informations : System.Web.UI.Page
    {

        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            Showuser();
        }

        private void Showuser()
        {
            if (Session["Id"] != null)
            {
                //int Idfournisseur = int.Parse(Session["Id"].ToString());
                int Idutilisateur = int.Parse(Session["Id"].ToString());
                string Query = "SELECT * FROM Utilisateur1 WHERE Id = @Idutilisateur";
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idutilisateur", Idutilisateur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                utilisateur.DataSource = dt;
                utilisateur.DataBind();

            }
        }

        int key = 0;

        protected void utilisateur_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNomcomplet.Value = utilisateur.SelectedRow.Cells[2].Text;
            txtEmail.Value = utilisateur.SelectedRow.Cells[3].Text;
            txtMdp.Value = utilisateur.SelectedRow.Cells[4].Text;
            txttel.Value = utilisateur.SelectedRow.Cells[5].Text;
            txtadresse.Value = utilisateur.SelectedRow.Cells[6].Text;

            if (txtNomcomplet.Value == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(utilisateur.SelectedRow.Cells[1].Text);

            }
        }


        protected void edit_Click(object sender, EventArgs e)
        {
            try
            {
                string nomComplet = txtNomcomplet.Value;
                string email = txtEmail.Value;
                string mdp = txtMdp.Value;
                string tel = txttel.Value;
                string adresse = txtadresse.Value;

                string Query = "update [Utilisateur1] set NomComplet = '{0}',Email = '{1}',Mdp = '{2}' ,Telephone = '{3}', Adresse ='{4}'  where Id = {5} ";
                Query = string.Format(Query, nomComplet, email, mdp, tel, adresse, Convert.ToInt32(utilisateur.SelectedRow.Cells[1].Text));
                // Con.SetData(Query);
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();


                ErrMsg.InnerText = "Utilisateur Modifiée avec succès !!! ";

                txtNomcomplet.Value = "";
                txtEmail.Value = "";
                txtMdp.Value = "";
                txttel.Value = "";
                txtadresse.Value = "";




            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}