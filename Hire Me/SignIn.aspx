<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Hire_Me.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign-In</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                </ul>
            </header>
            <section>
                <asp:Label CssClass="" Text="بريد الكتروني" runat="server" />
                <asp:TextBox ID="txt_email" CssClass="" TextMode="Email" AutoCompleteType="Email" runat="server"></asp:TextBox>
                <asp:Label CssClass="" Text="كلمة المرور" runat="server" />
                <asp:TextBox ID="txt_pswd" CssClass="" TextMode="Password" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
                <asp:Button ID="btn_lgin" CssClass="" runat="server" Text="تسجيل الدخول" />
            </section>
            <div>

            </div>
            <footer></footer>
        </div>
    </form>
</body>
</html>
