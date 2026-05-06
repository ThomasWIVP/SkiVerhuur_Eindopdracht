using SvLib.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EindOpdracht6DAD
{
    public partial class BeheerMaten : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                vullDropdown_MateriaalType();
                vullDropdown_Merk();


                if (Request.QueryString["id"] != null)
                {
                    int maatId = int.Parse(Request.QueryString["id"]);
                    laadMaat(maatId);
                }


            }
        }

//        bij stap 3:En zetten we het formulier uit voor nieuwe invoer.Dit betekent dat
//alle knoppen gedisabled worden. moet nog afgewerkt worden.




        public void vullDropdown_MateriaalType ()
        {
            var types = ManagerBeheerMateriaal.GetAllTypes()
                           .OrderBy(t => t.Naam).ToList();

            dllMateriaalTypena.DataSource = types;
            dllMateriaalTypena.DataTextField = "Naam";
            dllMateriaalTypena.DataValueField = "Id";
            dllMateriaalTypena.DataBind();

            dllMateriaalTypena.Items.Insert(0, new ListItem("-- Kies type --", "0"));
        }
        public void vullDropdown_Merk()
        {
            var merken = ManagerBeheerMerken.GetAllMerken()
                           .OrderBy(t => t.Naam).ToList();

            ddlmerken.DataSource = merken;
            ddlmerken.DataTextField = "Naam";
            ddlmerken.DataValueField = "Id";
            ddlmerken.DataBind();

            ddlmerken.Items.Insert(0, new ListItem("-- Kies merk --", "0"));
        }

        protected void ddlmerken_SelectedIndexChanged(object sender, EventArgs e)
        {
            int typeId = int.Parse(dllMateriaalTypena.SelectedValue);
            int merkId = int.Parse(ddlmerken.SelectedValue);


            if (typeId == 0 || merkId == 0)
            {
                dllMaterialen.Items.Clear();
               
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
                
            }
            else
            {
                dllMaterialen.SelectedIndex = 0; // ⭐ verplicht
               
            }
        }


        private void laadMaat(int maatId)
        {
            var maat = ManagerBeheerMaten.GetMaatById(maatId);

            if (maat != null)
            {
                txtMaat.Text = maat.Id.ToString();
                txtNaam.Text = maat.Name;

                btnUpdatenA.Enabled = true;
                btnVerwijderenA.Enabled = true;
            }
        }

        protected void dllMaterialen_SelectedIndexChanged(object sender, EventArgs e)
        {
            int materiaalId = int.Parse(dllMaterialen.SelectedValue);

            var maten = ManagerBeheerMaten.GetMatenByMateriaal(materiaalId);

            rptMaten.DataSource = maten;
            rptMaten.DataBind();
        }
    }
}