using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Project_for_Al_Aseel_Mosque.Classes;
using System.Web.UI.WebControls;

namespace Project_for_Al_Aseel_Mosque
{
    public partial class StudentMission : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
        }

        protected void btnMissionAdd_ServerClick(object sender, EventArgs e)
        {
            string Query = "BEGIN INSERT INTO SCHECK VALUES(" + DropDownStudents.SelectedValue + ",SYSDATE," + numpage.Value + ",'" + lvl.SelectedItem.Text + "','" + hmwork.Value + "','" + notes.Value + "'); END;";
            access.Ex_SQL(Query);
            numpage.Value = hmwork.Value = notes.Value = "";
            lvl.SelectedValue.Equals(null);
        }

        protected void RadioTeacher_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Query = "";
            Query = "SELECT STUDNO, SNAME || ' (' || SCLASS || ') ' FULLNAME FROM STUDENTS WHERE NGROUP = '" + RadioTeacher.SelectedValue + "' ORDER BY SNAME";
            DropDownStudents.DataSource = access.SelectData(Query);
            DropDownStudents.DataTextField = "FULLNAME";
            DropDownStudents.DataValueField = "STUDNO";
            DropDownStudents.DataBind();
        }
    }
}