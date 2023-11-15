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
    public partial class informationsRestaurant : System.Web.UI.Page
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
                string Query = "SELECT restaurant.*, Fournisseur.NomComplet FROM restaurant INNER JOIN Fournisseur ON restaurant.Idfournisseur = Fournisseur.Id WHERE restaurant.Idfournisseur = @Idfournisseur";
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Restaurant.DataSource = dt;
                Restaurant.DataBind();
            }
        }


        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string nom = txtnomrestaurant.Value;
                string desc = txtdescription.Value;
                string cuisine = txtcuisine.Value;
                string repas = txtrepas.Value;
                string regimes = txtregimes.Value;
                string adresse = txtAdresse.Value;
                string tel = txtTel.Value;



                byte[] imagerestaurBytes = upload1.FileBytes;
                byte[] imgsupp1Bytes = FileUpload1.FileBytes;
                byte[] imgsupp2Bytes = FileUpload2.FileBytes;
                byte[] imgsupp3Bytes = FileUpload3.FileBytes;
                byte[] imgmenuBytes = FileUpload4.FileBytes;

                int Idfournisseur = Convert.ToInt32(Session["Id"]);

                // Requête SQL d'insertion
                string query = "INSERT INTO [dbo].[restaurant] ([nom], [description], [cuisine], [repas], [regimesspeciaux], [image_restau], [imgsupp1], [imgsupp2], [imgsupp3], [menu], [adresse], [telephone], [Idfournisseur]) VALUES (@nom, @description, @cuisine, @repas, @regimesspeciaux, @image_restau, @imgsupp1, @imgsupp2, @imgsupp3, @menu, @adresse, @telephone, @Idfournisseur)";

                // Création de la commande SQL
                SqlCommand cmd = new SqlCommand(query, con);

                // Ajout des paramètres
                cmd.Parameters.AddWithValue("@nom", nom);
                cmd.Parameters.AddWithValue("@description", desc);
                cmd.Parameters.AddWithValue("@cuisine", cuisine);
                cmd.Parameters.AddWithValue("@repas", repas);
                cmd.Parameters.AddWithValue("@regimesspeciaux", regimes);


                cmd.Parameters.Add("@image_restau", SqlDbType.Binary).Value = imagerestaurBytes;
                cmd.Parameters.Add("@imgsupp1", SqlDbType.Binary).Value = imgsupp1Bytes;
                cmd.Parameters.Add("@imgsupp2", SqlDbType.Binary).Value = imgsupp2Bytes;
                cmd.Parameters.Add("@imgsupp3", SqlDbType.Binary).Value = imgsupp3Bytes;
                cmd.Parameters.Add("@menu", SqlDbType.Binary).Value = imgmenuBytes;
                cmd.Parameters.AddWithValue("@adresse", adresse);
                cmd.Parameters.AddWithValue("@telephone", tel);
                cmd.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);

                int result = cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "Restaurant ajouté avec succès.";

                txtnomrestaurant.Value = "";
                txtdescription.Value = "";
                txtcuisine.Value = "";
                txtrepas.Value = "";
                txtregimes.Value = "";
                txtAdresse.Value = "";
                txtTel.Value = "";
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }



        //protected void deleteBtn_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string nom = txtnomrestaurant.Value;
        //        string Query = "delete from [restaurant] where Idrestaurant = {0} ";
        //        Query = string.Format(Query, Restaurant.SelectedRow.Cells[6].Text);
             
        //        SqlCommand cmd = new SqlCommand(Query, con);
        //        cmd.ExecuteNonQuery();
        //        Showuser();

        //        ErrMsg.InnerText = "Restaurant Supprimé avec succès !!! ";

        //    }
        //    catch (Exception Ex)
        //    {
        //        ErrMsg.InnerText = Ex.Message;
        //    }

        //}




        int key = 0;
        protected void restaurant_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtnomrestaurant.Value = Restaurant.SelectedRow.Cells[7].Text;
            txtdescription.Value = Restaurant.SelectedRow.Cells[8].Text;
            txtcuisine.Value = Restaurant.SelectedRow.Cells[9].Text;
            txtrepas.Value = Restaurant.SelectedRow.Cells[10].Text;
            txtregimes.Value = Restaurant.SelectedRow.Cells[11].Text;
            txtAdresse.Value = Restaurant.SelectedRow.Cells[12].Text;

            if (txtnomrestaurant.Value == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(Restaurant.SelectedRow.Cells[6].Text);

            }
        }


        protected void Restaurant_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image imgFournisseur = e.Row.FindControl("imgfournisseur") as Image;
                if (imgFournisseur != null)
                {
                    object imgObjFournisseur = DataBinder.Eval(e.Row.DataItem, "image_restau");
                    if (imgObjFournisseur != DBNull.Value)
                    {
                        byte[] imgByteFournisseur = (byte[])imgObjFournisseur;
                        string base64StringFournisseur = Convert.ToBase64String(imgByteFournisseur, 0, imgByteFournisseur.Length);
                        imgFournisseur.ImageUrl = "data:image/png;base64," + base64StringFournisseur;
                    }
                    Image img1 = e.Row.FindControl("img1") as Image;
                    if (img1 != null)
                    {
                        object imgObj1 = DataBinder.Eval(e.Row.DataItem, "imgsupp1");
                        if (imgObj1 != DBNull.Value)
                        {
                            byte[] imgByte1 = (byte[])imgObj1;
                            string base64String1 = Convert.ToBase64String(imgByte1, 0, imgByte1.Length);
                            img1.ImageUrl = "data:image/png;base64," + base64String1;
                        }
                    }

                    Image img2 = e.Row.FindControl("img2") as Image;
                    if (img2 != null)
                    {
                        object imgObj2 = DataBinder.Eval(e.Row.DataItem, "imgsupp2");
                        if (imgObj2 != DBNull.Value)
                        {
                            byte[] imgByte2 = (byte[])imgObj2;
                            string base64String2 = Convert.ToBase64String(imgByte2, 0, imgByte2.Length);
                            img2.ImageUrl = "data:image/png;base64," + base64String2;
                        }
                    }

                    Image img3 = e.Row.FindControl("img3") as Image;
                    if (img3 != null)
                    {
                        object imgObj3 = DataBinder.Eval(e.Row.DataItem, "imgsupp3");
                        if (imgObj3 != DBNull.Value)
                        {
                            byte[] imgByte3 = (byte[])imgObj3;
                            string base64String3 = Convert.ToBase64String(imgByte3, 0, imgByte3.Length);
                            img3.ImageUrl = "data:image/png;base64," + base64String3;
                        }
                    }

                    Image menu = e.Row.FindControl("menu") as Image;
                    if (menu != null)
                    {
                        object imgObj3 = DataBinder.Eval(e.Row.DataItem, "menu");
                        if (imgObj3 != DBNull.Value)
                        {
                            byte[] imgBytemenu = (byte[])imgObj3;
                            string base64String3 = Convert.ToBase64String(imgBytemenu, 0, imgBytemenu.Length);
                            menu.ImageUrl = "data:image/png;base64," + base64String3;
                        }
                    }


                }
            }
        }
    }
}