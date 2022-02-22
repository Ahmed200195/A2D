using System;
using Hire_Me.Classes;
using System.Net;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Hire_Me
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        Access_DataBase access;
        BasicHireMe basic;
        string Query = "" ; int count = 0, cntemail = 0;
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
                if (Application["CreateAccount"].Equals("Ministry"))
                {
                    changeName.Text += "الوزارة";
                    
                    txtName.MaxLength = 25;
                }
                else if (Application["CreateAccount"].Equals("University"))
                {
                    changeName.Text += "الجامعة";
                    
                    txtName.MaxLength = 25;
                }
                else
                {
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
            else if (basic.CheckTop(txtPswrd.Text, KeyWrd.Pswrd) == true)
            {
                errPwsrd.Text = basic.Msg;
                return true;
            }
            else if (txtPswrd.Text != txtPswedCm.Text)
            {
                errPwsrdCm.Text = "Do not match the password";
                return true;
            }
            return false;
        }
        private bool SendEmail(string to, string msgCreate)
        {
            string from = "king86370@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "In this article you will learn how to send a email using Asp.Net & C#";
            message.Subject = msgCreate;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            NetworkCredential basicCredential1 = new
            NetworkCredential("king86370@gmail.com", "/*-ahmed-*/delwan@#&dn");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
                return true;
            }

            catch (Exception ex)
            {
                return false;
                throw ex;
            }
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
            errPwsrd.Text = "";
            errPwsrdCm.Text = "";
            cntemail = access.Data_Num("EMPHNO", "EMAILPHONE");
            if (Application["CreateAccount"].Equals("Ministry") || Application["CreateAccount"].Equals("University"))
            {
                if (ProcVdtion() == true)
                {
                    return;
                }
                else
                {
                    if (Application["CreateAccount"].Equals("Ministry"))
                    {
                        count = access.Data_Num("ID_MINISTRY", "MINISTRY");
                        Query = "BEGIN " +
                                "INSERT INTO MINISTRY VALUES( " + count + ", 1" + ", '" + txtName.Text + "');" +
                                "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_M, PHONE) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "');" +
                                "END;";
                        access.Ex_DML(Query);
                        Response.Redirect("Home.aspx");
                    }
                    else if(Application["CreateAccount"].Equals("University"))
                    {
                        count = access.Data_Num("ID_UNIVERSITY", "UNIVERSITY");
                        Query = "BEGIN " +
                                "INSERT INTO UNIVERSITY VALUES( " + count + ", 1" + ", '" + txtName.Text + "', '" + from_cty.SelectedValue + "');" +
                                "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_U, PHONE) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "');" +
                                "END;";
                        access.Ex_DML(Query);
                        Response.Redirect("Home.aspx");
                    }
                }
            }
            else
            {
                if (ProcVdtionGr() == true)
                {
                    return;
                }
                else if (ProcVdtion() == true)
                {
                    return;
                }
                else
                {
                    if(SendEmail(txtEmail.Text, "Graduate account created") == false)
                    {
                        errPwsrdCm.Text = "error";
                        return;
                    }
                    else
                    {
                        count = access.Data_Num("ID_GRADUATE", "GRADUATE");
                        Query = "BEGIN " +
                                "INSERT INTO GRADUATE VALUES(" + count + ", '" + txtNumId.Text + "', '" + txtName.Text + "', '" + txtlName.Text + "'," +
                                " '" + txtfName.Text + "', '" + txtmName.Text + "', '" + txtdate.Text + "', " + txtavg.Text + ", '" + Splzn.SelectedValue + "', '" +
                                cty.SelectedValue + "', '" + from_cty.SelectedValue + "', '" + RadioShahid.SelectedValue + "', '0');" +
                                "INSERT INTO EMAILPHONE(EMPHNO, EMAIL, ID_G, PHONE) VALUES(" + cntemail + ", '" + txtEmail.Text + "', " + count + ", '" + txtPhe.Text + "');" +
                                "END;";
                        access.Ex_DML(Query);
                        Response.Redirect("Home.aspx");
                    }
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