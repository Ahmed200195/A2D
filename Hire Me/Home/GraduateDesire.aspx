<%@ Page Language="C#" MasterPageFile="~/Home/BasicesPage.Master" AutoEventWireup="true" CodeBehind="GraduateDesire.aspx.cs" Inherits="Hire_Me.Home.GraduateDesire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <title>Choose Desires</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h1>اختيار الرغبات</h1>
            <h3>رغبات المتاحة</h3>
            <asp:DropDownList ID="Desires_Available" runat="server"></asp:DropDownList>
            <asp:Button ID="btn_Add_To" runat="server" Text="إضافة" />
            <asp:Button ID="btn_Rem_From" runat="server" Text="حذف" />
            <h3>رغبات المحددة</h3>
            <asp:DropDownList ID="Desires_Selected" runat="server"></asp:DropDownList>
            <asp:Button ID="btn_sign_desire" runat="server" Text="تسجيل" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
