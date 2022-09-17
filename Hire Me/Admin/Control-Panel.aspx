<%@ Page Language="C#" MasterPageFile="~/Admin/MrAdmin.Master" AutoEventWireup="true" CodeBehind="Control-Panel.aspx.cs" Inherits="Hire_Me.Control_Panel" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="headAdmin" runat="server">
    <title>Admin Control Panel</title>
</asp:Content>

<asp:Content ID="ContentSectionMgr" ContentPlaceHolderID="SectionAdmin" runat="server">
    <!--Manage Accounts-->
    <div class="dvsction" id="mngeAccount">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <h1>عرض الحسابات</h1>
                <asp:GridView ID="GridViewDataAccount" runat="server"></asp:GridView>
                <h1>إدراة الحسابات</h1>
                <asp:DropDownList ID="DataFromOption" runat="server" AutoPostBack="true"></asp:DropDownList>
                <asp:Button ID="ConForUpt" runat="server" Enabled="false" Text="تعديل" OnClick="ConForUpt_Click" />
                <asp:Button ID="ConForDel" runat="server" Enabled="false" Text="حذف" OnClick="ConForDel_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!--Settings-->
    <div class="dvsction" id="ctrlpnl">
        <h1>لوحة التحكم</h1>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                 <asp:RadioButtonList ID="Control_List" runat="server" OnSelectedIndexChanged="Control_List_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>إيقاف تسجيل الخريج</asp:ListItem>
                    <asp:ListItem Enabled="false">فرز الخريجين</asp:ListItem>
                    <asp:ListItem Enabled="false">فتح النتائج للمتخرج</asp:ListItem>
                    <asp:ListItem Enabled="false">سماح يتسجيل الرغبات</asp:ListItem>
                    <%--<asp:ListItem>فتح تحقق الخريج من صحة معلوماته</asp:ListItem>--%>
                </asp:RadioButtonList>
                <asp:Button ID="Confirm" runat="server" Enabled="false" Text="تأكيد" OnClick="Confirm_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
