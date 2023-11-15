using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace StayEsay.View.Fournisseur
{
    public partial class ImagesServices : System.Web.UI.Page
    {
        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            Aff_img();
        }
       
        public void Aff_img()
        {
            String SQL;
            SQL = "select * from tblimg";

            DataTable dtbl = new DataTable();
            SqlDataAdapter mySqDataReader = new SqlDataAdapter(SQL, con);
            mySqDataReader.Fill(dtbl);

            ImageGridView.DataSource = dtbl;
            ImageGridView.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Requête SQL d'insertion
            string query = "insert into tblimg values(@imgName,@imgPath) ";

            // Création de la commande SQL
            SqlCommand cmd = new SqlCommand(query, con);


            if (FileUpload1.HasFiles)
            {
                foreach (HttpPostedFile fu in FileUpload1.PostedFiles)
                {
                     

                    string path = "~/SavedImages/" + fu.FileName;
                          
                    cmd.Parameters.AddWithValue("@imgName", fu.FileName);
                    cmd.Parameters.AddWithValue("@imgPath", path);


                    // Exécution de la commande SQL
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        FileUpload1.SaveAs(Server.MapPath(Path.Combine("~/SavedImages/", fu.FileName)));
                        Label.Text += string.Format("{0}<br>", fu.FileName + " Uploaded and save to Database");
                        cmd.Parameters.Clear();
                    }
                }
            }
            else
            {
                Label.Text ="select a file first";

            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string imgName = DataBinder.Eval(e.Row.DataItem, "imgName").ToString();
                string imgPath = DataBinder.Eval(e.Row.DataItem, "imgPath").ToString();

                if (!string.IsNullOrEmpty(imgName) && !string.IsNullOrEmpty(imgPath))
                {
                    string imageUrl = string.Format("{0}/{1}", imgPath, imgName);
                    (e.Row.FindControl("imgfournisseur") as Image).ImageUrl = imageUrl;
                }
            }
        }

    }


}