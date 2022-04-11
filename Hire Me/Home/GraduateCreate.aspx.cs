using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me
{
    public partial class GraduateCreate : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if (!IsPostBack)
            {
                cty.DataSource = from_cty.DataSource = access.SelectAllData("Country");
                cty.DataTextField = from_cty.DataTextField = "CNAME";
                cty.DataValueField = from_cty.DataValueField = "CVALUE";
                cty.DataBind(); from_cty.DataBind();
                EntCode.Visible = false;
            }
        }
        protected void BrnCrt_Click(object sender, EventArgs e)
        {

        }
        protected void CodeConfirm_Click(object sender, EventArgs e)
        {
            //if(ViewState["Code"].ToString() == txtCode.Text)
            //{

            //}
            //else
            //{
            //    errCode.Text = "Error Code ";
            //    return;
            //}
        }
        protected void cty_SelectedIndexChanged(object sender, EventArgs e)
        {
            Splzn.DataSource = access.SelectData("SELECT UNIVERSITY_NAME FROM UNIVERSITY WHERE UNIVERSITY_COUNTRY = '" + cty.SelectedValue + "'");
            Splzn.DataTextField = "UNIVERSITY_NAME";
            Splzn.DataValueField = "UNIVERSITY_NAME";
            Splzn.DataBind();
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
            if (args.Value.Length == 10 && int.TryParse(args.Value, out int c) == true)
            {
                try
                {
                    if (args.Value[0] == '0' && args.Value[1] == '9' || args.Value[0] == '0' && args.Value[1] == '1' && args.Value[2] == '1')
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