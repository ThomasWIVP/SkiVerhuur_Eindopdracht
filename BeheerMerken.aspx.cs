using SvLib.DataObjects;
using SvLib.Managers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EindOpdracht6DAD
{
    public partial class BeheerMerken : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                vulDropdown();
                ddlMerk.SelectedIndex = 0;
               
            }
        }


        public void vulDropdown()
        {
            ddlMerk.Items.Clear();   // ⭐ toevoegen



            var merken = ManagerBeheerMerken.GetAllMerken();

            ddlMerk.DataSource = merken;


            ddlMerk.DataTextField = "Naam";
            ddlMerk.DataValueField = "Id";

            ddlMerk.DataBind();
            ddlMerk.Items.Insert(0, new ListItem("-- Kies merk --", "0"));
        }

        protected void ddlMerk_SelectedIndexChanged(object sender, EventArgs e)
        {
            ToonMerk();





        }


        //staat appart omdat je het bij het laden van het scherm het er ook al moet staat zie page_load
        private void ToonMerk()
        {
            if (ddlMerk.SelectedValue == "0")
            {
                txtNaam.Text = "";
                return;
            }

            int id = Convert.ToInt32(ddlMerk.SelectedValue);

            var merk = ManagerBeheerMerken.GetAllMerkenById(id);

            if (merk == null)// hierdoor kan ik een -- kies merk --- toevoegen
            {
                txtNaam.Text = "";
                return;
            }

            txtNaam.Text = merk.Naam;
        }

        protected void btnNieuw_Click(object sender, EventArgs e)
        {
            txtNaam.Text = "";
            //ddlMerk.Enabled = false;
            ddlMerk.SelectedIndex = 0;
        }

        protected void btnBewaren_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtNaam.Text))
                {
                    lblMessage.Text = "Vul de gegevens in!";
                    lblMessage.CssClass = "alert alert-warning  w-100 ";
                    return;
                }

                var merk = new Merk
                {
                    Naam = txtNaam.Text
                };

                if (ddlMerk.SelectedValue != "0")
                {
                    // UPDATE
                    merk.Id = Convert.ToInt32(ddlMerk.SelectedValue);
                    ManagerBeheerMerken.UpdateMerken(merk);
                    lblMessage.Text = "Merk aangepast!";
                    lblMessage.CssClass = "alert alert-success  w-100 ";
                }
                else
                {
                    // INSERT
                    ManagerBeheerMerken.CreateMerk(merk);
                    lblMessage.Text = "Merk toegevoegd!";
                    lblMessage.CssClass = "alert alert-success  w-100 ";
                }

                //   UI reset 
                vulDropdown();
                ddlMerk.SelectedIndex = 0;
                txtNaam.Text = "";
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627 || ex.Number == 2601)
                {
                    lblMessage.Text = "Dit merk bestaat al.";
                    lblMessage.CssClass = "alert alert-warning  w-100 ";
                }
                else
                {
                    lblMessage.Text = "Database fout.";
                    lblMessage.CssClass = "alert alert-success  w-100 ";
                    throw;
                }
            }
        }

        protected void btnVerwijderen_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlMerk.SelectedValue == "0")
                {
                    lblMessage.Text = "Kies eerst een merk!";
                    lblMessage.CssClass = "alert alert-warning  w-100 ";
                    return;
                }

                int id = Convert.ToInt32(ddlMerk.SelectedValue);

                ManagerBeheerMerken.DeleteMerk(id);
                lblMessage.Text = "Merk is succesvol verwijderd.";
                lblMessage.CssClass = "alert alert-success  w-100 ";

                txtNaam.Text = "";
                vulDropdown();
                ddlMerk.SelectedIndex = 0;
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Kan merk niet verwijderen.";
                lblMessage.CssClass = "alert alert-danger  w-100 ";
            }

        }
    }
}

