using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.Admin
{
    public partial class MrAdmin : System.Web.UI.MasterPage
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
        }
    }

}