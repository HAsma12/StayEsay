﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayEsay.View.Fournisseur
{
    public partial class commentairesRestaurants : System.Web.UI.Page
    {

        SqlConnection con = Global.connection;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

    }
}