using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Hire_Me
{
    public partial class CreateAccount : Page
    {
        Access_DataBase access = new Access_DataBase();
        BasicHireMe basic = new BasicHireMe();
        string Query = ""; string Account = "", Admin = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Application["Admin"].Equals(""))
                {
                    Account = Request.QueryString["Account"].ToString();
                    Admin = Request.QueryString["Admin"].ToString();
                }
                cty.DataSource = from_cty.DataSource = access.SelectAllData("Country");
                cty.DataTextField = from_cty.DataTextField = "CNAME";
                cty.DataValueField = from_cty.DataValueField = "CVALUE";
                cty.DataBind(); from_cty.DataBind();
                EntCode.Visible = false;

                switch (Account+Admin)
                {
                    case "CreateMinistryAdmin":
                    case "UpdateMinistryAdmin":
                    case "CreateUniversityAdmin":
                    case "UpdateUniversityAdmin":
                        errlnameRequired.Enabled = false;
                        errlnameNoNum.Enabled = false;
                        errfnameRequired.Enabled = false;
                        errfnameNoNum.Enabled = false;
                        errmnameRequired.Enabled = false;
                        errmnameNoNum.Enabled = false;
                        errNumId.Enabled = false;
                        errNumIdTen.Enabled = false;
                        errdateRequired.Enabled = false;
                        errDate.Enabled = false;
                        erravg.Enabled = false;
                        erravgerage.Enabled = false;
                        break;
                }
                switch (Account)
                {
                    case "CreateMinistryAdmin":
                    case "UpdateMinistryAdmin":
                        ViewState["NameAccount"] = "Ministry";
                        changeName.Text += "الوزارة";
                        txtName.MaxLength = 25;
                        if (Application["Account"].Equals("UpdateMinistry"))
                        {
                            access.Read_Data("MINISTRY_NAME, PHONE", "MINISTRY M, EMAILPHONE P WHERE M.ID_MINISTRY = P.ID_M AND M.ID_MINISTRY = " + int.Parse(Request.QueryString["id_option"]));
                            access.dataReader.Read();
                            txtName.Text = (string)access.dataReader["MINISTRY_NAME"];
                            txtPhe.Text = (string)access.dataReader["PHONE"];
                        }
                        break;
                    case "CreateUniversityAdmin":
                    case "UpdateUniversityAdmin":
                        ViewState["NameAccount"] = "University";
                        changeName.Text += "الجامعة";
                        txtName.MaxLength = 25;
                        if (Application["Account"].Equals("UpdateUniversity"))
                        {
                            access.Read_Data("UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE", "UNIVERSITY U, EMAILPHONE P WHERE U.ID_UNIVERSITY = P.ID_U AND U.ID_UNIVERSITY = " + int.Parse(Request.QueryString["id_option"]));
                            access.dataReader.Read();
                            txtName.Text = (string)access.dataReader["UNIVERSITY_NAME"];
                            txtPhe.Text = (string)access.dataReader["PHONE"];

                            for (int i = 0; i < cty.Items.Count; i++)
                            {
                                if (cty.Items[i].Value == (string)access.dataReader["UNIVERSITY_COUNTRY"])
                                {
                                    cty.Items[i].Selected = true;
                                }
                            }
                        }
                        break;
                    default:
                        ViewState["NameAccount"] = "Graduate";
                        changeName.Text += "الطالب";
                        txtName.MaxLength = txtmName.MaxLength = 20;
                        txtfName.MaxLength = 15;
                        break;
                }
            }
            switch (Account+Admin)
            {
                case "UpdateMinistryAdmin":
                case "UpdateUniversityAdmin":
                    Response.Write("<style> .dvCrtEmail{display : none}</style>");
                    brnCrt.Text = "تعديل";
                    if (Account + Admin== "UpdateMinistryAdmin")
                    {
                        tlpage.Text += "Ministry";
                        Response.Write("<style> .gradInfo, .gradUnInfo{display : none}</style>");
                    }
                    else if (Account + Admin == "UpdateUniversityAdmin")
                    {
                        tlpage.Text += "University";
                        gradInfo.EnableTheming = false;
                        Response.Write("<style> .gradInfo{display : none}</style>");
                    }
                    break;
                case "CreateMinistryAdmin":
                    tlpage.Text += "Ministry";
                    Response.Write("<style> .gradInfo, .gradUnInfo{display : none}</style>");
                    break;
                case "CreateUniversityAdmin":
                    tlpage.Text += "University";
                    Response.Write("<style> .gradInfo{display : none}</style>");
                    break;
                default:
                    tlpage.Text += "Graduate";
                    break;
            }
        }
        protected void brnCrt_Click(object sender, EventArgs e)
        {
            errPheCh.Text = "";
            errEmailCh.Text = "";
            if (Application["Account"].Equals(""))
            {
                errNumIdCh.Text = "";
                if (basic.Existing_data(txtNumId.Text, "GRADUATE_ID_NUMBER", "GRADUATE") == true)
                {
                    errNumIdCh.Text = basic.Msg;
                    return;
                }
            }
            if(basic.Existing_data(txtPhe.Text, "PHONE", "EMAILPHONE") == true)
            {
                errPheCh.Text = basic.Msg;
                return;
            }
            else if (basic.Existing_data(txtEmail.Text, "EMAIL", "EMAILPHONE") == true)
            {
                errEmailCh.Text = basic.Msg;
                return;
            }
            // send code for check
            //if (basic.CheckEmail(txtEmail.Text, "Code To Make Sure", KeyWrd.Code) == false)
            //{
            //    errCode.Text = "Error " + basic.Msg;
            //    return;
            //}
            //else
            //{
                EntCode.Visible = true;
                AllInfo.Visible = false;
                ViewState["Code"] = basic.Code;
                ViewState["PassWord"] = basic.Encrypt(txtPswd.Text, 13);
            //}
        }
        protected void CodeConfirm_Click(object sender, EventArgs e)
        {
            //if(ViewState["Code"].ToString() == txtCode.Text)
            //{
                if (Application["Account"].Equals(""))
                {
                    Query = "BEGIN " +
                            "INS_GRAD(" + txtNumId.Text + ", '" + txtName.Text + "', '" + txtlName.Text + "'," +
                                "'" + txtfName.Text + "', '" + txtmName.Text + "', '" + txtdate.Text + "', "
                                + txtavg.Text + ", '" + Splzn.SelectedValue + "', '" + cty.SelectedValue + "', '" +
                                from_cty.SelectedValue + "', '" + RadioShahid.SelectedValue + "', '0'" +
                                ", '" + txtEmail.Text + "', '" + txtPhe.Text + "', '" + ViewState["PassWord"].ToString() + "');" +
                            "END;";
                }
                else if (Application["Account"].Equals("Ministry"))
                {
                    Query = "BEGIN " +
                            "INS_MINI('" + txtName.Text + "', '" + txtEmail.Text + "', '" + txtPhe.Text + "', '" + ViewState["PassWord"].ToString() + "');" +
                            "END;";
                }
                else if (Application["Account"].Equals("University")) 
                {
                    //count = access.Data_Num("ID_UNIVERSITY", "UNIVERSITY");
                    //Query = "BEGIN " +
                    //        "INSERT INTO UNIVERSITY VALUES( " + count + ", 1" + ", '" + txtName.Text + "', '" + from_cty.SelectedValue + "');" +
                    //        "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_U, PHONE, PASSWORD) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "', '" + ViewState["PassWord"] + "');" +
                    //        "END;";
                }
                access.Ex_DML(Query);
                //Account created
                basic.CheckEmail(txtEmail.Text, ViewState["NameAccount"].ToString() + " Account Created", KeyWrd.Email);
                Response.Redirect("Home.aspx");
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
            if(args.Value.Length >= 15)
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
            if (args.Value.Length == 10)
            {
                if (int.TryParse(args.Value, out int c) == false)
                {
                    args.IsValid = true;
                }
                else
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
}