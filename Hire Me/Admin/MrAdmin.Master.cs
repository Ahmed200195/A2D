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
        Content content;
        GridView GridViewDataAccount;
        DropDownList DataFromOption;
        Button ConForUpt;
        protected void Page_Load(object sender, EventArgs e)
        {
            access = new Access_DataBase();
            contentPlace = FindControl("SectionAdmin") as ContentPlaceHolder;
            //content = contentPlace.FindControl("ContentSectionCrtAcnt") as Content;
            GridViewDataAccount = contentPlace.FindControl("GridViewDataAccount") as GridView;
            DataFromOption = contentPlace.FindControl("DataFromOption") as DropDownList;
            ConForUpt = contentPlace.FindControl("ConForUpt") as Button;
            if (!IsPostBack)
            {
                if (Option_Mini_Uni.SelectedIndex.Equals(0))
                {
                    GridViewDataAccount.DataSource = access.SelectAllData("VIEW_MINISTRY");
                    DataFromOption.DataSource = access.SelectAllData("MINISTRY");
                    DataFromOption.DataTextField = "MINISTRY_NAME";
                    DataFromOption.DataValueField = "ID_MINISTRY";
                }
                GridViewDataAccount.DataBind();
                DataFromOption.DataBind();
                ConForUpt.Enabled = true;
            }
        }
        protected void linkCreateAccount_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx?Account=" + Option_Mini_Uni.SelectedValue + "&Admin=Admin");
        }
        protected void Option_Mini_Uni_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Option_Mini_Uni.SelectedIndex.Equals(0))
            {
                GridViewDataAccount.DataSource = access.SelectAllData("VIEW_MINISTRY");
                DataFromOption.DataSource = access.SelectAllData("MINISTRY");
                DataFromOption.DataTextField = "MINISTRY_NAME";
                DataFromOption.DataValueField = "ID_MINISTRY";
            }
            else if (Option_Mini_Uni.SelectedIndex.Equals(1))
            {
                GridViewDataAccount.DataSource = access.SelectAllData("VIEW_UNIVERSITY");
                DataFromOption.DataSource = access.SelectAllData("UNIVERSITY");
                DataFromOption.DataTextField = "UNIVERSITY_NAME";
                DataFromOption.DataValueField = "ID_UNIVERSITY";
            }
            GridViewDataAccount.DataBind();
            DataFromOption.DataBind();
            ConForUpt.Enabled = true;
        }

        protected void linkShowData_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Control-Panel.aspx");
        }
    }

}