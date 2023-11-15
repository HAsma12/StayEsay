using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Administrateur
{
    public partial class administrateurMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       

            if (!IsPostBack)
            {
                if (Session["Id"] == null )
                {
                    // L'utilisateur a accès à cette page réservée aux administrateurs
                    Response.Redirect("/View/Login.aspx");
                }

            }
          

            

        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Supprimer la session
            Session.Abandon();

            // Redirection POST vers la page de connexion
            Response.Clear();
            Response.Write("<html><head>");
            Response.Write("<script language='javascript'>window.location.href='/View/Login.aspx';</script>");
            Response.Write("</head><body></body></html>");
            Response.End();
        }




       
    }
}
