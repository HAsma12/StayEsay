using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class Informations_hotels : System.Web.UI.Page
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
                string Query = "SELECT hotel.*, Fournisseur.NomComplet FROM hotel INNER JOIN Fournisseur ON hotel.Idfournisseur = Fournisseur.Id WHERE hotel.Idfournisseur = @Idfournisseur";
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                da.SelectCommand.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string nom = txtnomhotel.Value;
                string desc = txtdescription.Value;
                string cat = txtcategorie.Value;
                string adresse = txtAdresse.Value;
                string tel = txtTel.Value;



                byte[] imageHotelBytes = upload1.FileBytes;
                byte[] imgsupp1Bytes = FileUpload1.FileBytes;
                byte[] imgsupp2Bytes = FileUpload2.FileBytes;
                byte[] imgsupp3Bytes = FileUpload3.FileBytes;

                int Idfournisseur = Convert.ToInt32(Session["Id"]);

                // Requête SQL d'insertion
                string query = "INSERT INTO [dbo].[hotel] ([nom], [description], [categorie], [image_hotel], [imgsupp1], [imgsupp2], [imgsupp3], [adresse],[telephone],[Idfournisseur]) VALUES (@nom, @description, @categorie, @image_hotel , @imgsupp1, @imgsupp2, @imgsupp3, @adresse , @telephone, @Idfournisseur )";

            
                SqlCommand cmd = new SqlCommand(query, con);

                // Ajout des paramètres
                cmd.Parameters.AddWithValue("@nom", nom);
                cmd.Parameters.AddWithValue("@description", desc);
                cmd.Parameters.AddWithValue("@categorie", cat);
                cmd.Parameters.Add("@image_hotel", SqlDbType.Binary).Value = imageHotelBytes;
                cmd.Parameters.Add("@imgsupp1", SqlDbType.Binary).Value = imgsupp1Bytes;
                cmd.Parameters.Add("@imgsupp2", SqlDbType.Binary).Value = imgsupp2Bytes;
                cmd.Parameters.Add("@imgsupp3", SqlDbType.Binary).Value = imgsupp3Bytes;
                cmd.Parameters.AddWithValue("@adresse", adresse);
                cmd.Parameters.AddWithValue("@telephone", tel);
                cmd.Parameters.AddWithValue("@Idfournisseur", Idfournisseur);

                int result = cmd.ExecuteNonQuery();
                Showuser();

                ErrMsg.InnerText = "hotel ajouté avec succès.";

                txtnomhotel.Value = "";
                txtdescription.Value = "";
                txtcategorie.Value = "";
                txtAdresse.Value = "";
                txtTel.Value = "";
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }


        protected void hotel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image imgFournisseur = e.Row.FindControl("imgfournisseur") as Image;
                if (imgFournisseur != null)
                {
                    object imgObjFournisseur = DataBinder.Eval(e.Row.DataItem, "image_hotel");
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

               
                }
            }
        }



    }
}
