using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hire_Me.Classes;

namespace Hire_Me.University
{
    public partial class GraduateCheck : Page
    {
        Access_DataBase access; ClsUniversity university; ClsGraduate graduate;
        BasicHireMe hireMe; DataTable gradData;
        public void FillData(int i)
        {
            try
            {
                lpNumId.Text = gradData.Rows[i][1].ToString();
                lpfName.Text = gradData.Rows[i][2].ToString();
                lplName.Text = gradData.Rows[i][3].ToString();
                lpfaName.Text = gradData.Rows[i][4].ToString();
                lpmaName.Text = gradData.Rows[i][5].ToString();
                lpdate.Text = gradData.Rows[i][6].ToString();
                lpavg.Text = gradData.Rows[i][7].ToString();
                lpspec.Text = gradData.Rows[i][8].ToString();
                lpshahid.Text = gradData.Rows[i][12].ToString();
            }
            catch
            {
                lpNumId.Text = lpfName.Text = lplName.Text = lpfaName.Text = lpmaName.Text = lpavg.Text = lpdate.Text = lpspec.Text = lpshahid.Text = "Not Found Data";
                btnUntrue.Enabled = ChNumId.Enabled = ChfName.Enabled = ChlName.Enabled = ChfaName.Enabled = ChmaName.Enabled = Chavg.Enabled = Chdate.Enabled = Chspec.Enabled = Chshahid.Enabled = CheAll.Enabled = btnAcept.Enabled = false;
            }
            finally
            {
                ChNumId.Checked = ChfName.Checked = ChlName.Checked = ChfaName.Checked = ChmaName.Checked = Chavg.Checked = Chdate.Checked = Chspec.Checked = Chshahid.Checked = CheAll.Checked = btnAcept.Enabled = false;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase(); university = new ClsUniversity(1);
            gradData = new DataTable(); hireMe = new BasicHireMe();
            gradData = access.SelectAllData("GRADUATE WHERE GRADUATE_PROFESSION = '" + university.Name + "' AND GRADUATE_UNIVERSITY_COUNTRY = '" + university.Country + "' AND GRADUATE_CHECK = 0");
            if (!IsPostBack)
            {
                ViewState["cnt"] = 0;
                FillData(int.Parse(ViewState["cnt"].ToString()));
            }
        }

        protected void CheAll_CheckedChanged(object sender, EventArgs e)
        {
            if(CheAll.Checked == true)
            {
                ChNumId.Checked = ChfName.Checked = ChlName.Checked = ChfaName.Checked = ChmaName.Checked = Chavg.Checked = Chdate.Checked = Chspec.Checked = Chshahid.Checked = btnAcept.Enabled = btnUntrue.Enabled = true;
            }
            else
            {
                ChNumId.Checked = ChfName.Checked =  ChlName.Checked = ChfaName.Checked = ChmaName.Checked = Chavg.Checked = Chdate.Checked = Chspec.Checked = Chshahid.Checked = btnAcept.Enabled = btnUntrue.Enabled = false;
            }
        }

        protected void ChNumId_CheckedChanged(object sender, EventArgs e)
        {
            if (ChNumId.Checked == true && ChfName.Checked == true && ChlName.Checked == true && ChfaName.Checked == true &&
                ChmaName.Checked == true && Chavg.Checked == true && Chdate.Checked == true && Chspec.Checked == true
                 && Chshahid.Checked == true)
            {
                CheAll.Checked = btnAcept.Enabled = true;
            }
            else
            {
                CheAll.Checked = btnAcept.Enabled = btnUntrue.Enabled = false;
            }
            if (ChNumId.Checked == true || ChfName.Checked == true || ChlName.Checked == true || ChfaName.Checked == true ||
                ChmaName.Checked == true || Chavg.Checked == true || Chdate.Checked == true || Chspec.Checked == true
                 || Chshahid.Checked == true)
            {
                btnUntrue.Enabled = true;
            }
        }
        protected void ProceccEmail(string mailbody, int ch)
        {
            TabRowErr.Visible = false;
            long NumId = Convert.ToInt64(lpNumId.Text); graduate = new ClsGraduate(NumId);
            string msgCreate = "Welcome " + graduate.Name;
            if (ch == 2)
            {
                mailbody += "\n Thank You To edit, <a href = 'https://localhost:44316/Home/GraduateCreate.aspx?id=" + NumId + "&email=" + graduate.Email + "'>click here</a>";
            }
            if (hireMe.CheckEmail(graduate.Email, mailbody, msgCreate, 0) == true)
            {
                access.Ex_SQL("BEGIN UPDATE GRADUATE SET GRADUATE_CHECK = " + ch + " WHERE ID_GRADUATE = " + graduate.Id + "; END;");
                ViewState["cnt"] = int.Parse(ViewState["cnt"].ToString()) + 1;
                FillData(int.Parse(ViewState["cnt"].ToString()));
            }
            else
            {
                TabRowErr.Visible = true;
            }
        }

        protected void btnAcept_Click(object sender, EventArgs e)
        {
            string mailbody = "<p>Your information has been verified \nThank You :)</p>";
            ProceccEmail(mailbody, 1);
        }

        protected void btnUntrue_Click(object sender, EventArgs e)
        {
            string mailbody = "Please edit your information Edited only on ";
            if(ChNumId.Checked == true) { mailbody += "Identification Number"; }
            if(ChfName.Checked == true) { mailbody += " Fisrt Name "; }
            if(ChlName.Checked == true) { mailbody += " Last Name "; }
            if(ChfaName.Checked == true) { mailbody += " Father Name "; }
            if(ChmaName.Checked == true) { mailbody += " Mather Name "; }
            if(Chavg.Checked == true) { mailbody += " Average "; }
            if(Chdate.Checked == true) { mailbody += " Date of Birth "; }
            if(Chspec.Checked == true) { mailbody += " Your Specialty "; }
            if(Chshahid.Checked == true) { mailbody += " Shahid "; }
            ProceccEmail(mailbody, 2);
        }
    }
}