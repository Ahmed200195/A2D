using System;
using System.Collections.Generic;
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
        Person person;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void CheAll_CheckedChanged(object sender, EventArgs e)
        {
            if(CheAll.Checked == true)
            {
                ChNumId.Checked = true;
                ChfName.Checked = true;
                ChlName.Checked = true;
                ChfaName.Checked = true;
                ChmaName.Checked = true;
                Chavg.Checked = true;
                Chdate.Checked = true;
                Chspec.Checked = true;
                Chshahid.Checked = true;
            }
            else
            {
                ChNumId.Checked = false;
                ChfName.Checked = false;
                ChlName.Checked = false;
                ChfaName.Checked = false;
                ChmaName.Checked = false;
                Chavg.Checked = false;
                Chdate.Checked = false;
                Chspec.Checked = false;
                Chshahid.Checked = false;
            }
        }

        protected void ChNumId_CheckedChanged(object sender, EventArgs e)
        {
            if (ChNumId.Checked == true && ChfName.Checked == true && ChlName.Checked == true && ChfaName.Checked == true &&
                ChmaName.Checked == true && Chavg.Checked == true && Chdate.Checked == true && Chspec.Checked == true
                 && Chshahid.Checked == true)
            {
                CheAll.Checked = true;
            }
            else
            {
                CheAll.Checked = false;
            }
        }

    }
}