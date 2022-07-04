using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Project_for_Al_Aseel_Mosque.Classes;
using System.Threading;
using System.Web.UI.WebControls;

namespace Project_for_Al_Aseel_Mosque.Anas_bin_Malik_Episode
{
    public partial class StudentAdd : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
        }

        protected void btnStudentAdd_ServerClick(object sender, EventArgs e)
        {
            Student student = new Student(null, sname.Value, DropDownClass.SelectedValue, spho.Value, dpho.Value, mpho.Value, RadioTeacher.SelectedItem.Text, RadioTeacher.SelectedValue, null);
            student.Exeute("INSERT", student);
            sname.Value = spho.Value = dpho.Value = mpho.Value = "";
        }
    }
}