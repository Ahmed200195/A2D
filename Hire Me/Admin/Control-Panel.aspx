<%@ Page Language="C#" MasterPageFile="~/Admin/MrAdmin.Master" AutoEventWireup="true" CodeBehind="Control-Panel.aspx.cs" Inherits="Hire_Me.Control_Panel" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="headAdmin" runat="server">
    <title>Admin Control Panel</title>
</asp:Content>

<asp:Content ID="ContentSection" ContentPlaceHolderID="SectionAdmin" runat="server">
    <!--Show Accounts-->
    <div>
        <h1>عرض الحسابات</h1>
        <section></section>
    </div>
    <!--Manage Accounts-->
    <div>
        <h1>إدراة الحسابات</h1>
        <section>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:RadioButtonList ID="Option_Mini_Uni" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Option_Mini_Uni_SelectedIndexChanged">
                        <asp:ListItem>الوزارة</asp:ListItem>
                        <asp:ListItem>الجامعة</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:DropDownList ID="DataFromOption" runat="server"></asp:DropDownList>
                    <asp:Button ID="ConForUpt" runat="server" Enabled="false" Text="Button" OnClick="ConForUpt_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </div>
    <!--Create Accounts-->
    <div>
        <h1>إنشاء الحسابات</h1>
        <section>
            <asp:Button ID="crtMsty" runat="server" Text="الوزارة" OnClick="crtMsty_Click" />
            <asp:Button ID="crtUvsty" runat="server" Text="الجامعة" OnClick="crtUvsty_Click" />
        </section>
    </div>
    <!--Settings-->
    <div>
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