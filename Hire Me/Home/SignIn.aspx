﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home/BasicesPage.Master" CodeBehind="SignIn.aspx.cs" Inherits="Hire_Me.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <title>Sign In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <section>
        <asp:Label CssClass="" Text="بريد الكتروني" runat="server" />
        <asp:TextBox ID="txt_email" CssClass="" TextMode="Email" AutoCompleteType="Email" runat="server"></asp:TextBox>
        <asp:Label CssClass="" Text="كلمة المرور" runat="server" />
        <asp:TextBox ID="txt_pswd" CssClass="" TextMode="Password" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
        <asp:Button ID="btn_lgin" CssClass="" runat="server" Text="تسجيل الدخول" />

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        <asp:Label ID="cnt" Text="0" runat="server" />
    </section>
</asp:Content>
