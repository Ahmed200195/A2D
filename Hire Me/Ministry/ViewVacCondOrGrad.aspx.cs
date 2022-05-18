using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.MInistry
{
    public partial class ViewVacCondOrGrad : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(int.Parse(Request.QueryString["View"]) == 0)
                {
                    tlpage.InnerText = "Views Vacancy and Condition"; tlData.InnerText = "الشواغر مع الشروط";
                    Data_VacCond.Visible = Data_VacCond.Enabled = true;
                    Data_Grad.Visible = Data_Grad.Enabled = false;
                }
                else if(int.Parse(Request.QueryString["View"]) == 1)
                {
                    tlpage.InnerText = "Graduates"; tlData.InnerText = "الخريجين";
                    Data_VacCond.Visible = Data_VacCond.Enabled = false;
                    Data_Grad.Visible = Data_Grad.Enabled = true;
                }
            }
        }
    }
}