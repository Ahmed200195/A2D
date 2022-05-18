<%@ Page Language="C#" MasterPageFile="~/Home/BasicesPage.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Hire_Me.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <title>Sign In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <section>
        <asp:Label CssClass="" Text="بريد الكتروني" runat="server" />
        <asp:TextBox ID="txt_email" CssClass="" TextMode="Email" AutoCompleteType="Email" runat="server"></asp:TextBox>
        <asp:Label CssClass="" Text="كلمة المرور" runat="server" />
        <asp:TextBox ID="txt_pswd" CssClass="" TextMode="Password" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
        <asp:Button ID="btn_lgin" CssClass="" runat="server" Text="تسجيل الدخول" OnClick="btn_lgin_Click" />

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        <asp:Label ID="cnt" Text="0" runat="server" />
    </section>
</asp:Content>
