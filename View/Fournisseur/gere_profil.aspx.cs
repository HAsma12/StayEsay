using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace StayEsay.View.Fournisseur
{
    public partial class gere_profil : System.Web.UI.Page
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
                
                int Idfournisseur = int.Parse(Session["Id"].ToString());
                string Query = "SELECT * FROM Fournisseur WHERE Id = @Idfournisseur";
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                FournisseurA.DataSource = dt;
                FournisseurA.DataBind();

            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                string nomComplet = txtNomcomplet.Value;
                string email = txtEmail.Value;
                string mdp = txtMdp.Value;
                string tel = txttel.Value;
                string adresse = txtadresse.Value;
                string typeservice = type_service.Value;
               
              


                string Query = "update [Fournisseur] set NomComplet = '{0}',Email = '{1}',Mdp = '{2}' ,tel = '{3}', adresse ='{4}' , typeservice ='{5}'  where Id = {6} ";
                Query = string.Format(Query, nomComplet, email, mdp, tel, adresse, typeservice, Convert.ToInt32(FournisseurA.SelectedRow.Cells[1].Text));

                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = " profoil Modifiée avec succès  !!! ";
                txtNomcomplet.Value = "";
                txtEmail.Value = "";
                txtMdp.Value = "";
                txttel.Value = "";
                txtadresse.Value = "";
                type_service.Value = "";
               
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
            txttel.Value = FournisseurA.SelectedRow.Cells[5].Text;
            txtadresse.Value = FournisseurA.SelectedRow.Cells[6].Text;
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
       

     
    }
}