using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hire_Me.Classes
{
    abstract public class Person
    {
        private string name, email, pass;
        private int id, phone;

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Email { get => email; set => email = value; }
        public string Pass { get => pass; set => pass = value; }
        public int Phone { get => phone; set => phone = value; }

        public Person() { }

        protected Access_DataBase access = new Access_DataBase();
    }
    class Admin : Person
    {
        public Admin()
        {
            Email = "king86370@gmail.com";
            Pass = "=>?Mtyqp:PZ=>?";
        }
    }
    class Ministry : Person
    {

    }
    class University : Person
    {
        private string country;
        public string Country { get => country; set => country = value; }
        public University() { }
        public University(int id)
        {
            access.Read_Data("*", "UNIVERSITY , EMAILPHONE WHERE ID_UNIVERSITY = ID_U AND ID_UNIVERSITY = " + id);
            Id = int.Parse(access.dataReader["ID_UNIVERSITY"].ToString());
            Name = access.dataReader["UNIVERSITY_NAME"].ToString();
            Email = access.dataReader["EMAIL"].ToString();
            Pass = access.dataReader["PASSWORD"].ToString();
            Phone = int.Parse(access.dataReader["PHONE"].ToString());
            Country = access.dataReader["UNIVERSITY_COUNTRY"].ToString();
        }

    }
    class Graduate : Person
    {

    }
}