using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hire_Me.Classes
{
    public class ClsGraduate : Person
    {
        string father, mather, date, shahid, univCountry, specialize, avg;

        public string Father { get => father; set => father = value; }
        public string Mather { get => mather; set => mather = value; }
        public string Date { get => date; set => date = value; }
        public string Shahid { get => shahid; set => shahid = value; }
        public string UnivCountry { get => univCountry; set => univCountry = value; }
        public string Specialize { get => specialize; set => specialize = value; }
        public string Avg { get => avg; set => avg = value; }

        public ClsGraduate(long id)
        {
            access.Read_Data("*", "GRADUATE, EMAILPHONE WHERE ID_GRADUATE = ID_G AND GRADUATE_ID_NUMBER = " + id);
            access.dataReader.Read();
            Id = int.Parse(access.dataReader["ID_GRADUATE"].ToString());
            Name = access.dataReader["GRADUATE_FIRST_NAME"].ToString() + ' ' + access.dataReader["GRADUATE_LAST_NAME"].ToString();
            Father = access.dataReader["GRADUATE_FATHER_NAME"].ToString();
            Mather = access.dataReader["GRADUATE_MOTHER_NAME"].ToString();
            Shahid = access.dataReader["GRADUATE_SHAHID"].ToString();
            Date = access.dataReader["GRADUATE_DATE"].ToString();
            Avg = access.dataReader["GRADUATE_AVG"].ToString();
            UnivCountry = access.dataReader["GRADUATE_UNIVERSITY_COUNTRY"].ToString();
            Specialize = access.dataReader["GRADUATE_PROFESSION"].ToString();
            Country = access.dataReader["GRADUATE_RESIDENT_COUNTRY"].ToString();
            Phone = int.Parse(access.dataReader["PHONE"].ToString());
            Email = access.dataReader["EMAIL"].ToString();
            Pass = access.dataReader["PASSWORD"].ToString();
        }
    }
}