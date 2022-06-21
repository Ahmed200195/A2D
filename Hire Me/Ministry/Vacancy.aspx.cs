using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.MInistry
{
    public partial class Vacancy : Page
    {
        Access_DataBase access;
        private void proces_vac_crt()
        {
            dp_Univ_Vac.DataSource = access.SelectData("SELECT DISTINCT UNIVERSITY_NAME FROM UNIVERSITY");
            dp_Univ_Vac.DataTextField = "UNIVERSITY_NAME"; dp_Univ_Vac.DataValueField = "UNIVERSITY_NAME";
            txtAvg.Text = txtCnt.Text = "";
        }
        private void proces_cond_crt()
        {
            dp_Univ_Vac.DataSource = access.SelectData("SELECT ID_VACANCY, VACANCY_NAME || ' (' || VACANCY_TYPE || ') ' FULLVAC FROM VACANCY WHERE ID_MINISTRY =" + 1);
            dp_Univ_Vac.DataTextField = "FULLVAC"; dp_Univ_Vac.DataValueField = "ID_VACANCY";
            txtCname.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if(!IsPostBack)
            {
                //if(Session["Ministry"] == null)
                //{
                //    Response.Redirect("~/Home/SignIn.aspx");
                //}
                if (Option_CrtVacUpd.SelectedIndex.Equals(0))
                {
                    lpExitVac.Text = "";
                    btnAddVac.Enabled = btnAddVac.Visible = true;
                    btnUpdVac.Enabled = btnUpdVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = false;
                    int vc = int.Parse(Request.QueryString["VacCond"]);
                    if (vc == 0)
                    {
                        tlpage.InnerText = "Vacancy";
                        tlPost.InnerText = "الشواغر";
                        lp_Univ_Vac.Text = "الاختصاص : ";
                        proces_vac_crt();
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
                        proces_cond_crt();
                        lp_Vtype_Cname.Text = "اسم الشرط : ";
                        lp_avg_ctype.Text = "النوع : ";
                        txtCname.Enabled = TypeCond.Enabled = txtCname.Visible = TypeCond.Visible = true;
                        lpCnt.Enabled = txtCnt.Enabled = lpCnt.Visible = txtCnt.Visible = txtAvg.Visible = TypeVac.Enabled = TypeVac.Visible = txtAvg.Enabled = false;
                    }
                    dp_Univ_Vac.DataBind();
                }
            }
        }
        private void proces_vac_upd()
        {
            access.Read_Data("VACANCY_TYPE, VACANCY_AVG, VACANCY_COUNT", "VACANCY WHERE ID_VACANCY = '" + dp_Univ_Vac.SelectedValue + "'");
            access.dataReader.Read();
            txtAvg.Text = access.dataReader["VACANCY_AVG"].ToString();
            txtCnt.Text = access.dataReader["VACANCY_COUNT"].ToString();
            TypeVac.DataBind();
            TypeVac.Items.FindByValue(access.dataReader["VACANCY_TYPE"].ToString()).Selected = true;
        }
        private void proces_cond_upd()
        {
            access.Read_Data("EMP_CONDITION_NAME, EMP_CONDITION_TYPE", "VACANCY V, EMP_CONDITION C WHERE V.ID_VACANCY = C.ID_VACANCY AND V.ID_VACANCY = '" + dp_Univ_Vac.SelectedValue + "'");
            access.dataReader.Read();
            txtCname.Text = access.dataReader["EMP_CONDITION_NAME"].ToString();
            TypeCond.DataBind();
            TypeCond.Items.FindByValue(access.dataReader["EMP_CONDITION_TYPE"].ToString()).Selected = true;
        }

        protected void Option_CrtVacUpd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Option_CrtVacUpd.SelectedIndex.Equals(0))
            {
                lpExitVac.Text = "";
                btnAddVac.Enabled = btnAddVac.Visible = true;
                btnUpdVac.Enabled = btnUpdVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = false;
                if(int.Parse(Request.QueryString["VacCond"]) == 0)
                {
                    proces_vac_crt();
                }
                else if(int.Parse(Request.QueryString["VacCond"]) == 1)
                {
                    proces_cond_crt();
                }
                TypeVac.DataBind();
                TypeCond.DataBind();
                dp_Univ_Vac.DataBind();
            }
            else if(Option_CrtVacUpd.SelectedIndex.Equals(1))
            {
                btnUpdVac.Enabled = btnUpdVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = true;
                btnAddVac.Enabled = btnAddVac.Visible = false;
                if (int.Parse(Request.QueryString["VacCond"]) == 0)
                {
                    dp_Univ_Vac.DataSource = access.SelectData("SELECT ID_VACANCY, VACANCY_NAME || ' (' || VACANCY_TYPE || ') ' FULLVAC FROM VACANCY WHERE ID_MINISTRY =" + 1);
                    dp_Univ_Vac.DataTextField = "FULLVAC"; dp_Univ_Vac.DataValueField = "ID_VACANCY";
                    dp_Univ_Vac.DataBind();
                    proces_vac_upd();
                }
                else if (int.Parse(Request.QueryString["VacCond"]) == 1)
                {
                    dp_Univ_Vac.DataSource = access.SelectData("SELECT V.ID_VACANCY, VACANCY_NAME || ' (' || VACANCY_TYPE || ') ' FULLVAC FROM VACANCY V, EMP_CONDITION C  WHERE V.ID_VACANCY = C.ID_VACANCY AND ID_MINISTRY =" + 1);
                    dp_Univ_Vac.DataTextField = "FULLVAC"; dp_Univ_Vac.DataValueField = "ID_VACANCY";
                    dp_Univ_Vac.DataBind();
                    proces_cond_upd();
                }
            }
        }

        protected void dp_Univ_Vac_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Option_CrtVacUpd.SelectedIndex.Equals(1))
            {
                if(tlpage.InnerText == "Vacancy")
                {
                    lpExitVac.Text = "";
                    proces_vac_upd();
                }
                else if(tlpage.InnerText == "Vacancy Condition")
                {
                    proces_cond_upd();
                }
            }
        }

        protected void btnAddVac_Click(object sender, EventArgs e)
        {
            lpExitVac.Text = "";
            access.Read_Data("PAK_VAC_COND.FUN_CHVAC_REP('" + dp_Univ_Vac.SelectedItem.Text + "', '" + TypeVac.SelectedValue + "', 1) FCHRVAC", "DUAL");
            access.dataReader.Read();
            if(access.dataReader["FCHRVAC"].ToString() == "1")
            {
                lpExitVac.Text = "Vacancy Exists";
                return;
            }
            else
            {
                string Query = "BEGIN " +
                    "PAK_VAC_COND.INS_VAC('" + dp_Univ_Vac.SelectedItem.Text + "', " + int.Parse(txtCnt.Text) + ", " + float.Parse(txtAvg.Text) + ", '" + TypeVac.SelectedValue + "', 1);" +
                    "END;";
                access.Ex_SQL(Query);
                Response.Redirect("");
            }
        }

        protected void btnUpdVac_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelVac_Click(object sender, EventArgs e)
        {

        }
    }
}