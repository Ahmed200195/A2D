using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me
{
    public partial class Control_Panel : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            Application["Admin"] = "";
            Application.Lock();
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            if(Control_List.SelectedValue != null)
            {
                Confirm.Enabled = false;
                Control_List.SelectedValue = null;
                Control_List.AutoPostBack = true;
            }
        }

        protected void Control_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            Confirm.Enabled = true;
            Control_List.AutoPostBack = false;
        }

        protected void crtMsty_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx?Account=CreateMinistry&Admin=Admin");
        }

        protected void crtUvsty_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx?Account=CreateUniversity&Admin=Admin");
        }

        protected void Option_Mini_Uni_SelectedIndexChanged(object sender, EventArgs e)
        {
            Application.UnLock();
            if(Option_Mini_Uni.SelectedIndex.Equals(0))
            {
                DataFromOption.DataSource = access.SelectAllData("MINISTRY");
                DataFromOption.DataTextField = "MINISTRY_NAME";
                DataFromOption.DataValueField = "ID_MINISTRY";
                Application["Account"] = "UpdateMinistry";
            }
            else if(Option_Mini_Uni.SelectedIndex.Equals(1))
            {
                DataFromOption.DataSource = access.SelectAllData("UNIVERSITY");
                DataFromOption.DataTextField = "UNIVERSITY_NAME";
                DataFromOption.DataValueField = "ID_UNIVERSITY";
                Application["Account"] = "UpdateUniversity";
            }
            DataFromOption.DataBind();
            ConForUpt.Enabled = true;
        }

        protected void ConForUpt_Click(object sender, EventArgs e)
        {
            if (Option_Mini_Uni.SelectedValue != null)
            {
                Option_Mini_Uni.SelectedValue = null;
                ConForUpt.Enabled = false;
                Response.Redirect("CreateAccount.aspx?id_option=" + DataFromOption.SelectedValue + "&Account=" + Application["Account"] + "&Admin=Admin");
                Application["Account"] = "";
                Application.Lock();
            }
        }
    }
}