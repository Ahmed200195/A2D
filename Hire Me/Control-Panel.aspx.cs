using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me
{
    public partial class Control_Panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Confirm.Enabled = false;
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {

        }

        protected void Control_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            Confirm.Enabled = true;
        }

        protected void crtMsty_Click(object sender, EventArgs e)
        {
            Application["CreateMinistry"] = 1;
            Response.Redirect("CreateAccount.aspx");
        }

        protected void crtUvsty_Click(object sender, EventArgs e)
        {
            Application["CreateUniversity"] = 2;
            Response.Redirect("CreateAccount.aspx");
        }
    }
}