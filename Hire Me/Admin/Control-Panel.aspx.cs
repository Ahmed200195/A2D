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
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            //radioButtonList = Page.Master.FindControl("Option_Mini_Uni") as RadioButtonList;
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
            //Response.Redirect("CreateAccount.aspx?id_option=" + DataFromOption.SelectedValue + "&Account=" + Application["Account"] + "&Admin=Admin");
        }
    }
}