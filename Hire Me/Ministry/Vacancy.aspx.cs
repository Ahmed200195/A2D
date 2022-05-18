using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.MInistry
{
    public partial class Vacancy : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Ministry"] == null)
                {
                    Response.Redirect("~/Home/SignIn.aspx");
                }
                if (Option_CrtVacUpd.SelectedIndex.Equals(0))
                {
                    btnAddVac.Enabled = btnAddVac.Visible = true;
                    btnUpdVac.Enabled = btnUpdVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = false;
                    int vc = int.Parse(Request.QueryString["VacCond"]);
                    if (vc == 0)
                    {
                        tlpage.InnerText = "Vacancy";
                        tlPost.InnerText = "الشواغر";
                        lp_Univ_Vac.Text = "الاختصاص : ";
                        lp_Vtype_Cname.Text = "النوع : ";
                        lp_avg_ctype.Text = "المعدل : ";
                        txtAvg.Visible = TypeVac.Enabled = TypeVac.Visible = txtAvg.Enabled = true;
                        txtCname.Enabled = TypeCond.Enabled = txtCname.Visible = TypeCond.Visible = false;
                    }
                    else if (vc == 1)
                    {
                        tlpage.InnerText = "Vacancy Condition";
                        tlPost.InnerText = "الشروط";
                        lp_Univ_Vac.Text = "الشاغر : ";
                        lp_Vtype_Cname.Text = "اسم الشرط : ";
                        lp_avg_ctype.Text = "النوع : ";
                        txtCname.Enabled = TypeCond.Enabled = txtCname.Visible = TypeCond.Visible = true;
                        lpCnt.Enabled = txtCnt.Enabled = lpCnt.Visible = txtCnt.Visible = txtAvg.Visible = TypeVac.Enabled = TypeVac.Visible = txtAvg.Enabled = false;
                    }
                }
            }
        }

        protected void Option_CrtVacUpd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Option_CrtVacUpd.SelectedIndex.Equals(0))
            {
                btnAddVac.Enabled = btnAddVac.Visible = true;
                btnUpdVac.Enabled = btnUpdVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = false;
            }
            else if(Option_CrtVacUpd.SelectedIndex.Equals(1))
            {
                btnUpdVac.Enabled = btnUpdVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = true;
                btnAddVac.Enabled = btnAddVac.Visible = false;
            }
        }
    }
}