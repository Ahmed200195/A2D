<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Control-Panel.aspx.cs" Inherits="Hire_Me.Control_Panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Control Panel</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <a href="Home.aspx">Home</a>
            </header>
            <div class="sidebar">
                <h3>الحسابات</h3>
                <ul>
                    <li><span onclick="showSelect()">استعراض</span></li>
                    <li><span onclick="showUpdate()">إدارة</span></li>
                    <li><span onclick="showInsert()">إنشاء</span></li>
                </ul>
                <h3 onclick="ShowSettings">الإعدادات</h3>
            </div>
            <section>
                <!--Accounts-->
                <div>
                    <h1>عرض الحسابات</h1>
                    <section></section>
                </div>
                <div>
                    <h1>إدراة الحسابات</h1>
                    <section></section>
                </div>
                <div>
                    <h1>إنشاء الحسابات</h1>
                    <section></section>
                </div>

                <!--Settings-->
                <div>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>فرز الخريجين</asp:ListItem>
                        <asp:ListItem>فتح النتائج للمتخرج</asp:ListItem>
                        <asp:ListItem>فتح تحقق الخريج من صحة معلوماته</asp:ListItem>
                        <asp:ListItem>سماح يتسجيل الرغبات</asp:ListItem>
                        <asp:ListItem>إيقاف تسجيل الخريج</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Button ID="Confirm" runat="server" Text="Button" OnClick="Confirm_Click" />
                </div>
            </section>
        </div>
    </form>
</body>
</html>
