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
        BasicHireMe basic;
        string Query = ""; int count = 0; 
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if (!IsPostBack)
            {
                
                basic = new BasicHireMe();
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
                }
            }
        }

        protected void brnCrt_Click(object sender, EventArgs e)
        {
            errName.Text = "";
            errlname.Text = "";
            errfname.Text = "";
            errmname.Text = "";
            errNumId.Text = "";
            erravg.Text = "";
            errPhe.Text = "";
            errEmail.Text = "";
            errPwsrd.Text = "";
            errPwsrdCm.Text = "";
            if (Application["CreateAccount"].Equals("Ministry"))
            {
                //Query = "INSERT INTO MINISTRY VALUES();";
            }
            else if (Application["CreateAccount"].Equals("University"))
            {
                //Query = "INSERT INTO UNIVERSITY VALUES();";
            }
            else
            {
                if (basic.CheckTop(txtName.Text, KeyWrd.Name) == true)
                {
                    errName.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtlName.Text, KeyWrd.Name) == true)
                {
                    errlname.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtfName.Text, KeyWrd.Name) == true)
                {
                    errfname.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtmName.Text, KeyWrd.Name) == true)
                {
                    errmname.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtNumId.Text, KeyWrd.idNum) == true)
                {
                    errNumId.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtavg.Text, KeyWrd.Avg) == true)
                {
                    erravg.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtPhe.Text, KeyWrd.Phone) == true)
                {
                    errPhe.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtEmail.Text, KeyWrd.Email) == true)
                {
                    errEmail.Text = basic.Msg;
                    return;
                }
                else if (basic.CheckTop(txtPswrd.Text, KeyWrd.Pswrd) == true)
                {
                    errPwsrd.Text = basic.Msg;
                    return;
                }
                else if (txtPswrd.Text != txtPswedCm.Text)
                {
                    errPwsrdCm.Text = "Do not match the password";
                    return;
                }
                else
                {
                    access.Read_Data("ID_GRADUATE", "GRADUATE");
                    while(access.dataReader.Read())
                    {
                        count++;
                    }
                    count++;
                    txtPswrd.Text = BasicHireMe.Encrypt(txtPswrd.Text, count);
                    Query = "INSERT INTO GRADUATE VALUES(" + count + ", '" + txtNumId.Text + "', '" + txtName.Text + "', '" + txtlName.Text + "', '" + txtfName.Text + "', '" + txtmName.Text + "', '" + txtdate.Text + "', " + txtavg.Text + ", '" + Splzn.DataValueField + "', '" + cty.DataValueField + "', '" + from_cty.DataValueField + "', '" + RadioShahid.SelectedValue + "', '" + txtEmail.Text + "', '" + txtPswrd.Text + "', '0');";
                    access.Ex_DML(Query);
                }
                
            }
        }

        protected void cty_SelectedIndexChanged(object sender, EventArgs e)
        {
            Splzn.DataSource = access.SelectData("SELECT UNIVERSITY_NAME FROM UNIVERSITY WHERE UNIVERSITY_COUNTRY = '" + cty.SelectedValue + "'");
            Splzn.DataTextField = "UNIVERSITY_NAME";
            Splzn.DataValueField = "UNIVERSITY_NAME";
            Splzn.DataBind();
        }
    }
}