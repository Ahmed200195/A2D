<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Hire_Me.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="tlpage"></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="changeName" Text="اسم " runat="server" />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <div class="gradInfo" runat="server">
                <asp:Label Text="اسم الأب" runat="server" />
                <asp:TextBox ID="txtfName" runat="server"></asp:TextBox>
                <asp:Label Text="اسم الأم" runat="server" />
                <asp:TextBox ID="txtmName" runat="server"></asp:TextBox>
                <asp:Label Text="تاريخ الميلاد" runat="server" />
                <asp:TextBox ID="txtdate" TextMode="Date" runat="server"></asp:TextBox>
                <asp:RadioButtonList ID="RadioShahid" runat="server">
                    <asp:ListItem Text="شهيد" />
                    <asp:ListItem Text="لا شهيد" />
                </asp:RadioButtonList>
                <!-- From Table Country-->
                <asp:Label Text="محافظة الجامعة" runat="server" />
                <asp:DropDownList ID="cty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cty_SelectedIndexChanged"></asp:DropDownList>
                <!--Uname From Table University-->
                <asp:Label Text="اختصاص" runat="server" />
                <asp:DropDownList ID="Splzn" runat="server"></asp:DropDownList>
                <asp:Label Text="المعدل" runat="server" />
                <asp:TextBox ID="txtavg" TextMode="Number" MaxLength="3" runat="server"></asp:TextBox>
            </div>
            <asp:Label Text="رقم الهاتف" runat="server" />
            <asp:TextBox ID="txtPhe" TextMode="Phone" MaxLength="10" runat="server"></asp:TextBox>
            <div class="gradUnInfo" runat="server">
                <!--From Table Country-->
                <asp:Label Text="من محافظة : " runat="server" />
                <asp:DropDownList ID="from_cty" runat="server"></asp:DropDownList>
            </div>
            <asp:Label Text="البريد الكتروني" runat="server" />
            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server"></asp:TextBox>
            <asp:Label Text="كلمة المرور" runat="server" />
            <asp:TextBox ID="txtPswrd" TextMode="Password" runat="server"></asp:TextBox>
            <asp:Label Text="تأكيد كلمة المرور" runat="server" />
            <asp:TextBox ID="txtPswedCm" TextMode="Password" runat="server"></asp:TextBox>
            <asp:Button ID="brnCrt" runat="server" Text="إنشاء حساب" OnClick="brnCrt_Click" />
        </div>
    </form>
</body>
</html>
