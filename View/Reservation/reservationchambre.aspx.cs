using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Reservation
{
    public partial class reservationchambre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReserver_Click(object sender, EventArgs e)
        {
          
            string dateDebut = txtDateDebut.Value;
            string dateFin = txtDateFin.Value;
            string typeChambre = ddlTypeChambre.SelectedValue;

            // Stocker les valeurs dans une session pour les transmettre à la page suivante
            Session["DateDebut"] = dateDebut;
            Session["DateFin"] = dateFin;
            Session["TypeChambre"] = typeChambre;

            // Rediriger l'utilisateur vers la page affichant les chambres disponibles
            Response.Redirect("ChambresDisponibles.aspx?dateDebut=" + dateDebut + "&dateFin=" + dateFin + "&typeChambre=" + typeChambre);
        }



    }
}