<%@ Page Language="C#" MasterPageFile="~/Home/BasicesPage.Master" AutoEventWireup="true" CodeBehind="GraduateDesire.aspx.cs" Inherits="Hire_Me.Home.GraduateDesire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <title>Choose Desires</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
        <ContentTemplate>
            <h1>اختيار الرغبات</h1>
            <asp:CheckBoxList ID="CheckBoxDesire" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxDesire_SelectedIndexChanged" runat="server">
            </asp:CheckBoxList>
            <asp:CustomValidator ID="CstmVldtrSelectSix" Visible="false" ForeColor="Red" runat="server" ErrorMessage="Please select only 6 Desires"></asp:CustomValidator>
            <asp:Button ID="btn_sign_desire" Enabled="false" runat="server" Text="تسجيل" OnClick="btn_sign_desire_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
