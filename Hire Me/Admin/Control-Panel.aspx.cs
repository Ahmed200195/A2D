using System;
using Hire_Me.Classes;
using Hire_Me.Admin;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Hire_Me
{
    public partial class Control_Panel : Page
    {
        Access_DataBase access;
        RadioButtonList Option_Mini_Uni;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            Option_Mini_Uni = Master.FindControl("Option_Mini_Uni") as RadioButtonList;
            Option_Mini_Uni.Enabled = true;
            if (!IsPostBack)
            {
                try
                {
                    int x = int.Parse(Request.QueryString["op_mi_uv"]);
                    if (x == 0)
                    {
                        Option_Mini_Uni.Items[x].Selected = true;
                    }
                    else
                    {
                        Option_Mini_Uni.Items[x].Selected = true;
                    }
                }
                catch
                {

                    
                }
                finally
                {
                    if (Option_Mini_Uni.SelectedIndex.Equals(0))
                    {
                        GridViewDataAccount.DataSource = access.SelectData("SELECT MINISTRY_NAME, PHONE FROM VIEW_MINISTRY");
                        DataFromOption.DataSource = access.SelectAllData("VIEW_MINISTRY");
                        DataFromOption.DataTextField = "MINISTRY_NAME";
                        DataFromOption.DataValueField = "ID_MINISTRY";
                    }
                    else if(Option_Mini_Uni.SelectedIndex.Equals(1))
                    {
                        GridViewDataAccount.DataSource = access.SelectData("SELECT UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE FROM VIEW_UNIVERSITY");
                        DataFromOption.DataSource = access.SelectAllData("UNIV_WITH_COUNTRY");
                        DataFromOption.DataTextField = "FLUNIVCNTY";
                        DataFromOption.DataValueField = "ID_UNIVERSITY";
                    }
                    GridViewDataAccount.DataBind();
                    DataFromOption.DataBind();
                    GridViewAdminAccount.DataSource = access.SelectData("SELECT ADMIN_FIRST_NAME, ADMIN_LAST_NAME, ADMIN_FATHER_NAME, ADMIN_EMAIL, ADMIN_PASSWORD FROM ADMIN");
                    GridViewAdminAccount.DataBind();
                    ConForUpt.Enabled = true;
                    ConForDel.Enabled = true;
                }
            }
        }
        protected void Confirm_Click(object sender, EventArgs e)
        {
            if (Control_List.SelectedValue != null)
            {
                Confirm.Enabled = false;
                Control_List.SelectedValue = null;
            }
        }
        protected void Control_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            Confirm.Enabled = true;
        }
        protected void ConForUpt_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx?id_option=" + DataFromOption.SelectedValue + "&Account=Up" + Option_Mini_Uni.SelectedValue + "&Admin=Admin");
        }

        protected void ConForDel_Click(object sender, EventArgs e)
        {
            string query = "";
            int x = 0;
            if (Option_Mini_Uni.SelectedIndex.Equals(0))
            {
                query = "BEGIN PAK_MINI_UNVI.DEL_MINI_UNV(" + DataFromOption.SelectedValue + ", 0); END;";
            }
            else if(Option_Mini_Uni.SelectedIndex.Equals(1))
            {
                x = 1;
                query = "BEGIN PAK_MINI_UNVI.DEL_MINI_UNV(" + DataFromOption.SelectedValue + ", 1); END;";
            }
            access.Ex_SQL(query);
            Response.Redirect("Control-Panel.aspx?op_mi_uv=" + x);
        }
    }
}