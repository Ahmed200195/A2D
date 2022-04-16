using System;
using Hire_Me.Classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hire_Me.Admin
{
    public partial class MrAdmin : MasterPage
    {
        Access_DataBase access;
        ContentPlaceHolder contentPlace;
        GridView GridViewDataAccount;
        DropDownList DataFromOption;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            contentPlace = FindControl("SectionAdmin") as ContentPlaceHolder;
            GridViewDataAccount = contentPlace.FindControl("GridViewDataAccount") as GridView;
            DataFromOption = contentPlace.FindControl("DataFromOption") as DropDownList;
        }
        protected void linkCreateAccount_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx?Account=" + Option_Mini_Uni.SelectedValue + "&Admin=Admin");
        }
        protected void Option_Mini_Uni_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Option_Mini_Uni.SelectedIndex.Equals(0))
            {
                GridViewDataAccount.DataSource = access.SelectData("SELECT MINISTRY_NAME, PHONE FROM VIEW_MINISTRY");
                DataFromOption.DataSource = access.SelectAllData("VIEW_MINISTRY");
                DataFromOption.DataTextField = "MINISTRY_NAME";
                DataFromOption.DataValueField = "ID_MINISTRY";
            }
            else if (Option_Mini_Uni.SelectedIndex.Equals(1))
            {
                GridViewDataAccount.DataSource = access.SelectData("SELECT UNIVERSITY_NAME, UNIVERSITY_COUNTRY, PHONE FROM VIEW_UNIVERSITY");
                DataFromOption.DataSource = access.SelectAllData("UNIV_WITH_COUNTRY");
                DataFromOption.DataTextField = "FLUNIVCNTY";
                DataFromOption.DataValueField = "ID_UNIVERSITY";
            }
            GridViewDataAccount.DataBind();
            DataFromOption.DataBind();
        }

        protected void linkShowData_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Control-Panel.aspx");
        }
    }

}