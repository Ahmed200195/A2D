using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Project_for_Al_Aseel_Mosque.Classes;
using System.Web.UI.WebControls;

namespace Project_for_Al_Aseel_Mosque
{
    public partial class AnasBinMalek : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if(!IsPostBack)
            {
                infoStudent.Visible = infoDate.Visible = false;
                DropDownSname.DataSource = access.SelectData("SELECT DISTINCT SNAME, STUDENTS.STUDNO FROM STUDENTS, SCHECK WHERE STUDENTS.STUDNO = SCHECK.STUDNO AND NGROUP = 'AnasBinMalek' ORDER BY 1");
                DropDownSname.DataTextField = "SNAME";
                DropDownSname.DataValueField = "STUDNO";
                DropDownSname.DataBind();
                DropDownSname.Items.Add("----الكل----");
                DropDownDate.DataSource = access.SelectData("SELECT TO_CHAR(TODAY_IS_DATE, 'DD/MM') || ' ' || TO_CHAR(TODAY_IS_DATE, 'DAY') DA, TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') FULDA FROM SCHECK WHERE STUDNO IN (SELECT STUDNO FROM STUDENTS WHERE NGROUP = 'AnasBinMalek' AND STUDNO = " + DropDownSname.SelectedValue + ") GROUP BY TO_CHAR(TODAY_IS_DATE, 'DD/MM'),TO_CHAR(TODAY_IS_DATE, 'DAY'),TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') ORDER BY 1");
                DropDownDate.DataTextField = "DA"; DropDownDate.DataValueField = "FULDA"; DropDownDate.DataBind();
                DropDownDate.Items.Add("----الكل----");
                DropDownDate.SelectedIndex = DropDownDate.Items.Count - 1;
                GridView1.DataSource = access.SelectAllData("VALL_ANAS_BIN_MALEK");
                GridView1.DataBind();
            }
        }

        protected void RadioProcess_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(RadioProcess.SelectedIndex.Equals(0))
            {
                infoStudent.Visible = infoDate.Visible = false;
                DropDownSname.SelectedIndex = 0;
                DropDownDate.SelectedIndex = DropDownDate.Items.Count - 1;
                GridView1.DataSource = access.SelectAllData("VALL_ANAS_BIN_MALEK");
            }
            else
            {
                infoStudent.Visible = infoDate.Visible = true;
                GridView1.DataSource = access.SelectData("SELECT STUD_DATE,عدد_صفحات_مسمعة, تقدير,وظيفة, ملاحظات FROM VIEW_CHECK_STUDENT WHERE STUDNO = " + DropDownSname.SelectedValue + " ORDER BY 1");
            }
            GridView1.DataBind();
        }
        private void proces_data()
        {
            if (DropDownSname.SelectedItem.Text.Equals("----الكل----") && DropDownDate.SelectedItem.Text.Equals("----الكل----"))
            {
                GridView1.DataSource = access.SelectAllData("VIEW_FULL_TASK");
            }
            else if (DropDownSname.SelectedItem.Text.Equals("----الكل----") && DropDownDate.SelectedItem.Text != "----الكل----")
            {
                GridView1.DataSource = access.SelectData("SELECT اسم_الطالب,عدد_صفحات_مسمعة, تقدير,وظيفة, ملاحظات FROM VIEW_CHECK_STUDENT WHERE STUD_DATE = '" + DropDownDate.SelectedValue + "' ORDER BY 1");
            }
            else if (DropDownDate.SelectedItem.Text.Equals("----الكل----") && DropDownSname.SelectedItem.Text != "----الكل----")
            {
                GridView1.DataSource = access.SelectData("SELECT STUD_DATE,عدد_صفحات_مسمعة, تقدير,وظيفة, ملاحظات FROM VIEW_CHECK_STUDENT WHERE STUDNO = " + DropDownSname.SelectedValue + " ORDER BY 1");
            }
            else
            {
                GridView1.DataSource = access.SelectData("SELECT عدد_صفحات_مسمعة, تقدير,وظيفة, ملاحظات FROM VIEW_CHECK_STUDENT WHERE STUDNO = " + DropDownSname.SelectedValue + " AND STUD_DATE = '" + DropDownDate.SelectedValue + "' ORDER BY 1");
            }
            GridView1.DataBind();
        }
        protected void DropDownSname_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownSname.SelectedIndex != DropDownSname.Items.Count - 1)
            {
                DropDownDate.DataSource = access.SelectData("SELECT TO_CHAR(TODAY_IS_DATE, 'DD/MM') || ' ' || TO_CHAR(TODAY_IS_DATE, 'DAY') DA, TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') FULDA FROM SCHECK WHERE STUDNO IN (SELECT STUDNO FROM STUDENTS WHERE NGROUP = 'AnasBinMalek' AND STUDNO = " + DropDownSname.SelectedValue + ") GROUP BY TO_CHAR(TODAY_IS_DATE, 'DD/MM'),TO_CHAR(TODAY_IS_DATE, 'DAY'),TO_CHAR(TODAY_IS_DATE, 'DD/MM/YYYY') ORDER BY 1");
                DropDownDate.DataTextField = "DA"; DropDownDate.DataValueField = "FULDA"; DropDownDate.DataBind();
                DropDownDate.Items.Add("----الكل----");
                DropDownDate.SelectedIndex = DropDownDate.Items.Count - 1;
            }
            proces_data();
        }
        protected void DropDownDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            proces_data();
        }
    }
}