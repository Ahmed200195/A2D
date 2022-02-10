using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Hire_Me
{
    public class Global : System.Web.HttpApplication
    {
        Access_DataBase access;
        protected void Application_Start(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            var dataAdmin = access.SelectData("SELECT * FROM ADMIN");
            if(dataAdmin.Rows.Count == 0)
            {
                access.ConnectToggel();
                access.Ex_DML("INSERT INTO ADMIN VALUES(1, 'Ahmed', 'Delwan', 'Tawfeek', 'king86370@gmail.com', '123Ahmed.DN123')");
                access.ConnectToggel();
            }

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}