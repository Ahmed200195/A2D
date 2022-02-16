﻿using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        Access_DataBase access;
        BasicHireMe basic = new BasicHireMe();
        string Query = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                access = new Access_DataBase();
                cty.DataSource = from_cty.DataSource = access.SelectAllData("Country");
                cty.DataTextField = from_cty.DataTextField = "CNAME";
                cty.DataValueField = from_cty.DataValueField = "CVALUE";
                cty.DataBind(); from_cty.DataBind();
                if (Application["CreateAccount"].Equals("Ministry"))
                {
                    tlpage.Text += "Ministry";
                    Response.Write("<style> .gradInfo, .gradUnInfo{display : none}</style>");
                    changeName.Text += "الوزارة";
                    txtName.MaxLength = 25;
                }
                else if (Application["CreateAccount"].Equals("University"))
                {
                    tlpage.Text += "University";
                    Response.Write("<style> .gradInfo{display : none}</style>");
                    changeName.Text += "الجامعة";
                    txtName.MaxLength = 25;
                }
                else
                {
                    tlpage.Text += "Graduate";
                    changeName.Text += "الطالب";
                    txtName.MaxLength  = txtmName.MaxLength = 20;
                    txtfName.MaxLength = 15;
                    RadioShahid.SelectedIndex = 1;
                }
            }
            if (Application["CreateAccount"].Equals("Default"))
            {
                if (basic.CheckTop(txtNumId.Text, KeyWrd.idNum) == true)
                {
                    Response.Write("<script>let msgErr = document.getElementsByClassName('err'); msgErr.Text = " + basic.Msg + "</script>");
                    return;
                }
                else
                {
                    errNumId.Text = "";
                }
            }
        }

        protected void brnCrt_Click(object sender, EventArgs e)
        {
            if (Application["CreateAccount"].Equals("Ministry"))
            {
                Query = "INSERT INTO MINISTRY VALUES();";
            }
            else if (Application["CreateAccount"].Equals("University"))
            {
                Query = "INSERT INTO UNIVERSITY VALUES();";
            }
            else
            {
                Response.Write("<script>let msgErr = document.getElementsByClassName('err'); msgErr = " + basic.Msg + "</script>");
                Query = "INSERT INTO GRADUATE VALUES();";
            }
        }

        protected void cty_SelectedIndexChanged(object sender, EventArgs e)
        {
            Splzn.DataSource = access.SelectData("SELECT UNIVERSITY_NAME FROM UNIVERSITY WHERE UNIVERSITY_COUNTRY = '" + cty.DataValueField + "'");
            Splzn.DataTextField = "UNIVERSITY_NAME";
            Splzn.DataValueField = "UNIVERSITY_NAME";
            Splzn.DataBind();
        }
    }
}