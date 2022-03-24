using System;
using Hire_Me.Classes;
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
            if (ShowData_Mini_Uni.SelectedValue != null) 
            {
                DataTable dt = new DataTable();
                ShowData_Mini_Uni.SelectedValue = null;
                GridViewDataAccount.DataSource = dt;
                GridViewDataAccount.DataBind();
            }
            if (Option_Mini_Uni.SelectedValue != null) 
            {
                DataTable dt = new DataTable();
                Option_Mini_Uni.SelectedValue = null;
                DataFromOption.DataSource = dt;
                DataFromOption.DataBind();
                ConForUpt.Enabled = false;
            }

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
            if(Option_Mini_Uni.SelectedIndex.Equals(0))
            {
                DataFromOption.DataSource = access.SelectAllData("MINISTRY");
                DataFromOption.DataTextField = "MINISTRY_NAME";
                DataFromOption.DataValueField = "ID_MINISTRY";
                //Application["Account"] = "UpdateMinistry";
            }
            else if(Option_Mini_Uni.SelectedIndex.Equals(1))
            {
                DataFromOption.DataSource = access.SelectAllData("UNIVERSITY");
                DataFromOption.DataTextField = "UNIVERSITY_NAME";
                DataFromOption.DataValueField = "ID_UNIVERSITY";
                //Application["Account"] = "UpdateUniversity";
            }
            if (ShowData_Mini_Uni.SelectedValue != null)
            {
                DataTable dt = new DataTable();
                ShowData_Mini_Uni.SelectedValue = null;
                GridViewDataAccount.DataSource = dt;
                GridViewDataAccount.DataBind();
            }
            if (Control_List.SelectedValue != null)
            {
                Control_List.SelectedValue = null;
                Confirm.Enabled = false;
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
                //Application["Account"] = "";
            }
        }

        protected void ShowData_Mini_Uni_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ShowData_Mini_Uni.SelectedIndex.Equals(0))
            {
                GridViewDataAccount.DataSource = access.SelectAllData("VIEW_MINISTRY");
            }
            else if (ShowData_Mini_Uni.SelectedIndex.Equals(1))
            {
                GridViewDataAccount.DataSource = access.SelectAllData("VIEW_UNIVERSITY");
            }
            if (Option_Mini_Uni.SelectedValue != null)
            {
                DataTable dt = new DataTable();
                Option_Mini_Uni.SelectedValue = null;
                DataFromOption.DataSource = dt;
                DataFromOption.DataBind();
                ConForUpt.Enabled = false;
            }
            if (Control_List.SelectedValue != null)
            {
                Control_List.SelectedValue = null;
                Confirm.Enabled = false;
            }
            GridViewDataAccount.DataBind();
        }
    }
}