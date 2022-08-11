using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hire_Me.Classes
{
    public class ClsUniversity : Person
    {
        public ClsUniversity() { }
        public ClsUniversity(int id)
        {
            access.Read_Data("*", "UNIVERSITY , EMAILPHONE WHERE ID_UNIVERSITY = ID_U AND ID_UNIVERSITY = " + id);
            access.dataReader.Read();
            Id = int.Parse(access.dataReader["ID_UNIVERSITY"].ToString());
            Name = access.dataReader["UNIVERSITY_NAME"].ToString();
            Email = access.dataReader["EMAIL"].ToString();
            Pass = access.dataReader["PASSWORD"].ToString();
            Phone = int.Parse(access.dataReader["PHONE"].ToString());
            Country = access.dataReader["UNIVERSITY_COUNTRY"].ToString();
        }
    }
}