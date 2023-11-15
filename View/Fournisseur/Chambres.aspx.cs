using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class Chambres : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Loadhotels(); // Appel de la méthode pour charger les restaurants du fournisseur
            }
            Showuser();
        }
        private void Showuser()
        {
            if (Session["Id"] != null)
            {
                int Idfournisseur = int.Parse(Session["Id"].ToString());
                string query = "SELECT Chambre.*, Fournisseur.NomComplet, hotel.nom AS NomHotel FROM Chambre INNER JOIN Fournisseur ON Chambre.Idfournisseur = Fournisseur.Id INNER JOIN hotel ON Chambre.Idhotel = hotel.Idhotel WHERE Chambre.Idfournisseur = @Idfournisseur";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ChambresGrid.DataSource = dt;
                ChambresGrid.DataBind();
            }
        }

        private void Loadhotels()
        {
            int fournisseurId = Convert.ToInt32(Session["Id"]); 

            string query = "SELECT Idhotel , nom FROM [dbo].[hotel] WHERE Idfournisseur = @Idfournisseur";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Idfournisseur", fournisseurId);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    int Idhotel = reader.GetInt32(0);
                    string nom = reader.GetString(1);

                    ddlhotel.Items.Add(new ListItem(nom, Idhotel.ToString()));
                }
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            int nombreChambre = Convert.ToInt32(txtChNum.Value);

            string type = txttype.Value;
            string vue = txtvue.Value;

            decimal prixParNuit = Convert.ToDecimal(txtPrix.Value);

            int Idfournisseur = Convert.ToInt32(Session["Id"]);
         

            int Idhotel = Convert.ToInt32(ddlhotel.SelectedValue);


            string query = "INSERT INTO [dbo].[Chambre] ([nombrechambre],[type], [vue], [prix] ,[Idfournisseur],[Idhotel]) VALUES (@nombrechambre ,@type, @vue, @prix , @Idfournisseur , @Idhotel)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@nombrechambre", nombreChambre);
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@vue", vue);
            cmd.Parameters.AddWithValue("@prix", prixParNuit);
           
            cmd.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
            cmd.Parameters.AddWithValue("@Idhotel", Idhotel);



            int rowsAffected = cmd.ExecuteNonQuery();

            Showuser();

            if (rowsAffected > 0)
            {

                ErrMsg.InnerText = "Chambre ajoutée avec succès !";
            }
            else
            {

                ErrMsg.InnerText = "Erreur lors de l'ajout de la chambre.";
            }

        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                int nombreChambre;
                if (!int.TryParse(txtChNum.Value, out nombreChambre))
                {
                    ErrMsg.InnerText = "Le nombre de chambre n'est pas un format numérique valide.";
                    return;
                }

                string type = txttype.Value;
                string vue = txtvue.Value;

                decimal prixParNuit;
                if (!decimal.TryParse(txtPrix.Value, out prixParNuit))
                {
                    ErrMsg.InnerText = "Le prix par nuit n'est pas un format numérique valide.";
                    return;
                }

                string Query = "UPDATE [Chambre] SET nombrechambre = @nombreChambre, type = @type, vue = @vue, prix = @prixParNuit WHERE IdCH = @chambreId";

                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@nombreChambre", nombreChambre);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@vue", vue);
                    cmd.Parameters.AddWithValue("@prixParNuit", prixParNuit);
                    cmd.Parameters.AddWithValue("@chambreId", Convert.ToInt32(ChambresGrid.SelectedRow.Cells[1].Text));

                    cmd.ExecuteNonQuery();
                }

                Showuser();
                ErrMsg.InnerText = "Chambre modifiée avec succès !";
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
                string numerochambre = txtChNum.Value;
                string Query = "delete from [Chambre] where IdCH = {0} ";
                Query = string.Format(Query, ChambresGrid.SelectedRow.Cells[1].Text);
                // Con.SetData(Query);
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = " Chambre  Supprimé avec succès !!! ";

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }


    
        protected void ChambresGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtChNum.Value = ChambresGrid.SelectedRow.Cells[2].Text;
            txttype.Value = ChambresGrid.SelectedRow.Cells[3].Text;
            txtvue.Value = ChambresGrid.SelectedRow.Cells[4].Text;

          
            txtPrix.Value = ChambresGrid.SelectedRow.Cells[5].Text;

        }


       

    }
}
