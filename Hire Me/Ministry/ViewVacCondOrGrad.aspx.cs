using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.MInistry
{
    public partial class ViewVacCondOrGrad : Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            if(!IsPostBack)
            {
                if(int.Parse(Request.QueryString["View"]) == 0)
                {
                    tlpage.InnerText = "Views Vacancy and Condition"; tlData.InnerText = "الشواغر مع الشروط";
                    Data_VacCond_Grad.DataSource = access.SelectAllData("VAC_COND_VIEW WHERE ID_MINISTRY = " + 1 + "ORDER BY 3");
                }
                else if(int.Parse(Request.QueryString["View"]) == 1)
                {
                    tlpage.InnerText = "Views Graduates"; tlData.InnerText = "الخريجين";
                    Data_VacCond_Grad.DataSource = null;
                }
                Data_VacCond_Grad.DataBind();
            }
        }
    }
}