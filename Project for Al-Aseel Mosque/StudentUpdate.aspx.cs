using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Project_for_Al_Aseel_Mosque.Classes;
using System.Web.UI.WebControls;

namespace Project_for_Al_Aseel_Mosque
{
    public partial class StudentUpdate : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if(!IsPostBack)
            {
                if(DropDownInfoOrMiss.SelectedIndex.Equals(0))
                {
                    infoMission.Visible = false;
                }
            }
        }
        private void ProcessDataBindForDate()
        {
            access.Read_Data("SUM(PAGESNUM), LVL, HOMEWORK, NOTES", "SCHECK WHERE STUDNO = " + DropDownStudents.SelectedValue + " AND TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') = '" + DropDownDate.SelectedItem.Text + "' GROUP BY TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY'), LVL, HOMEWORK, NOTES");
            access.dataReader.Read();
            numpage.Value = access.dataReader["SUM(PAGESNUM)"].ToString();
            lvl.SelectedValue = null;
            if (access.dataReader["LVL"].ToString() != "")
            {
                lvl.Items.FindByText(access.dataReader["LVL"].ToString()).Selected = true;
            }
            hmwork.Value = access.dataReader["HOMEWORK"].ToString();
            notes.Value = access.dataReader["NOTES"].ToString();
        }
        private void ProcessDataBindForStud()
        {
            if (DropDownInfoOrMiss.SelectedIndex.Equals(0))
            {
                Student student = new Student(int.Parse(DropDownStudents.SelectedValue));
                sname.Value = student.Name;
                DropDownClass.DataBind();
                DropDownClass.Items.FindByValue(student.Sclass).Selected = true;
                spho.Value = student.Sphone;
                dpho.Value = student.Dphone;
                mpho.Value = student.Mphone;
                prevhis.Value = student.Previous_history;
                DropDownListTecher.DataBind();
                DropDownListTecher.Items.FindByText(student.Steacher).Selected = true;
            }
            else if (DropDownInfoOrMiss.SelectedIndex.Equals(1))
            {
                DropDownDate.DataSource = access.SelectData("SELECT TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') DA FROM SCHECK WHERE STUDNO = " + DropDownStudents.SelectedValue + " GROUP BY TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') ORDER BY 1");
                DropDownDate.DataTextField = "DA"; DropDownDate.DataBind();
                ProcessDataBindForDate();
            }
        }
        protected void RadioTeacher_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownInfoOrMiss.SelectedIndex.Equals(0))
            {
                DropDownStudents.DataSource = access.SelectData("SELECT SNAME, STUDENTS.STUDNO FROM STUDENTS WHERE NGROUP = '" + RadioTeacher.SelectedValue + "' ORDER BY 1");
            }
            else if (DropDownInfoOrMiss.SelectedIndex.Equals(1))
            {
                DropDownStudents.DataSource = access.SelectData("SELECT DISTINCT SNAME, STUDENTS.STUDNO FROM STUDENTS, SCHECK WHERE NGROUP = '" + RadioTeacher.SelectedValue + "' AND STUDENTS.STUDNO = SCHECK.STUDNO ORDER BY 1");
            }
            DropDownStudents.DataTextField = "SNAME"; DropDownStudents.DataValueField = "STUDNO";
            DropDownStudents.DataBind();
            ProcessDataBindForStud();
        }

        protected void DropDownStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProcessDataBindForStud();
        }

        protected void DropDownDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProcessDataBindForDate();
        }

        protected void DropDownInfoOrMiss_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownInfoOrMiss.SelectedIndex.Equals(0))
            {
                infoStudent.Visible = true;
                infoMission.Visible = false;
                DropDownDate.Items.Clear();
                numpage.Value = hmwork.Value = notes.Value = lvl.SelectedValue = null;
            }
            else if (DropDownInfoOrMiss.SelectedIndex.Equals(1))
            {
                infoStudent.Visible = false;
                infoMission.Visible = true;
                sname.Value = spho.Value = dpho.Value = mpho.Value = prevhis.Value = null;
                DropDownClass.SelectedIndex = 0;
            }
            RadioTeacher.SelectedValue = null;
            DropDownStudents.Items.Clear();
        }

        protected void btnStudentUpd_ServerClick(object sender, EventArgs e)
        {
            string Query = "";
            if (DropDownInfoOrMiss.SelectedIndex.Equals(0))
            {
                Student student = new Student(DropDownStudents.SelectedValue, sname.Value, DropDownClass.SelectedValue, spho.Value, dpho.Value, mpho.Value, DropDownListTecher.SelectedItem.Text, DropDownListTecher.SelectedValue, prevhis.Value);
                student.Exeute("UPDATE", student);
                sname.Value = spho.Value = dpho.Value = mpho.Value = prevhis.Value = null;
                DropDownClass.SelectedIndex = 0;
            }
            else if (DropDownInfoOrMiss.SelectedIndex.Equals(1))
            {
                Query = "BEGIN UPDATE SCHECK SET PAGESNUM = '" + numpage.Value + "', LVL = '" + lvl.SelectedItem.Text + "', HOMEWORK = '" + hmwork.Value + "', NOTES = '" + notes.Value + "' WHERE STUDNO = " + DropDownStudents.SelectedValue + " AND TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') = '" + DropDownDate.SelectedItem.Text + "'; END;";
                DropDownDate.Items.Clear();
                numpage.Value = hmwork.Value = notes.Value = lvl.SelectedValue = null;
                access.Ex_SQL(Query);
            }
            RadioTeacher.SelectedValue = null;
            DropDownStudents.Items.Clear();
        }
    }
}