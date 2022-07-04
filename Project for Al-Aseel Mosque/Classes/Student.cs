using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_for_Al_Aseel_Mosque.Classes
{
    abstract class Information
    {
        string id, name;
        protected Access_DataBase access = new Access_DataBase();
        public string Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
    }
    class Student : Information
    {
        string  sclass, sphone, dphone, mphone, steacher, ngroup, previous_history;
        public string Sclass { get => sclass; set => sclass = value; }
        public string Sphone { get => sphone; set => sphone = value; }
        public string Dphone { get => dphone; set => dphone = value; }
        public string Mphone { get => mphone; set => mphone = value; }
        public string Steacher { get => steacher; set => steacher = value; }
        public string Ngroup { get => ngroup; set => ngroup = value; }
        public string Previous_history { get => previous_history; set => previous_history = value; }

        public Student() { }
        public Student(int studno)
        {
            access.Read_Data("STUDNO, SNAME, SCLASS, SPHONE, DPHONE, MPHONE, STEACHER, NGROUP, PREVIOUS_HISTORY", "STUDENTS WHERE STUDNO = " + studno);
            access.dataReader.Read();
            Id = access.dataReader["STUDNO"].ToString();
            Name = access.dataReader["SNAME"].ToString();
            Sclass = access.dataReader["SCLASS"].ToString();
            Sphone = access.dataReader["SPHONE"].ToString();
            Dphone = access.dataReader["DPHONE"].ToString();
            Mphone = access.dataReader["MPHONE"].ToString();
            Steacher = access.dataReader["STEACHER"].ToString();
            Ngroup = access.dataReader["NGROUP"].ToString();
            Previous_history = access.dataReader["PREVIOUS_HISTORY"].ToString();
        }
        public Student(string id, string name, string sclass, string sphone, string dphone, string mphone, string steacher, string ngroup, string previous_history)
        {
            Id = id;
            Name = name;
            Sclass = sclass;
            Sclass = sclass;
            Sphone = sphone;
            Dphone = dphone;
            Mphone = mphone;
            Steacher = steacher;
            Ngroup = ngroup;
            Previous_history = previous_history;
        }
        public void Exeute(string process, Student student)
        {
            string Query = "";
            switch (process)
            {
                case "INSERT":
                    Query = "BEGIN INSERT INTO STUDENTS VALUES(NULL, '" + student.Name + "','" + student.Sclass +
                    "','" + student.Sphone + "' ,'" + student.Dphone + "' ,'" + student.Mphone + "' ,'" + student.Steacher 
                    + "' ,'" + student.Ngroup + "' , '" + student.Previous_history + "'); END;";
                    break;
                case "UPDATE":
                    Query = "BEGIN UPDATE STUDENTS SET SNAME = '" + student.Name + "', SCLASS = '" + student.Sclass + "', SPHONE = '" 
                    + student.Sphone + "', DPHONE = '" + student.Dphone + "', MPHONE = '" + student.Mphone + "', STEACHER = '" 
                    + student.Steacher + "', NGROUP = '" + student.Ngroup + "', PREVIOUS_HISTORY = '" + student.Previous_history 
                    + "' WHERE STUDNO = " + int.Parse(student.Id) + "; END;";
                    break;
                case "DELETE":
                    
                    break;
            }
            access.Ex_SQL(Query);
        }
    }
}