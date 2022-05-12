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
        BasicHireMe basic;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            basic = new BasicHireMe();
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
            string num = "", email = "", phone = "";
            access.Read_Data("PAK_MINI_UNVI.FUNCHECK('" + txtNumId.Text + "', NULL, 'PK_GRADUATE') AS RESCH", "DUAL");
            access.dataReader.Read();
            if (access.dataReader["RESCH"].ToString() == "1")
            {
                num = "1"; errNumId.ErrorMessage = "Pre-Existing";
                errNumId.IsValid = false;
            }
            access.Read_Data("PAK_MINI_UNVI.FUNCHECK('" + txtEmail.Text + "', NULL, 'EMAIL') AS RESCH", "DUAL");
            access.dataReader.Read();
            if (access.dataReader["RESCH"].ToString() == "1")
            {
                email = "1"; errEmailRequired.ErrorMessage = "Pre-Existing";
                errEmailRequired.IsValid = false;
            }
            access.Read_Data("PAK_MINI_UNVI.FUNCHECK('" + txtPhe.Text + "', NULL, 'PHONE') AS RESCH", "DUAL");
            access.dataReader.Read();
            if (access.dataReader["RESCH"].ToString() == "1")
            {
                phone = "1"; errPhe.ErrorMessage = "Pre-Existing";
                errPhe.IsValid = false;
            }
            if (num == "1" || email == "1" || phone == "1") 
            {
                return;
            }
            ViewState["EcodingGradPassword"] = basic.Encrypt(txtPswd.Text, 95);
            dvCrtAcnt.Visible = false;
            EntCode.Visible = true;
        }
        protected void CodeConfirm_Click(object sender, EventArgs e)
        {
            string query;
            //if(ViewState["Code"].ToString() == txtCode.Text)
            //{
                query = "SET AUTOCOMMIT OFF; BEGIN PAK_GRAD.INS_GRAD(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'); END;";
                access.Ex_SQL(query);
                Response.Redirect("GraduateDesire.aspx");
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