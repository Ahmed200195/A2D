using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;

namespace Hire_Me.Classes
{
    public class Access_DataBase
    {
        OracleConnection connection;
        string name_con;
        public Access_DataBase()
        {
            name_con = ConfigurationManager.ConnectionStrings["tcc_con"].ConnectionString;
            connection = new OracleConnection(name_con);
        }
    }
}