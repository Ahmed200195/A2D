using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hire_Me.Classes;
using System.Data;

namespace Hire_Me
{
    public partial class SignIn : Page
    {
        Access_DataBase access;
        BasicHireMe basic;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            basic = new BasicHireMe();
            int i = 0;
            GridView1.DataSource = access.SelectAllData("ADMIN");
            GridView1.DataBind();
            access.Read_Data("ID_ADMIN", "ADMIN");
            while (access.dataReader.Read())
            {
                i++;
            }
            cnt.Text = i.ToString();
        }

        protected void btn_lgin_Click(object sender, EventArgs e)
        {
            string decode = basic.Encrypt(txt_pswd.Text, 12);
            access.Read_Data("PAK_MINI_UNVI.FUNCHSIGN('" + txt_email.Text + "', '" + decode + "') AS FCHSIGN", "DUAL");
            access.dataReader.Read();
            switch (access.dataReader["FCHSIGN"].ToString())
            {
                case "A":
                    access.Read_Data("PAK_MINI_UNVI.FUNSIGNIN('" + txt_email.Text + "', '" + decode + "', 'A') AS FSIGNIN", "DUAL");
                    access.dataReader.Read();
                    Session["Admin"] = access.dataReader["FSIGNIN"].ToString();
                    Response.Redirect("~/Admin/Control-Panel.aspx");
                    break;
                case "M":
                    access.Read_Data("PAK_MINI_UNVI.FUNSIGNIN('" + txt_email.Text + "', '" + decode + "', 'M') AS FSIGNIN", "DUAL");
                    access.dataReader.Read();
                    Session["Ministry"] = access.dataReader["FSIGNIN"].ToString();
                    Response.Redirect("~/Ministry/Vacancy.aspx?VacCond=0");
                    break;
                case "U":
                    access.Read_Data("PAK_MINI_UNVI.FUNSIGNIN('" + txt_email.Text + "', '" + decode + "', 'U') AS FSIGNIN", "DUAL");
                    access.dataReader.Read();
                    Session["Admin"] = access.dataReader["FSIGNIN"].ToString();
                    Response.Redirect("");
                    break;
                case "G":
                    access.Read_Data("PAK_MINI_UNVI.FUNSIGNIN('" + txt_email.Text + "', '" + decode + "', 'G') AS FSIGNIN", "DUAL");
                    access.dataReader.Read();
                    Session["Admin"] = access.dataReader["FSIGNIN"].ToString();
                    Response.Redirect("~/Home/GraduateResult.aspx");
                    break;
                default:
                    break;
            }
        }
    }
}