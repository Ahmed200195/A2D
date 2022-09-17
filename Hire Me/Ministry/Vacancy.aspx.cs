using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

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
                try
                {
                    //if (Session["Ministry"] == null)
                    //{
                    //    Response.Redirect("~/Home/SignIn.aspx");
                    //}
                    if (Option_CrtVacUpd.SelectedIndex.Equals(0))
                    {
                        lpExitVac.Text = "";
                        btnAddVac.Enabled = btnAddVac.Visible = true;
                        btnDelVac.Enabled = btnDelVac.Visible = false;
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
                catch
                {
                    Response.Redirect("~/Home/SignIn.aspx");
                }
            }
        }
        private void proces_vac_upd()
        {
            access.Read_Data("VACANCY_TYPE, VACANCY_AVG, VACANCY_COUNT", "VACANCY WHERE ID_VACANCY = '" + dp_Univ_Vac.SelectedValue + "'");
            access.dataReader.Read();
            ViewState["txtAvg"] = txtAvg.Text = access.dataReader["VACANCY_AVG"].ToString();
            ViewState["txtCnt"] = txtCnt.Text = access.dataReader["VACANCY_COUNT"].ToString();
            ViewState["VACANCY_TYPE"] = access.dataReader["VACANCY_TYPE"].ToString();
            TypeVac.DataBind();
            TypeVac.Items.FindByValue(access.dataReader["VACANCY_TYPE"].ToString()).Selected = true;
        }
        private void proces_cond_upd()
        {
            string condType = "";
            string vacId = "";

            for (int i = 0; i < dp_Univ_Vac.SelectedItem.Value.Length; i++)
            {
                if (dp_Univ_Vac.SelectedItem.Value[i] == ':')
                {
                    break;
                }
                vacId += dp_Univ_Vac.SelectedItem.Value[i];
            }
            for (int i = 0; i < dp_Univ_Vac.SelectedItem.Value.Length; i++)
            {
                if (dp_Univ_Vac.SelectedItem.Value[i] == ':')
                {
                    condType = "";
                    i++;
                }
                condType += dp_Univ_Vac.SelectedItem.Value[i];
            }
            access.Read_Data("ID_EMP_CONDITION, EMP_CONDITION_NAME, EMP_CONDITION_TYPE", "EMP_CONDITION WHERE ID_VACANCY IN (SELECT ID_VACANCY FROM VACANCY WHERE ID_VACANCY = " + int.Parse(vacId) + ") AND EMP_CONDITION_TYPE = '" + condType + "'");
            access.dataReader.Read();
            ViewState["ID_EMP_CONDITION"] = access.dataReader["ID_EMP_CONDITION"].ToString();
            txtCname.Text = access.dataReader["EMP_CONDITION_NAME"].ToString();
            ViewState["txtCname"] = txtCname.Text;
            ViewState["EMP_CONDITION_TYPE"] = access.dataReader["EMP_CONDITION_TYPE"].ToString();
            TypeCond.DataBind();
            TypeCond.Items.FindByValue(access.dataReader["EMP_CONDITION_TYPE"].ToString()).Selected = true;
        }

        protected void Option_CrtVacUpd_SelectedIndexChanged(object sender, EventArgs e)
        {
            lpExitVac.Text = "";
            if (Option_CrtVacUpd.SelectedIndex.Equals(0))
            {
                lpExitVac.Text = "";
                btnAddVac.Enabled = btnAddVac.Visible = true;
                btnAddVac.Text = "إضافة";
                btnDelVac.Enabled = btnDelVac.Visible = dp_Univ_Vac.AutoPostBack = false;
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
                btnAddVac.Enabled = btnAddVac.Visible = btnDelVac.Enabled = btnDelVac.Visible = dp_Univ_Vac.AutoPostBack = true;
                btnAddVac.Text = "تعديل";
                if (int.Parse(Request.QueryString["VacCond"]) == 0)
                {
                    dp_Univ_Vac.DataSource = access.SelectData("SELECT ID_VACANCY, VACANCY_NAME || ' (' || VACANCY_TYPE || ') ' FULLVAC FROM VACANCY WHERE ID_MINISTRY =" + 1);
                    dp_Univ_Vac.DataTextField = "FULLVAC"; dp_Univ_Vac.DataValueField = "ID_VACANCY";
                    dp_Univ_Vac.DataBind();
                    proces_vac_upd();
                }
                else if (int.Parse(Request.QueryString["VacCond"]) == 1)
                {
                    dp_Univ_Vac.DataSource = access.SelectData("SELECT V.ID_VACANCY, VACANCY_NAME || ' (' || VACANCY_TYPE || ': '|| EMP_CONDITION_TYPE ||')' FULLVAC, V.ID_VACANCY||':'||EMP_CONDITION_TYPE FULLID FROM VACANCY V, EMP_CONDITION C  WHERE V.ID_VACANCY = C.ID_VACANCY AND ID_MINISTRY =" + 1);
                    dp_Univ_Vac.DataTextField = "FULLVAC"; dp_Univ_Vac.DataValueField = "FULLID";
                    dp_Univ_Vac.DataBind();
                    proces_cond_upd();
                }
            }
        }

        protected void dp_Univ_Vac_SelectedIndexChanged(object sender, EventArgs e)
        {
            lpExitVac.Text = "";
            dp_Univ_Vac.DataBind();
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
            string vac = "", Query = "";
            if (tlpage.InnerText == "Vacancy")
            {
                for (int i = 0; i < dp_Univ_Vac.SelectedItem.Text.Length; i++)
                {
                    if (dp_Univ_Vac.SelectedItem.Text[i] == ' ' && dp_Univ_Vac.SelectedItem.Text[i + 1] == '(')
                    {
                        break;
                    }
                    vac += dp_Univ_Vac.SelectedItem.Text[i];
                }
                access.Read_Data("PAK_VAC_COND.FUN_CHVAC_REP('" + vac + "', '" + TypeVac.SelectedValue + "', 1) FCHRVAC", "DUAL");
                access.dataReader.Read();
                if (access.dataReader["FCHRVAC"].ToString() == "1")
                {
                    if (Option_CrtVacUpd.SelectedIndex.Equals(1))
                    {
                        if (ViewState["txtAvg"].ToString() == txtAvg.Text && ViewState["txtCnt"].ToString() == txtCnt.Text)
                        {
                            Thread.Sleep(1000);
                            lpExitVac.Text = "Vacancy Exists";
                            return;
                        }
                        else
                        {
                            if(ViewState["VACANCY_TYPE"].ToString() != TypeVac.SelectedValue)
                            {
                                Thread.Sleep(1000);
                                lpExitVac.Text = "Vacancy Exists";
                                return;
                            }
                        }
                    }
                    else
                    {
                        Thread.Sleep(1000);
                        lpExitVac.Text = "Vacancy Exists";
                        return;
                    }
                }
                if (btnAddVac.Text == "إضافة")
                {
                    Query = "BEGIN " +
                    "PAK_VAC_COND.INS_VAC('" + dp_Univ_Vac.SelectedItem.Text + "', " + int.Parse(txtCnt.Text) + ", " + float.Parse(txtAvg.Text) + ", '" + TypeVac.SelectedValue + "', 1, 'INSERT');" +
                    "END;";
                }
                else
                {
                    Query = "BEGIN " +
                    "PAK_VAC_COND.INS_VAC('', " + int.Parse(txtCnt.Text) + ", " + float.Parse(txtAvg.Text) + ", '" + TypeVac.SelectedValue + "', " + int.Parse(dp_Univ_Vac.SelectedValue) + ", 'UPDATE');" +
                    "END;";
                }
            }
            else if (tlpage.InnerText == "Vacancy Condition")
            {
                for (int i = 0; i < dp_Univ_Vac.SelectedItem.Value.Length; i++)
                {
                    if (dp_Univ_Vac.SelectedItem.Value[i] == ':')
                    {
                        break;
                    }
                    vac += dp_Univ_Vac.SelectedItem.Value[i];
                }
                access.Read_Data("PAK_VAC_COND.FUN_CHCOND_REP(" + int.Parse(vac) + ", " + 1 + ", '" + TypeCond.SelectedValue + "') FCHRCOND", "DUAL");
                access.dataReader.Read();
                if (access.dataReader["FCHRCOND"].ToString() == "1")
                {
                    if (Option_CrtVacUpd.SelectedIndex.Equals(1))
                    {
                        if (txtCname.Text == ViewState["txtCname"].ToString() || TypeCond.SelectedValue == ViewState["EMP_CONDITION_TYPE"].ToString() || TypeCond.SelectedValue != ViewState["EMP_CONDITION_TYPE"].ToString())
                        {
                            if (TypeCond.SelectedValue == ViewState["EMP_CONDITION_TYPE"].ToString())
                            {
                                goto step;
                            }
                            Thread.Sleep(1000);
                            lpExitVac.Text = "Vacancy Exists";
                            return;
                        }
                    }
                    else
                    {
                        Thread.Sleep(1000);
                        lpExitVac.Text = "Vacancy Exists";
                        return;
                    }
                }
                step:
                if (btnAddVac.Text == "إضافة")
                {
                    Query = "BEGIN " +
                    "PAK_VAC_COND.INS_COND('" + txtCname.Text + "', '" + TypeCond.SelectedValue + "', " + int.Parse(dp_Univ_Vac.SelectedValue) + ", 'INSERT');" +
                    "END;";
                }
                else
                {
                    Query = "BEGIN " +
                    "PAK_VAC_COND.INS_COND('" + txtCname.Text + "', '" + TypeCond.SelectedValue + "', " + int.Parse(ViewState["ID_EMP_CONDITION"].ToString()) + ", 'UPDATE');" +
                    "END;";
                }
            }
            access.Ex_SQL(Query);
            Response.Redirect("");
        }
        protected void btnDelVac_Click(object sender, EventArgs e)
        {
            string Query = "";
            if (tlpage.InnerText == "Vacancy")
            {
                Query = "BEGIN " +
                        "DELETE FROM VACANCY WHERE ID_VACANCY = " + int.Parse(dp_Univ_Vac.SelectedValue) + ";" +
                        "DELETE FROM EMP_CONDITION WHERE ID_VACANCY = " + int.Parse(dp_Univ_Vac.SelectedValue) + ";"
                        + "END;";
            }
            else if (tlpage.InnerText == "Vacancy Condition")
            {
                Query = "BEGIN " +
                        "DELETE FROM EMP_CONDITION WHERE ID_EMP_CONDITION = " + int.Parse(ViewState["ID_EMP_CONDITION"].ToString()) + ";"
                        + "END;";
            }

            access.Ex_SQL(Query);
            Response.Redirect("");
        }
    }
}