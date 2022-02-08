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
            access = new Access_DataBase();
            access.ConnectToggel();
            access.Ex_DML("insert int nemp(empno) values(1000)");
            GridView1.DataSource = access.ProcessData("select * from nemp");
            GridView1.DataBind();
            access.ConnectToggel();
        }
    }
}