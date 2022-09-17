using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hire_Me.Classes;

namespace Hire_Me.Home
{
    public partial class GraduateDesire : Page
    {
        Access_DataBase access; BasicHireMe hireMe;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            hireMe = new BasicHireMe();
            if (!IsPostBack)
            {
                try
                {
                    access.Read_Data("PAK_GRAD.CHECK_NUMID(" + 3 /*int.Parse(Session["Id_G_to_D"].ToString())*/ + ") AS CH_NUM", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["CH_NUM"].ToString() == "0") { Response.Redirect("~/Home/SignIn.aspx"); }
                    else
                    {
                        CheckBoxDesire.DataSource = hireMe.Get_Vac("هندسة معلوماتية"/*Request.QueryString["splz"].ToString()*/,100 /*float.Parse(Request.QueryString["avg"].ToString())*/);
                        CheckBoxDesire.DataTextField = "FULLNAME";
                        CheckBoxDesire.DataValueField = "FULLID";
                        CheckBoxDesire.DataBind();
                        if (CheckBoxDesire.Items.Count == 0)
                        {
                            CstmVldtrSelectSix.ErrorMessage = "لا يوجد رغبات حالياً";
                            CstmVldtrSelectSix.Visible = true;
                            CstmVldtrSelectSix.IsValid = false;
                        }
                    }
                }
                catch { Response.Redirect("~/Home/SignIn.aspx"); }
            }
        }

        protected void CheckBoxDesire_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedCount = CheckBoxDesire.Items.Cast<ListItem>().Count(li => li.Selected);
            if (selectedCount > 0)
            {
                btn_sign_desire.Enabled = true;
            }
            else
            {
                btn_sign_desire.Enabled = false;
            }
            if (selectedCount > 6)
            {
                CstmVldtrSelectSix.Visible = true;
                CstmVldtrSelectSix.IsValid = false;
                btn_sign_desire.Enabled = false;
            }
            else
            {
                CstmVldtrSelectSix.Visible = false;
            }
        }

        protected void btn_sign_desire_Click(object sender, EventArgs e)
        {
            string Query = "BEGIN ", id_cond; int x = 0;
            for (int i = 0; i < CheckBoxDesire.Items.Count; i++)
            {
                if (CheckBoxDesire.Items[i].Selected == true)
                {
                    x++;
                    Query += "INSERT INTO DESIRE VALUES(NULL, " + 3/*int.Parse(Session["Id_G_to_D"].ToString())*/ + ", " + int.Parse(CheckBoxDesire.Items[i].Value.Substring(0, CheckBoxDesire.Items[i].Value.IndexOf("|"))) + ", " + x + ");";
                    id_cond = CheckBoxDesire.Items[i].Value.Substring(CheckBoxDesire.Items[i].Value.IndexOf("|") + 1);
                    if (id_cond != "")
                    {
                        Query += "UPDATE EMP_CONDITION SET RESULT_CONDITION = 1 WHERE ID_EMP_CONDITION = " + int.Parse(id_cond) + ";";
                    }
                }
                else
                {
                    continue;
                }
            }
            Query += "END;";
            access.Ex_SQL(Query);
            Response.Redirect("~/Home/SignIn.aspx");
        }
    }
}