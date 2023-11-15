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
    public partial class historique : System.Web.UI.Page
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
               
                int Idutilisateur = int.Parse(Session["Id"].ToString());
                string Query = "SELECT  Utilisateur1.Telephone, ReservationTable.* " +
                "FROM ReservationTable " +
                "INNER JOIN Utilisateur1 ON ReservationTable.utilisateurId = Utilisateur1.Id";

                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@utilisateurId", Idutilisateur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        int key = 0;
        protected void historique_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Emplacement = GridView1.SelectedRow.Cells[2].Text;


            if (Radio3.Checked)
            {
                Emplacement = "Zone intérieure";
            }
            else if (Radio4.Checked)
            {
                Emplacement = "Terrasse";
            }
            else if (Radio5.Checked)
            {
                Emplacement = "Balcon";
            }

            txtdate.Value = GridView1.SelectedRow.Cells[3].Text;

            txttime.Value = GridView1.SelectedRow.Cells[4].Text;

           
            txtnbrp.Value = GridView1.SelectedRow.Cells[5].Text;

            txttel.Value = GridView1.SelectedRow.Cells[6].Text;

           
        }

        protected void btnModifier_Click(object sender, EventArgs e)
        {
            try
            {
                string date = txtdate.Value;
                string heure = txttime.Value;
                int nombrePersonnes = Convert.ToInt32(txtnbrp.Value);
                string Emplacement = "";

                if (Radio3.Checked)
                {
                    Emplacement = "Zone intérieure";
                }
                else if (Radio4.Checked)
                {
                    Emplacement = "Terrasse";
                }
                else if (Radio5.Checked)
                {
                    Emplacement = "Balcon";
                }

                int idReservation = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);

                string Query = @"UPDATE [dbo].[ReservationTable]
                         SET [Date] = '{0}', [Temps] = '{1}', [nbrp] = {2}, [Emplacement] = '{3}'
                         FROM [dbo].[ReservationTable] AS R
                         INNER JOIN [dbo].[Utilisateur1] AS U ON R.utilisateurId = U.Id
                         WHERE R.IdReservation = {4}";

                Query = string.Format(Query, date, heure, nombrePersonnes, Emplacement, idReservation);

                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();

                Showuser();
                ErrMsg.InnerText = "Réservation modifiée avec succès !";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {

                string Query = "delete from [ReservationTable] where IdReservation = {0} ";
                Query = string.Format(Query, GridView1.SelectedRow.Cells[1].Text);
             
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "reservation Supprimé avec succès !!! ";

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }
                
    }
}