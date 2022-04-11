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
        RadioButtonList Option_Mini_Uni;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            Option_Mini_Uni = this.Master.FindControl("Option_Mini_Uni") as RadioButtonList;
            Option_Mini_Uni.Enabled = false;
            if (!IsPostBack)
            {
                try
                {
                    string Q_Admin = Request.QueryString["Admin"].ToString();
                    if (Q_Admin == "Admin")
                    {
                        string Q_crt = Request.QueryString["Account"].ToString();
                        if(Q_crt == "UpCreateMinistry" || Q_crt == "UpCreateUniversity")
                        {
                            string id_option = Request.QueryString["id_option"].ToString();
                            lemail.Enabled = false; lemail.Visible = false;
                            txtEmail.Enabled = false; txtEmail.Visible = false;
                            errEmailCh.Enabled = false; errEmailCh.Visible = false;
                            errEmailRequired.Enabled = false; errEmailRequired.Visible = false;
                            errEmailConding.Enabled = false; errEmailConding.Visible = false;
                            errGmail.Enabled = false; errGmail.Visible = false;
                            lpswd.Enabled = false; lpswd.Visible = false;
                            txtPswd.Enabled = false; txtPswd.Visible = false;
                            errPswd.Enabled = false; errPswd.Visible = false;
                            errPasswordCh.Enabled = false; errPasswordCh.Visible = false;
                            lpswdcm.Enabled = false; lpswdcm.Visible = false;
                            txtPswdCm.Enabled = false; txtPswdCm.Visible = false;
                            errPswdCm.Enabled = false; errPswdCm.Visible = false;
                            errPswdCompare.Enabled = false; errPswdCompare.Visible = false;
                            infoemail.Visible = false; brnCrt.Text = "تعديل";
                        }
                        if (Q_crt == "CreateMinistry" || Q_crt == "UpCreateMinistry")
                        {
                            titPage.InnerText += " Ministry";
                            changeName.Text += "الوزارة";
                            governorate.Visible = false;
                            lgover.Enabled = false; lgover.Visible = false;
                            from_cty.Enabled = false; from_cty.Visible = false;
                            if (Q_crt == "UpCreateMinistry")
                            {
                                access.Read_Data("MINISTRY_NAME, PHONE", "MINISTRY M, EMAILPHONE P WHERE M.ID_MINISTRY = P.ID_M AND M.ID_MINISTRY = " + int.Parse(Request.QueryString["id_option"]));
                                access.dataReader.Read();
                                txtName.Text = (string)access.dataReader["MINISTRY_NAME"];
                                txtPhe.Text = (string)access.dataReader["PHONE"];
                            }
                        }
                        else if(Q_crt == "CreateUniversity" || Q_crt == "UpCreateUniversity")
                        {
                            titPage.InnerText += " University";
                            changeName.Text += "الجامعة";
                            from_cty.DataSource = access.SelectAllData("Country ORDER BY CVALUE");
                            from_cty.DataTextField = "CNAME";
                            from_cty.DataValueField = "CVALUE";
                            from_cty.DataBind();
                            if (Q_crt == "UpCreateUniversity")
                            {
                                access.Read_Data("UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE", "UNIVERSITY U, EMAILPHONE P WHERE U.ID_UNIVERSITY = P.ID_U AND U.ID_UNIVERSITY = " + int.Parse(Request.QueryString["id_option"]));
                                access.dataReader.Read();
                                txtName.Text = (string)access.dataReader["UNIVERSITY_NAME"];
                                txtPhe.Text = (string)access.dataReader["PHONE"];
                                for (int i = 0; i < from_cty.Items.Count; i++)
                                {
                                    if (from_cty.Items[i].Value == (string)access.dataReader["UNIVERSITY_COUNTRY"])
                                    {
                                        from_cty.Items[i].Selected = true;
                                        return;
                                    }
                                }
                            }
                        }
                        infoemail.Visible = false;
                        EntCode.Visible = false;
                        brnCrt.Text = "التالي <";
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
        protected void BrnCrt_Click(object sender, EventArgs e)
        {
            errNameRequired.IsValid = true;
            errEmailRequired.IsValid = true;
            errPhe.IsValid = true;
            if (brnCrt.Text == "التالي <")
            {
                string name = "", phone = "";
                if (Request.QueryString["Account"].ToString() == "CreateMinistry")
                {
                    access.Read_Data("PAK_MINI_UNIV.FUNCHECK('" + txtName.Text + "', 0, 'NAME') AS RESCH", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["RESCH"].ToString() == "1")
                    {
                        name = "1";
                        errNameRequired.ErrorMessage = "Pre-existing";
                        errNameRequired.IsValid = false;
                    }
                    access.Read_Data("PAK_MINI_UNIV.FUNCHECK('" + txtPhe.Text + "', 0, 'PHONE') AS RESCH", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["RESCH"].ToString() == "1")
                    {
                        phone = "1";
                        errPhe.ErrorMessage = "Pre-existing";
                        errPhe.IsValid = false;
                    }
                    if(name == "1" || phone == "1")
                    {
                        return;
                    }
                }
                else if (Request.QueryString["Account"].ToString() == "CreateUniversity")
                {
                    access.Read_Data("PAK_MINI_UNIV.FUNCHECK('" + txtName.Text + "', 1, 'NAME') AS RESCH", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["RESCH"].ToString() == "1")
                    {
                        name = "1"; errNameRequired.ErrorMessage = "Pre-existing";
                        errNameRequired.IsValid = false;
                    }
                    access.Read_Data("PAK_MINI_UNIV.FUNCHECK('" + txtPhe.Text + "', 1, 'PHONE') AS RESCH", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["RESCH"].ToString() == "1")
                    {
                        phone = "1"; errPhe.ErrorMessage = "Pre-existing";
                        errPhe.IsValid = false;
                    }
                    if (name == "1" || phone == "1")
                    {
                        return;
                    }
                }
                infonaming.Visible = false;
                governorate.Visible = false;
                infoemail.Visible = true;
                brnCrt.Text = "إنشاء حساب";
                return;
            }
            else if(brnCrt.Text == "إنشاء حساب")
            {
                
                if (Request.QueryString["Account"].ToString() == "CreateMinistry")
                {
                    access.Read_Data("PAK_MINI_UNIV.FUNCHECK('" + txtEmail.Text + "', 0, 'EMAIL') AS RESCH", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["RESCH"].ToString() == "1")
                    {
                        errEmailRequired.ErrorMessage = "Pre-existing";
                        errEmailRequired.IsValid = false; return;
                    }
                }
                else if (Request.QueryString["Account"].ToString() == "CreateUniversity")
                {
                    access.Read_Data("PAK_MINI_UNIV.FUNCHECK('" + txtEmail.Text + "', 1, 'EMAIL') AS RESCH", "DUAL");
                    access.dataReader.Read();
                    if (access.dataReader["RESCH"].ToString() == "1")
                    {
                        errEmailRequired.ErrorMessage = "Pre-existing";
                        errEmailRequired.IsValid = false; return;
                    }
                }
                infonaming.Visible = false;
                infoemail.Visible = false;
                EntCode.Visible = true;
                brnCrt.Text = "تأكيد";
                return;
            }
            else
            {
                Response.Redirect("~/Home.aspx");
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