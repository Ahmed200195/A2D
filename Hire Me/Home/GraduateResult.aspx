<%@ Page Language="C#" MasterPageFile="~/Home/BasicesPage.Master" AutoEventWireup="true" CodeBehind="GraduateResult.aspx.cs" Inherits="Hire_Me.Home.GraduateResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <title>Results</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <h1>رغبات المسجلة : </h1>
    <asp:BulletedList ID="BulletedList1" runat="server"></asp:BulletedList>
    <h1>النتيجتك هي : </h1>
    <asp:Label ID="lpNameMinistry" runat="server"></asp:Label>
</asp:Content>