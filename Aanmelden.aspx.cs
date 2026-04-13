using SvLib.Managers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using SvLib.DataObjects;


namespace EindOpdracht6DAD
{
    public partial class Aanmelden : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void a_txtGnaam_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAanmelden_Click(object sender, EventArgs e)
        {
            bool res = ManagerLogin.CheckLogin(a_txtGnaam.Text, a_txtWachtwoord.Text);
            if (!res)
            {
                lblMessage.Text = "Deze combinatie gebruikersnaam - wachtwoord is niet gekend.";
                lblMessage.CssClass = "alert alert-danger  w-100 ";
            }
            else
            {
                lblMessage.Text = "Je bent succesvol aangemeld";
                lblMessage.CssClass = "alert alert-success  w-100 ";


                Response.Redirect("DefaultAangemeld.aspx");
            }
        }
    }
    }
