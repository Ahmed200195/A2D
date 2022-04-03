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
                if (Option_Mini_Uni.SelectedIndex.Equals(0))
                {
                    GridViewDataAccount.DataSource = access.SelectAllData("VIEW_MINISTRY");
                    DataFromOption.DataSource = access.SelectAllData("MINISTRY");
                    DataFromOption.DataTextField = "MINISTRY_NAME";
                    DataFromOption.DataValueField = "ID_MINISTRY";
                }
                GridViewDataAccount.DataBind();
                DataFromOption.DataBind();
                ConForUpt.Enabled = true;
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
    }
}