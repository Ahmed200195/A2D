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
        Access_DataBase access;
        ClsUniversity university;
        DataTable gradData;
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
            access = new Access_DataBase();
            university = new ClsUniversity(1);
            gradData = new DataTable();
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
                ChNumId.Checked = ChfName.Checked = ChlName.Checked = ChfaName.Checked = ChmaName.Checked = Chavg.Checked = Chdate.Checked = Chspec.Checked = Chshahid.Checked = btnAcept.Enabled = true;
            }
            else
            {
                ChNumId.Checked = ChfName.Checked =  ChlName.Checked = ChfaName.Checked = ChmaName.Checked = Chavg.Checked = Chdate.Checked = Chspec.Checked = Chshahid.Checked = btnAcept.Enabled = false;
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
                CheAll.Checked = btnAcept.Enabled = false;
            }
        }

        protected void btnAcept_Click(object sender, EventArgs e)
        {
            access.Ex_SQL("BEGIN UPDATE GRADUATE SET GRADUATE_CHECK = 1 WHERE ID_GRADUATE = "+ int.Parse(gradData.Rows[0][0].ToString()) + "; END;");
            ViewState["cnt"] = int.Parse(ViewState["cnt"].ToString()) + 1;
            FillData(int.Parse(ViewState["cnt"].ToString()));
        }

        protected void btnUntrue_Click(object sender, EventArgs e)
        {

        }
    }
}