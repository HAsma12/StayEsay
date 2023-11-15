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
    public partial class tablerestaurant : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadRestaurants(); 
            }

            Showuser();
        }


        private void LoadRestaurants()
        {
            int fournisseurId = Convert.ToInt32(Session["Id"]); 

            string query = "SELECT Idrestaurant , nom FROM [dbo].[restaurant] WHERE Idfournisseur = @Idfournisseur";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Idfournisseur", fournisseurId);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    int restaurantId = reader.GetInt32(0);
                    string restaurantNom = reader.GetString(1);

                    ddlRestaurant.Items.Add(new ListItem(restaurantNom, restaurantId.ToString()));
                }
            }
        }

        private void Showuser()
        {
            if (Session["Id"] != null)
            {
   
                int Idfournisseur = int.Parse(Session["Id"].ToString());
                string Query = "SELECT tablerestaurant.*, Fournisseur.NomComplet  FROM tablerestaurant INNER JOIN Fournisseur ON tablerestaurant.Idfournisseur = Fournisseur.Id WHERE tablerestaurant.Idfournisseur = @Idfournisseur";
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Table.DataSource = dt;
                Table.DataBind();
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string numeroTable = txtNumerotable.Value;
                string capacite = txtCapacite.Value;

                string etat = "";
                if (Radio1.Checked)
                {
                    etat = "Libre";
                }
                else if (Radio2.Checked)
                {
                    etat = "Réservée";

                   
               if (string.IsNullOrEmpty(txtdate.Value) || string.IsNullOrEmpty(heureDebut.Value) || string.IsNullOrEmpty(heureFin.Value))
                    {
                        ErrMsg.InnerText = "Veuillez remplir tous les champs pour une réservation.";
                        return; 
                    }
                }


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





                string date = txtdate.Value;
                string debut = heureDebut.Value;
                string fin = heureFin.Value;
                string description = txtDescription.Value;

            

                int restaurantId = Convert.ToInt32(ddlRestaurant.SelectedValue);


                string query = "INSERT INTO [dbo].[tablerestaurant] ([Numerotable], [Capacité], [Emplacement], [etat],[Date], [heuredebut],[heurefin], [Description],  [Idfournisseur] , [restaurantId]) VALUES (@Numerotable, @Capacité, @Emplacement, @etat, @Date,@heuredebut,@heurefin, @Description,  @Idfournisseur , @restaurantId)";


                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Numerotable", numeroTable);
                cmd.Parameters.AddWithValue("@Capacité", capacite);
                cmd.Parameters.AddWithValue("@Emplacement", Emplacement); 
                cmd.Parameters.AddWithValue("@etat", etat);
                cmd.Parameters.AddWithValue("@Date", date);
                cmd.Parameters.AddWithValue("@heureDebut", debut);
                cmd.Parameters.AddWithValue("@heureFin", fin);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Idfournisseur", Convert.ToInt32(Session["Id"])); 
                cmd.Parameters.AddWithValue("@restaurantId", Convert.ToInt32(ddlRestaurant.SelectedValue));

                int result = cmd.ExecuteNonQuery();
                Showuser();
                ErrMsg.InnerText = "Table ajoutée avec succès.";
              
                txtNumerotable.Value = "";
                txtCapacite.Value = "";
                Radio1.Checked = false;
                Radio2.Checked = false;
                Radio3.Checked = false;
                Radio4.Checked = false;
                Radio5.Checked = false;
                txtDescription.Value = "";

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
                string numeroTable = txtNumerotable.Value;
                string capacite = txtCapacite.Value;
                string etat = "";
                if (Radio1.Checked)
                {
                    etat = "Libre";
                }
                else if (Radio2.Checked)
                {
                    etat = "Réservée";

                    // Vérifier si l'état est "Réservée" et si les champs "heure de début" et "heure de fin" sont remplis
                    if (string.IsNullOrEmpty(heureDebut.Value) || string.IsNullOrEmpty(heureFin.Value) || string.IsNullOrEmpty(txtdate.Value))
                    {
                        ErrMsg.InnerText = "Veuillez remplir tous les champs pour une réservation.";
                        return; // Sortir de la méthode sans effectuer la modification dans la base de données
                    }
                }

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
                string debut = heureDebut.Value;
                string fin = heureFin.Value;
                string description = txtDescription.Value;

                string Query = "UPDATE [tablerestaurant] SET Numerotable = '{0}', Capacité = '{1}', Emplacement = '{2}', etat = '{3}', heuredebut = '{4}', heurefin = '{5}', Description = '{6}' WHERE Idtable = {7} ";
                Query = string.Format(Query, numeroTable, capacite, Emplacement, etat, debut, fin, description, Convert.ToInt32(Table.SelectedRow.Cells[1].Text));

                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "Table Modifiée avec succès !!! ";

                txtNumerotable.Value = "";
                txtCapacite.Value = "";
                Radio1.Checked = false;
                Radio2.Checked = false;
                Radio3.Checked = false;
                Radio4.Checked = false;
                Radio5.Checked = false;
                txtDescription.Value = "";
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
                string numeroTable = txtNumerotable.Value;
                string Query = "delete from [tablerestaurant] where Idtable = {0} ";
                Query = string.Format(Query, Table.SelectedRow.Cells[1].Text);
              
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "Table Supprimé avec succès !!! ";

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }

        protected void Table_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNumerotable.Value = Table.SelectedRow.Cells[2].Text;
            txtCapacite.Value = Table.SelectedRow.Cells[3].Text;
            string etat = Table.SelectedRow.Cells[5].Text;

            if (etat == "Libre")
            {
                Radio1.Checked = true;
            }
            else if (etat == "Réservée")
            {
                Radio2.Checked = true;
            }
            else
            {
                Radio1.Checked = false;
                Radio2.Checked = false;
            }

            string Emplacement = Table.SelectedRow.Cells[4].Text;

            if (Emplacement == "Zone intérieure")
            {
                Radio3.Checked = true;
            }
            else if (Emplacement == "Terrasse")
            {
                Radio4.Checked = true;
            }
            else if (Emplacement == "Balcon")
            {
                Radio5.Checked = true;
            }
            else
            {
                Radio3.Checked = false;
                Radio4.Checked = false;
                Radio5.Checked = false;

            }
            heureDebut.Value = Table.SelectedRow.Cells[6].Text;
            heureFin.Value = Table.SelectedRow.Cells[6].Text;
            txtDescription.Value = Table.SelectedRow.Cells[7].Text;


        }

    }
}