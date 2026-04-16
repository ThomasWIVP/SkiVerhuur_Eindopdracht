using SvLib.DataObjects;
using SvLib.Managers;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EindOpdracht6DAD
{
    public partial class BeheerMateriaal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                vulDropdown();
                ZetFormulierLeeg(); // ⭐ toevoegen
            }
        }

        public void vulDropdown()
        {
            // Materiaaltypes
            var types = ManagerBeheerMateriaal.GetAllTypes()
                            .OrderBy(t => t.Naam).ToList();

            dllMateriaalTypen.DataSource = types;
            dllMateriaalTypen.DataTextField = "Naam";
            dllMateriaalTypen.DataValueField = "Id";
            dllMateriaalTypen.DataBind();

            dllMateriaalTypen.Items.Insert(0, new ListItem("-- Kies type --", "0"));


            // Merken
            var merken = ManagerBeheerMateriaal.GetAllMerken()
                            .OrderBy(m => m.Naam).ToList();

            ddlmerken.DataSource = merken;
            ddlmerken.DataTextField = "Naam";
            ddlmerken.DataValueField = "Id";
            ddlmerken.DataBind();

            ddlmerken.Items.Insert(0, new ListItem("-- Kies merk --", "0"));


            // Materialen leeg bij start
            dllMaterialen.Items.Clear();
        }


        protected void FilterMaterialen(object sender, EventArgs e)
        {
            int typeId = int.Parse(dllMateriaalTypen.SelectedValue);
            int merkId = int.Parse(ddlmerken.SelectedValue);

            // als niets gekozen → stop
            if (typeId == 0 || merkId == 0)
            {
                dllMaterialen.Items.Clear();
                ZetFormulierLeeg();
                return;
            }

            var materialen = ManagerBeheerMateriaal
                                .GetMaterialenByTypeEnMerk(typeId, merkId)
                                .OrderBy(m => m.Model)
                                .ToList();

            dllMaterialen.DataSource = materialen;
            dllMaterialen.DataTextField = "Model";
            dllMaterialen.DataValueField = "Id";
            dllMaterialen.DataBind();

            if (materialen.Count == 0)
            {
                dllMaterialen.Items.Clear(); // ⭐ verplicht
                ZetFormulierLeeg();
            }
            else
            {
                dllMaterialen.SelectedIndex = 0; // ⭐ verplicht
                ToonMateriaal(materialen.First());
            }
        }
        private void ZetFormulierLeeg()
        {
            txtModel.Text = "";
            
            imgFoto.ImageUrl = "Images/no-image-available.png";

            btnFoto.Enabled = false;
            btnVerwijderen.Enabled = false;
        }

        private void ToonMateriaal(Materiaal m)
        {
            txtModel.Text = m.Model;

            if (string.IsNullOrEmpty(m.Foto))
            {
                imgFoto.ImageUrl = "Images/no-image-available.png";
            }
            else
            {
                imgFoto.ImageUrl = ""+ m.Foto;
            }

            btnFoto.Enabled = true;
            btnVerwijderen.Enabled = true;
        }

        protected void btnNieuw_Click(object sender, EventArgs e)
        {
            dllMaterialen.ClearSelection();
            ZetFormulierLeeg();
     
        }

        protected void dllMaterialen_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dllMaterialen.SelectedValue == "0") return;

            int id = int.Parse(dllMaterialen.SelectedValue);

            var materiaal = ManagerBeheerMateriaal.GetMateriaalById(id);

            ToonMateriaal(materiaal);

        }

        protected void btnBewaren_Click(object sender, EventArgs e)
        {
            Materiaal m = new Materiaal();
            if (dllMaterialen.SelectedValue == "")
            {
                m.Id = 0;
            }
            else
            {
                m.Id = Convert.ToInt32(dllMaterialen.SelectedValue);
            }
            m.Model = txtModel.Text;
            m.MerkId = Convert.ToInt32(ddlmerken.SelectedValue);
            m.TypeMateriaalId = Convert.ToInt32(dllMateriaalTypen.SelectedValue);

            ManagerBeheerMateriaal.SaveMateriaal(m);

            btnFoto.Enabled = true;
            btnVerwijderen.Enabled = true;


            txtModel.Text = "";
            lblMessage.Text = "Succesvol bewaard.";
            lblMessage.CssClass = "alert alert-success  w-100 ";


            vulDropdown();


        }

        protected void btnFoto_Click(object sender, EventArgs e)
        {
            if (fuFoto.HasFile)
            {
        
                // bestandsnaam ophalen
                string fileNaam = Path.GetFileName(fuFoto.FileName);
                string ext = Path.GetExtension(fileNaam).ToLower();

                if (ext != ".jpg" && ext != ".png" && ext != ".jpeg")
                {
                    lblMessage.Text = "Alleen afbeeldingen toegestaan.";
                    lblMessage.CssClass = "alert alert-danger  w-100";
                    return;
                }
                // map bepalen
                string map = Server.MapPath("~/Images/products/");

                // map maken als die nog niet bestaat
                if (!Directory.Exists(map))
                {
                    Directory.CreateDirectory(map);
                }

                // volledig pad maken
                string volledigPad = Path.Combine(map, fileNaam);

                // foto opslaan
                fuFoto.SaveAs(volledigPad);

                // pad voor database (met / voor website!)
                string dbPad = "/Images/products/" + fileNaam;

                // database updaten

                try
                {


                    ManagerBeheerMateriaal.UpdateMateriaalFoto(
                        Convert.ToInt32(dllMaterialen.SelectedValue),
                        dbPad
                    );

                    // afbeelding tonen
                    imgFoto.ImageUrl = dbPad;

                    lblMessage.Text = "Foto opgeslagen!";
                    lblMessage.CssClass = "alert alert-success  w-100";


                }
                catch
                {
                    lblMessage.Text = "Foto !";
                    lblMessage.CssClass = "alert alert-danger  w-100";
                }
            }
            else
            {
                lblMessage.Text = "Selecteer eerst een foto.";
                lblMessage.CssClass = "alert alert-warning  w-100";
            }
        }

        protected void btnVerwijderen_Click(object sender, EventArgs e)
        {
            if (dllMaterialen.SelectedValue == "") return;

          
            if (string.IsNullOrEmpty(dllMaterialen.SelectedValue))
            {
                lblMessage.Text = "Selecteer eerst een materiaal.";
                return;
            }

            int id = Convert.ToInt32(dllMaterialen.SelectedValue);

            ManagerBeheerMateriaal.DeleteMateriaal(id);

            lblMessage.Text = "Succesvol verwijderd.";
            lblMessage.CssClass = "alert alert-success w-100";

            vulDropdown();
            ZetFormulierLeeg();
        }
    }
}