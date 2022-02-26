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
        string Query = ""; int count = 0, cntemail = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cty.DataSource = from_cty.DataSource = access.SelectAllData("Country");
                cty.DataTextField = from_cty.DataTextField = "CNAME";
                cty.DataValueField = from_cty.DataValueField = "CVALUE";
                cty.DataBind(); from_cty.DataBind();
                EntCode.Visible = false;
                if (Application["CreateAccount"].Equals("Ministry"))
                {
                    ViewState["NameAccount"] = "Ministry";
                    changeName.Text += "الوزارة";
                    txtName.MaxLength = 25;
                }
                else if (Application["CreateAccount"].Equals("University"))
                {
                    ViewState["NameAccount"] = "University";
                    changeName.Text += "الجامعة";
                    txtName.MaxLength = 25;
                }
                else
                {
                    ViewState["NameAccount"] = "Graduate";
                    changeName.Text += "الطالب";
                    txtName.MaxLength  = txtmName.MaxLength = 20;
                    txtfName.MaxLength = 15;
                }
            }
            if (Application["CreateAccount"].Equals("Ministry"))
            {
                tlpage.Text += "Ministry";
                Response.Write("<style> .gradInfo, .gradUnInfo{display : none}</style>");
            }
            else if (Application["CreateAccount"].Equals("University"))
            {
                tlpage.Text += "University";
                Response.Write("<style> .gradInfo{display : none}</style>");
            }
            else
            {
                tlpage.Text += "Graduate"; 
            }
        }
        private bool ProcVdtionGr()
        {
            if (basic.CheckTop(txtName.Text, KeyWrd.Name) == true)
            {
                errName.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtlName.Text, KeyWrd.Name) == true)
            {
                errlname.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtfName.Text, KeyWrd.Name) == true)
            {
                errfname.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtmName.Text, KeyWrd.Name) == true)
            {
                errmname.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtNumId.Text, KeyWrd.idNum) == true)
            {
                errNumId.Text = basic.Msg;
                return true;
            }
            else if (DateTime.TryParse(txtdate.Text, out DateTime s) == false)
            {
                errDate.Text = "empty date value";
                return true;
            }
            else if (basic.CheckTop(txtavg.Text, KeyWrd.Avg) == true)
            {
                erravg.Text = basic.Msg;
                return true;
            }
            return false;
        }
        private bool ProcVdtion()
        {
            if (basic.CheckTop(txtName.Text, KeyWrd.Name) == true)
            {
                errName.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtPhe.Text, KeyWrd.Phone) == true)
            {
                errPhe.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtEmail.Text, KeyWrd.Email) == true)
            {
                errEmail.Text = basic.Msg;
                return true;
            }
            else if (basic.CheckTop(txtPswd.Text, KeyWrd.Pswd) == true)
            {
                errPswd.Text = basic.Msg;
                return true;
            }
            else if (txtPswdCm.Text != txtPswd.Text)
            {
                errPswdCm.Text = "Passwords do not match";
                return true;
            }
            return false;
        }
        protected void brnCrt_Click(object sender, EventArgs e)
        {
            errName.Text = "";
            errlname.Text = "";
            errfname.Text = "";
            errmname.Text = "";
            errNumId.Text = "";
            errDate.Text = "";
            erravg.Text = "";
            errPhe.Text = "";
            errEmail.Text = "";
            errPswd.Text = "";
            errPswdCm.Text = "";
            errCode.Text = "";
            cntemail = access.Data_Num("EMPHNO", "EMAILPHONE");

            if (ProcVdtion() == true)
            {
                return;
            }
            else if (Application["CreateAccount"].Equals("Default") && ProcVdtionGr() == true)
            {
                return;
            }
            else
            {
                // send code for check
                if (basic.CheckEmail(txtEmail.Text, "Code To Make Sure", KeyWrd.Code) == false) 
                {
                    errCode.Text = "error " + basic.Msg;
                    return;
                }
                else
                {
                    EntCode.Visible = true;
                    AllInfo.Visible = false;
                    ViewState["Code"] = basic.Code;
                    ViewState["PassWord"] = basic.Encrypt(txtPswd.Text, 13);
                }
            }
           
        }

        protected void CodeConfirm_Click(object sender, EventArgs e)
        {
            if(ViewState["Code"].ToString() == txtCode.Text)
            {
                if (Application["CreateAccount"].Equals("Default"))
                {
                    count = access.Data_Num("ID_GRADUATE", "GRADUATE");
                    Query = "BEGIN " +
                            "INSERT INTO GRADUATE VALUES(" + count + ", '" + txtNumId.Text + "', '" + txtName.Text + "', '" + txtlName.Text + "'," +
                            " '" + txtfName.Text + "', '" + txtmName.Text + "', '" + txtdate.Text + "', " + txtavg.Text + ", '" + Splzn.SelectedValue + "', '" +
                            cty.SelectedValue + "', '" + from_cty.SelectedValue + "', '" + RadioShahid.SelectedValue + "', '0');" +
                            "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_G, PHONE, PASSWORD) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "', '" + ViewState["PassWord"] + "');" +
                            "END;";
                }
                else if (Application["CreateAccount"].Equals("Ministry"))
                {
                    count = access.Data_Num("ID_MINISTRY", "MINISTRY");
                    Query = "BEGIN " +
                            "INSERT INTO MINISTRY VALUES( " + count + ", 1" + ", '" + txtName.Text + "');" +
                            "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_M, PHONE, PASSWORD) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "', '" + ViewState["PassWord"] + "');" +
                            "END;";
                }
                else if (Application["CreateAccount"].Equals("University")) 
                {
                    count = access.Data_Num("ID_UNIVERSITY", "UNIVERSITY");
                    Query = "BEGIN " +
                            "INSERT INTO UNIVERSITY VALUES( " + count + ", 1" + ", '" + txtName.Text + "', '" + from_cty.SelectedValue + "');" +
                            "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_U, PHONE, PASSWORD) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "', '" + ViewState["PassWord"] + "');" +
                            "END;";
                }
                access.Ex_DML(Query);
                //Account created
                basic.CheckEmail(txtEmail.Text, ViewState["NameAccount"].ToString() + " Account Created", KeyWrd.Email);
                Response.Redirect("Home.aspx");
            }
            else
            {
                errCode.Text = "Error Code ";
                return;
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