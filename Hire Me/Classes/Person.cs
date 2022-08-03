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
}