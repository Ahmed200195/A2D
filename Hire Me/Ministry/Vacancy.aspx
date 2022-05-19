<%@ Page Title="" Language="C#" MasterPageFile="~/MInistry/BasicMinistry.Master" AutoEventWireup="true" CodeBehind="Vacancy.aspx.cs" Inherits="Hire_Me.MInistry.Vacancy" %>
<asp:Content ID="headVac" ContentPlaceHolderID="headMinistry" runat="server">
    <title id="tlpage" runat="server"></title>
</asp:Content>
<asp:Content ID="ContentVac" ContentPlaceHolderID="SectionMinistry" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
        <ContentTemplate>
            <h1 id="tlPost" runat="server"></h1>
            <asp:RadioButtonList ID="Option_CrtVacUpd" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Option_CrtVacUpd_SelectedIndexChanged">
                <asp:ListItem Text="إنشاء" Selected="True"></asp:ListItem>
                <asp:ListItem Text="تعديل"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lp_Univ_Vac" runat="server" />
            <asp:DropDownList ID="dp_Univ_Vac" AutoPostBack="true" runat="server" OnSelectedIndexChanged="dp_Univ_Vac_SelectedIndexChanged"></asp:DropDownList>
            <asp:Label ID="lp_Vtype_Cname" runat="server" />
            <asp:TextBox ID="txtCname" Visible="false" runat="server" />
            <asp:XmlDataSource ID="XmlDataSource1" DataFile="~/Ministry/XMLTypeVacCond.xml" XPath="ListItems/TypeVac/typevac" runat="server"></asp:XmlDataSource>
            <asp:XmlDataSource ID="XmlDataSource2" DataFile="~/Ministry/XMLTypeVacCond.xml" XPath="ListItems/TypeCond/typecond"  runat="server"></asp:XmlDataSource>
            <asp:DropDownList ID="TypeVac" DataSourceID="XmlDataSource1" DataTextField="text" DataValueField="value" AutoPostBack="true" runat="server"></asp:DropDownList>
            <asp:Label ID="lp_avg_ctype" runat="server" />
            <asp:TextBox ID="txtAvg" AutoPostBack="true" runat="server" />
            <asp:DropDownList ID="TypeCond" DataSourceID="XmlDataSource2" DataTextField="text" DataValueField="value" AutoPostBack="true"  runat="server"></asp:DropDownList>
            <asp:Label ID="lpCnt" Text="العدد" runat="server" />
            <asp:TextBox ID="txtCnt" AutoPostBack="true" runat="server" />
            <asp:Button ID="btnAddVac" runat="server" Text="إضافة" />
            <asp:Button ID="btnUpdVac" runat="server" Text="تعديل" />
            <asp:Button ID="btnDelVac" runat="server" Text="حذف" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
