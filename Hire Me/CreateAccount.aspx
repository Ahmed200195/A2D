<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Hire_Me.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title id="tlpage"  runat="server">Create Account </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="AllInfo" runat="server">
                <asp:Label ID="changeName" Text="اسم " runat="server" />
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:Label ID="errName" runat="server"></asp:Label>
                <div class="gradInfo" runat="server">
                    <asp:Label Text="اسم العائلة" runat="server" />
                    <asp:TextBox ID="txtlName" runat="server"></asp:TextBox>
                    <asp:Label ID="errlname" runat="server"></asp:Label>
                    <asp:Label Text="اسم الأب" runat="server" />
                    <asp:TextBox ID="txtfName" runat="server"></asp:TextBox>
                    <asp:Label ID="errfname" runat="server"></asp:Label>
                    <asp:Label Text="اسم الأم" runat="server" />
                    <asp:TextBox ID="txtmName" runat="server"></asp:TextBox>
                    <asp:Label ID="errmname" runat="server"></asp:Label>
                    <asp:Label Text="رقم الوطني" runat="server" />
                    <asp:TextBox ID="txtNumId" MaxLength="10" runat="server" AutoPostBack="False"></asp:TextBox>
                    <asp:Label ID="errNumId" runat="server"></asp:Label>
                    <asp:Label Text="تاريخ الميلاد" runat="server" />
                    <asp:TextBox ID="txtdate" TextMode="Date" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID ="rvDate" runat ="server" ControlToValidate="txtdate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
                    <asp:Label ID="errDate" runat="server"></asp:Label>
                    <asp:RadioButtonList ID="RadioShahid" runat="server" Visible="True">
                        <asp:ListItem Selected="True" Value="NoShahid" Text="لا شهيد" />
                        <asp:ListItem Value="Shahid" Text="شهيد" />
                    </asp:RadioButtonList>
                    <!-- From Table Country-->
                    <asp:Label Text="محافظة الجامعة" runat="server" />
                    <asp:DropDownList ID="cty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cty_SelectedIndexChanged"></asp:DropDownList>
                    <!--Uname From Table University-->
                    <asp:Label Text="اختصاص" runat="server" />
                    <asp:DropDownList ID="Splzn" runat="server"></asp:DropDownList>
                    <asp:Label Text="المعدل" runat="server" />
                    <asp:TextBox ID="txtavg" MaxLength="5" runat="server"></asp:TextBox>
                    <asp:Label ID="erravg" runat="server"></asp:Label>
                </div>
                <asp:Label Text="رقم الهاتف" runat="server" />
                <asp:TextBox ID="txtPhe" TextMode="Phone" Text="09" MaxLength="10" runat="server"></asp:TextBox>
                <asp:Label ID="errPhe" runat="server"></asp:Label>
                <div class="gradUnInfo" runat="server">
                    <!--From Table Country-->
                    <asp:Label Text="من محافظة : " runat="server" />
                    <asp:DropDownList ID="from_cty" runat="server"></asp:DropDownList>
                </div>
                <asp:Label Text="البريد الكتروني" runat="server" />
                <asp:TextBox ID="txtEmail" TextMode="Email" Text="@gmail.com" runat="server" AutoCompleteType="Email"></asp:TextBox>
                <asp:Label ID="errEmail" runat="server"></asp:Label>
                <asp:Label Text="كلمة المرور جديدة" runat="server" />
                <asp:TextBox ID="txtPswd" TextMode="Password" runat="server" AutoCompleteType="Email"></asp:TextBox>
                <asp:Label ID="errPswd" runat="server"></asp:Label>
                <asp:Label Text="تأكيد كلمة المرور" runat="server" />
                <asp:TextBox ID="txtPswdCm" TextMode="Password" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:Label ID="errPswdCm" runat="server"></asp:Label>
                <asp:Button ID="brnCrt" runat="server" Text="إنشاء حساب" OnClick="brnCrt_Click" />
            </div>
            <div id="EntCode" runat="server">
                <asp:Label Text="أدخل الرمز" runat="server" />
                <asp:TextBox ID="txtCode" MaxLength="30" runat="server"></asp:TextBox>
                <asp:Label ID="errCode" runat="server"></asp:Label>
                <asp:Button ID="CodeConfirm" runat="server" Text="تأكيد" OnClick="CodeConfirm_Click" />
            </div>
        </div>
    </form>
</body>
</html>
