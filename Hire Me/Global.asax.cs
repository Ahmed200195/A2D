﻿using System;
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
            access.ConnectToggel();
            Application["CreateAccount"] = "";
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
            access.ConnectToggel();
        }
    }
}