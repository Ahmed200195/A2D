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
    public partial class Home : System.Web.UI.Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                access = new Access_DataBase();
                access.ConnectToggel();
                GridView1.DataSource = access.ProcessData("select * from nemp");
                GridView1.DataBind();
            }
            access.red("select * from nemp");
            while (access.dataReader.Read())
            {
                Label1.Text += (string)access.dataReader["ENAME"].ToString() + "<br>";
            }
            access.ConnectToggel();
        }
    }
}