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
        BasicHireMe basic; ClsGraduate graduate;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if (int.Parse(Application["state_site"].ToString()) == 0)
            {
                dvCrtAcnt.Visible = false;
                EntCode.Visible = false;
                ShowError.Visible = true;
                return;
            }
            if (!IsPostBack)
            {
                cty.DataSource = from_cty.DataSource = access.SelectAllData("Country");
                cty.DataTextField = from_cty.DataTextField = "CNAME";
                cty.DataValueField = from_cty.DataValueField = "CVALUE";
                cty.DataBind(); from_cty.DataBind(); EntCode.Visible = false;
                try
                {
                    graduate = new ClsGraduate(long.Parse(Request.QueryString["id"].ToString()));
                    ViewState["ID_G"] = graduate.Id;
                    string firstname = "", lastname = ""; int index = 0;
                    if(graduate.Email == Request.QueryString["email"].ToString())
                    {
                        for (int i = 0; i < graduate.Name.Length; i++)
                        {
                            if(graduate.Name[i] == ' ')
                            {
                                index = i;
                                firstname = lastname;
                                lastname = "";
                                break;
                            }
                            lastname += graduate.Name[i];
                        }
                        for (int j = index + 1; j < graduate.Name.Length; j++)
                        {
                            lastname += graduate.Name[j];
                        }
                        //Fill Data in Failed
                        txtName.Text = firstname; txtlName.Text = lastname;
                        txtfName.Text = graduate.Father;
                        txtmName.Text = graduate.Mather;
                        txtNumId.Text = Request.QueryString["id"].ToString();
                        txtdate.Text = DateTime.Parse(graduate.Date).ToString("yyyy-MM-dd");
                        

                        RadioShahid.DataBind();
                        RadioShahid.Items.FindByValue(graduate.Shahid).Selected = true;
                        cty.DataBind();
                        cty.Items.FindByValue(graduate.UnivCountry).Selected = true;
                        Splzn.DataSource = access.SelectData("SELECT UNIVERSITY_NAME FROM UNIVERSITY WHERE UNIVERSITY_COUNTRY = '" + cty.SelectedValue + "'");
                        Splzn.DataTextField = "UNIVERSITY_NAME";
                        Splzn.DataValueField = "UNIVERSITY_NAME";
                        Splzn.DataBind();
                        if (Splzn.DataSource != null)
                        {
                            Splzn.Items.FindByText(graduate.Specialize).Selected = true;
                        }
                        txtavg.Text = graduate.Avg;
                        txtPhe.Text = graduate.Phone.ToString();
                        ViewState["Phone"] = "0" + txtPhe.Text;
                        from_cty.DataBind();
                        from_cty.Items.FindByValue(graduate.Country).Selected = true;
                        //Disabled Control
                        errEmailRequired.Enabled = errEmailConding.Enabled = errGmail.Enabled
                        = errEmailRequired.Visible = errEmailConding.Visible = errGmail.Visible
                        = errPswd.Enabled = errPswd.Visible = errPasswordCh.Enabled
                        = errPasswordCh.Visible = errPswdCm.Enabled = errPswdCm.Visible
                        = errPswdCompare.Enabled = errPswdCompare.Visible = lpEmail.Visible
                        = txtEmail.Visible = lpPass.Visible = txtPswd.Visible = lpPassCm.Visible 
                        = txtPswdCm.Visible = bremail.Visible = brpass.Visible 
                        = brpasscm.Visible = false;
                        title.InnerText += "Update Graduate Account";
                        brnCrt.Text = "تعديل";
                    }
                }
                catch { title.InnerText += "Create Graduate Account"; }
            }
        }
        protected bool Pk_NumId()
        {
            string num = "";
            access.Read_Data("PAK_MINI_UNVI.FUNCHECK('" + txtNumId.Text + "', NULL, 'PK_GRADUATE') AS RESCH", "DUAL");
            access.dataReader.Read();
            if (access.dataReader["RESCH"].ToString() == "1")
            {
                num = "1"; errNumId.ErrorMessage = "Pre-Existing"; errNumId.IsValid = false;
            }
            if (num == "1") return true; return false;
        }
        protected bool Pk_Phone()
        {
            string phone = "";
            access.Read_Data("PAK_MINI_UNVI.FUNCHECK('" + txtPhe.Text + "', NULL, 'PHONE') AS RESCH", "DUAL");
            access.dataReader.Read();
            if (access.dataReader["RESCH"].ToString() == "1")
            {
                phone = "1"; errPhe.ErrorMessage = "Pre-Existing"; errPhe.IsValid = false;
            }
            if (phone == "1") return true; return false;
        }
        protected void BrnCrt_Click(object sender, EventArgs e)
        {
            basic = new BasicHireMe();
            string email = "", mailbody = "", msgCreate = "Welcome " + txtName.Text + ' ' + txtlName.Text;
            if (brnCrt.Text == "إنشاء حساب")
            {
                if(Pk_NumId() == true || Pk_Phone()== true) { return; }
                access.Read_Data("PAK_MINI_UNVI.FUNCHECK('" + txtEmail.Text + "', NULL, 'EMAIL') AS RESCH", "DUAL");
                access.dataReader.Read();
                if (access.dataReader["RESCH"].ToString() == "1")
                {
                    email = "1"; errEmailRequired.ErrorMessage = "Pre-Existing"; errEmailRequired.IsValid = false;
                }
                if (email == "1") { return; }
                ViewState["EcodingGradPassword"] = basic.Encrypt(txtPswd.Text, 12);
                mailbody = "Create an account on the online alumni comparison platform. Please enter this code in the confirmation box ";
                if (basic.CheckEmail(txtEmail.Text, mailbody, msgCreate, 1) == true)
                {
                    ViewState["Code"] = basic.Code;
                    dvCrtAcnt.Visible = false; EntCode.Visible = true;
                }
            }
            else if (brnCrt.Text == "تعديل")
            {
                if(Request.QueryString["id"].ToString() != txtNumId.Text)
                {
                    if (Pk_NumId() == true) { return; }
                }

                if (ViewState["Phone"].ToString() != txtPhe.Text)
                {
                    if (Pk_Phone() == true) { return; }
                }
                mailbody = "Your account has been modified successfully. Your result will be sent at a later time";
                if (basic.CheckEmail(Request.QueryString["email"].ToString(), mailbody, msgCreate, 0) == true)
                {
                    string query = "BEGIN PAK_GRAD.INS_GRAD('" + txtNumId.Text + "', '" + txtName.Text + "', '" +
                    txtlName.Text + "', '" + txtfName.Text + "', '" + txtmName.Text + "', '" + txtdate.Text +
                    "', " + float.Parse(txtavg.Text) + ", '" + Splzn.SelectedValue + "', '" + cty.SelectedValue +
                    "', '" + from_cty.SelectedValue + "', '" + RadioShahid.SelectedValue + "', '0', '" + txtPhe.Text +
                    "', " + int.Parse(ViewState["ID_G"].ToString()) + "); END;";
                    access.Ex_SQL(query);
                    Response.Redirect("~/Home/SignIn.aspx");
                }
            }
        }
        protected void CodeConfirm_Click(object sender, EventArgs e)
        {
            if (ViewState["Code"].ToString() == txtCode.Text)
            {
                string query = "BEGIN PAK_GRAD.INS_GRAD('" + txtNumId.Text + "', '" + txtName.Text + "', '" +
                txtlName.Text + "', '" + txtfName.Text + "', '" + txtmName.Text + "', '" + txtdate.Text +
                "', " + float.Parse(txtavg.Text) + ", '" + Splzn.SelectedValue + "', '" + cty.SelectedValue +
                "', '" + from_cty.SelectedValue + "', '" + RadioShahid.SelectedValue + "', '0', '" + txtEmail.Text +
                "', '" + txtPhe.Text + "', '" + ViewState["EcodingGradPassword"].ToString() + "'); END;";
                access.Ex_SQL(query);
                access.Read_Data("ID_GRADUATE", "GRADUATE WHERE GRADUATE_ID_NUMBER = "+ int.Parse(txtNumId.Text));
                access.dataReader.Read();
                Session["Id_G_to_D"] = access.dataReader["ID_GRADUATE"].ToString();
                Response.Redirect($"GraduateDesire.aspx?splz={Splzn.SelectedValue}&avg={float.Parse(txtavg.Text)}");
            }
            else { errCode.Text = "Error Code "; return; }
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
            if (args.Value.Length >= 15) { args.IsValid = true; }
            else { args.IsValid = false; }
        }
        protected void errStartPhe_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length == 10 && int.TryParse(args.Value, out int c) == true)
            {
                try
                {
                    if (args.Value[0] == '0' && args.Value[1] == '9' || args.Value[0] == '0' && args.Value[1] == '1' && args.Value[2] == '1')
                    { args.IsValid = true; }
                    else { args.IsValid = false; }
                }
                catch { args.IsValid = false; }
            }
        }
    }
}