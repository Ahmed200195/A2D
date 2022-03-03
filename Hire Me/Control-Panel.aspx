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
                    <li><a onclick="showSelect()">استعراض</a></li>
                    <li><a onclick="showUpdate()">إدارة</a></li>
                    <li><a onclick="showInsert()">إنشاء</a></li>
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
                    <section>
                        <asp:RadioButtonList ID="Option_Mini_Uni" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Option_Mini_Uni_SelectedIndexChanged">
                            <asp:ListItem>الوزارة</asp:ListItem>
                            <asp:ListItem>الجامعة</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:DropDownList ID="DataFromOption" runat="server"></asp:DropDownList>
                        <asp:Button ID="ConForUpt" runat="server" Text="Button" OnClick="ConForUpt_Click" />
                    </section>
                </div>
                <div>
                    <h1>إنشاء الحسابات</h1>
                    <section>
                        <asp:Button ID="crtMsty" runat="server" Text="الوزارة" OnClick="crtMsty_Click" />
                        <asp:Button ID="crtUvsty" runat="server" Text="الجامعة" OnClick="crtUvsty_Click" />
                    </section>
                </div>

                <!--Settings-->
                <div>
                    <asp:RadioButtonList ID="Control_List" runat="server" OnSelectedIndexChanged="Control_List_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>فرز الخريجين</asp:ListItem>
                        <asp:ListItem>فتح النتائج للمتخرج</asp:ListItem>
                        <asp:ListItem>فتح تحقق الخريج من صحة معلوماته</asp:ListItem>
                        <asp:ListItem>سماح يتسجيل الرغبات</asp:ListItem>
                        <asp:ListItem>إيقاف تسجيل الخريج</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Button ID="Confirm" runat="server" Text="تأكيد" OnClick="Confirm_Click" />
                </div>
            </section>
        </div>
    </form>
</body>
</html>
