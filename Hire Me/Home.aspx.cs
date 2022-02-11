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
            if (!IsPostBack)
            {
                GridView1.DataSource = access.SelectData("SELECT * FROM ADMIN");
                GridView1.DataBind();
            }
        }
    }
}