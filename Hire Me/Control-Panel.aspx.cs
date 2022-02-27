﻿using System;
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
            if(!IsPostBack)
            {
                Confirm.Enabled = false;
                ConForUpt.Enabled = false;
            }
            Label1.Text = DataFromOption.SelectedValue;
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
            Application["CreateAccount"] = "Ministry";
            Response.Redirect("CreateAccount.aspx");
        }

        protected void crtUvsty_Click(object sender, EventArgs e)
        {
            Application["CreateAccount"] = "University";
            Response.Redirect("CreateAccount.aspx");
        }

        protected void Option_Mini_Uni_SelectedIndexChanged(object sender, EventArgs e)
        {
            ConForUpt.Enabled = true;
            if(Option_Mini_Uni.SelectedIndex.Equals(0))
            {
                DataFromOption.DataSource = access.SelectAllData("MINISTRY");
                DataFromOption.DataTextField = "MINISTRY_NAME";
                DataFromOption.DataValueField = "ID_MINISTRY";
                Application["UpdateAccount"] = "Ministry";
            }
            else if(Option_Mini_Uni.SelectedIndex.Equals(1))
            {
                DataFromOption.DataSource = access.SelectAllData("UNIVERSITY");
                DataFromOption.DataTextField = "UNIVERSITY_NAME";
                DataFromOption.DataValueField = "ID_UNIVERSITY";
                Application["UpdateAccount"] = "University";
            }
            DataFromOption.DataBind();
        }

        protected void ConForUpt_Click(object sender, EventArgs e)
        {

            if (Option_Mini_Uni.SelectedValue != null)
            {
                Option_Mini_Uni.SelectedValue = null;
                ConForUpt.Enabled = false;
                Response.Redirect($"CreateAccount.aspx?id_option={DataFromOption.SelectedValue}");
            }
        }
    }
}