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
            if (!IsPostBack)
            {
                GridView1.DataSource = access.SelectData("select * from emp");
                GridView1.DataBind();
            }
            access.ConnectToggel();
        }
    }
}