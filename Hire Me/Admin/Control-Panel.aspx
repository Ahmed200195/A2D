<%@ Page Language="C#" MasterPageFile="~/Admin/MrAdmin.Master" AutoEventWireup="true" CodeBehind="Control-Panel.aspx.cs" Inherits="Hire_Me.Control_Panel" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="headAdmin" runat="server">
    <title>Admin Control Panel</title>
</asp:Content>

<asp:Content ID="ContentSection" ContentPlaceHolderID="SectionAdmin" runat="server">
    <!--Show Accounts-->
    <div>
        <h1>عرض الحسابات</h1>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridViewDataAccount" runat="server"></asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!--Manage Accounts-->
    <div>
        <h1>إدراة الحسابات</h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="DataFromOption" runat="server"></asp:DropDownList>
                <asp:Button ID="ConForUpt" runat="server" Enabled="false" Text="تأكيد" OnClick="ConForUpt_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!--Settings-->
    <div>
        <h1>لوحة التحكم</h1>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <asp:RadioButtonList ID="Control_List" runat="server" OnSelectedIndexChanged="Control_List_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>فرز الخريجين</asp:ListItem>
                    <asp:ListItem>فتح النتائج للمتخرج</asp:ListItem>
                    <asp:ListItem>فتح تحقق الخريج من صحة معلوماته</asp:ListItem>
                    <asp:ListItem>سماح يتسجيل الرغبات</asp:ListItem>
                    <asp:ListItem>إيقاف تسجيل الخريج</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="Confirm" runat="server" Enabled="false" Text="تأكيد" OnClick="Confirm_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>