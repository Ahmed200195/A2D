using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.Admin
{
    public partial class CreateAccount : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if (!IsPostBack)
            {
                try
                {

                    string Q_Admin = Request.QueryString["Admin"].ToString();
                    if (Q_Admin == "Admin")
                    {
                        string Q_crt = Request.QueryString["Account"].ToString();
                        if (Q_crt == "CreateMinistry")
                        {
                            titPage.InnerText += " Ministry";
                            governorate.Visible = false;
                            lgover.Enabled = false;
                            lgover.Visible = false;
                            from_cty.Enabled = false;
                            from_cty.Visible = false;
                        }
                        else
                        {
                            titPage.InnerText += " University";
                            from_cty.DataSource = access.SelectAllData("Country ORDER BY CVALUE");
                            from_cty.DataTextField = "CNAME";
                            from_cty.DataValueField = "CVALUE";
                            from_cty.DataBind();
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Home.aspx");
                    }
                }
                catch
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
        }
        protected void errGmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (errEmailRequired.IsValid == true && errEmailConding.IsValid == true)
            {
                int cnt = 0;
                for (int i = 0; i < args.Value.Length; i++)
                {
                    if (args.Value[i].Equals('@') && args.Value[i + 1] != '.')
                    {
                        for (int j = i; j < args.Value.Length; j++)
                        {
                            if (args.Value[j].Equals('.') && args.Value[args.Value.Length - 1] != args.Value[j])
                            {
                                cnt++;
                            }
                        }
                        if (cnt.Equals(1))
                        {
                            try
                            {
                                if (args.Value[i + 1].Equals('g') && args.Value[i + 2].Equals('m')
                                    && args.Value[i + 3].Equals('a') && args.Value[i + 4].Equals('i') && args.Value[i + 5].Equals('l')
                                    && args.Value[i + 6].Equals('.') && args.Value[i + 7].Equals('c') && args.Value[i + 8].Equals('o')
                                    && args.Value[i + 9].Equals('m'))
                                {
                                    args.IsValid = true;
                                }
                                else
                                {
                                    args.IsValid = false;
                                }
                            }
                            catch
                            {
                                args.IsValid = false;
                            }
                        }
                    }
                }
            }
            else
            {
                args.IsValid = true;
            }
        }
        protected void errPasswordCh_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length >= 15)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void errStartPhe_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (errPhe.IsValid == true && errPheTen.IsValid == true)
            {
                try
                {
                    if (args.Value[0].Equals('0') && args.Value[1].Equals('9') || args.Value[0].Equals('0') && args.Value[1].Equals('1') && args.Value[2].Equals('1'))
                    {
                        args.IsValid = true;
                    }
                    else
                    {
                        args.IsValid = false;
                    }
                }
                catch
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}