using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hire_Me.Classes;
namespace Hire_Me.Home
{
    public partial class GraduateResult : System.Web.UI.Page
    {
        Access_DataBase access;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                access = new Access_DataBase();
                access.Read_Data("ID_MINISTRY, MINISTRY_NAME", "MINISTRY WHERE ID_MINISTRY IN (SELECT ID_MINISTRY FROM RESULT WHERE ID_GRADUATE = 3)");
                access.dataReader.Read();
                try
                {
                    lpNameMinistry.Text = access.dataReader["MINISTRY_NAME"].ToString();
                    BulletedList1.DataSource = access.SelectData("SELECT FULLNAME FROM VIEW_ALL_DESIRE WHERE ID_MINISTRY = " + int.Parse(access.dataReader["ID_MINISTRY"].ToString()) + " AND ID_VACANCY IN (SELECT ID_VACANCY FROM DESIRE WHERE ID_GRADUATE = 3)");
                    BulletedList1.DataTextField = "FULLNAME"; BulletedList1.DataBind();
                }
                catch
                {
                    lpNameMinistry.Text = "جميع الرغبات مرفوضة";
                }
            }
        }
    }
}