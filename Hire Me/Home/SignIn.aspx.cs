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
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
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
    }
}