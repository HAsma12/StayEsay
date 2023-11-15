using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class repashotel : System.Web.UI.Page
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

                string Query = "SELECT Repashotel.*, Fournisseur.NomComplet FROM Repashotel INNER JOIN Fournisseur ON Repashotel.Idfournisseur = Fournisseur.Id WHERE Repashotel.Idfournisseur = @Idfournisseur";
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                repas.DataSource = dt;
                repas.DataBind();
            }
        }
        protected void AddBtn_Click(object sender, EventArgs e)
        {
            string nomRepas = txtnomrepas.Value;
            decimal tarif = decimal.Parse(txttarif.Value);



            try
            {

                int Idfournisseur = Convert.ToInt32(Session["Id"]);
         
                SqlCommand cmd = new SqlCommand("INSERT INTO Repashotel (NomRepas, Tarif ,Idfournisseur) VALUES (@NomRepas, @Tarif,@Idfournisseur)", con);
                cmd.Parameters.AddWithValue("@NomRepas", nomRepas);
                cmd.Parameters.AddWithValue("@Tarif", tarif);
                cmd.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);

            
                cmd.ExecuteNonQuery();
                Showuser();

              
                ErrMsg.InnerText = "Succès ! Le repas a été enregistré avec succès";

            }

            catch (Exception ex)
            {
               
                Label1.InnerText = "Oups ! Nous avons rencontré un problème lors de l'enregistrement du repas";
            }

        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                int idTarifRepas = Convert.ToInt32(Request.QueryString["id"]);
                string nomRepas = txtnomrepas.Value;
                decimal tarif = decimal.Parse(txttarif.Value);

                string query = "UPDATE [Repashotel] SET NomRepas = '{0}', Tarif = '{1}' WHERE IdTarifRepas = {2}";
                query = string.Format(query, nomRepas, tarif, idTarifRepas);

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "Les données ont été modifiées avec succès !";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }



        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                string nomRepas = txtnomrepas.Value;
                string Query = "delete from [TarifsRepas] where IdTarifRepas = {0} ";
                Query = string.Format(Query, repas.SelectedRow.Cells[1].Text);

                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "repas Supprimé avec succès !!! ";

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }

        protected void repas_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtnomrepas.Value = repas.SelectedRow.Cells[2].Text;
            txttarif.Value = repas.SelectedRow.Cells[3].Text;
        }
    }
}