<%@ Page Title="AnasBinMalek" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AnasBinMalek.aspx.cs" Inherits="Project_for_Al_Aseel_Mosque.AnasBinMalek" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" class="w-100 mt-5" runat="server">
        <ContentTemplate>
            <h2 class="text-center text-success mb-4">~ حلقة سيدنا أنس بن مالك ~</h2>
            <div class="d-flex align-content-center justify-content-center mb-3">
                <h4 class="text-center ms-3">الأستاذ : براء اللحام</h4>
                <asp:RadioButtonList ID="RadioProcess" AutoPostBack="true" CssClass="me-3" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RadioProcess_SelectedIndexChanged">
                    <asp:ListItem class="radio-inline ms-5" Selected="True" Text="طلاب الحلقة"></asp:ListItem>
                    <asp:ListItem class="radio-inline" Text="مهام الطلاب"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div id="infoStudent" class="d-flex align-content-center justify-content-center mb-3" runat="server">
                <h4 class="text-center ms-3">الطالب : </h4>
                <asp:DropDownList ID="DropDownSname" AutoPostBack="true" CssClass="form-select w-50 text-center" runat="server" OnSelectedIndexChanged="DropDownSname_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div id="infoDate" class="d-flex align-content-center justify-content-center mb-3" runat="server">
                <h4 class="text-center ms-3">التاريخ : </h4>
                <asp:DropDownList ID="DropDownDate" AutoPostBack="true" CssClass="form-select w-50 text-center" runat="server" OnSelectedIndexChanged="DropDownDate_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <asp:GridView ID="GridView1" CssClass="table table-striped table-success table-bordered text-center w-100" runat="server"></asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
