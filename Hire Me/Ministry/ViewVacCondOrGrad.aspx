<%@ Page Title="" Language="C#" MasterPageFile="~/MInistry/BasicMinistry.Master" AutoEventWireup="true" CodeBehind="ViewVacCondOrGrad.aspx.cs" Inherits="Hire_Me.MInistry.ViewVacCondOrGrad" %>
<asp:Content ID="headViews" ContentPlaceHolderID="headMinistry" runat="server">
    <title id="tlpage" runat="server"></title>
</asp:Content>
<asp:Content ID="ContentViews" ContentPlaceHolderID="SectionMinistry" runat="server">
    <h1 id="tlData" runat="server"></h1>
    <asp:GridView ID="Data_VacCond_Grad" runat="server"></asp:GridView>
    <%--<asp:GridView ID="Data_Grad" runat="server"></asp:GridView>--%>
</asp:Content>
