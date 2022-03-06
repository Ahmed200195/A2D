<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Hire_Me.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title id="tlpage"  runat="server">Create Account </title>
</head>
<body>
    <form id="form1"  runat="server">
        <div>
            <div id="AllInfo" runat="server">

                <asp:Label ID="changeName" Text="اسم " runat="server" />
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="errNameRequired" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="errNameNoNum" runat="server" ErrorMessage="Name only" ControlToValidate="txtName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
                <br />

                <div class="gradInfo" runat="server">
                    <asp:Label Text="اسم العائلة" runat="server" />
                    <asp:TextBox ID="txtlName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errlnameRequired" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtlName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="errlnameNoNum" runat="server" ErrorMessage="Name only" ControlToValidate="txtlName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
                    <br />

                    <asp:Label Text="اسم الأب" runat="server" />
                    <asp:TextBox ID="txtfName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errfnameRequired" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtfName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="errfnameNoNum" runat="server" ErrorMessage="Name only" ControlToValidate="txtfName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
                    <br />

                    <asp:Label Text="اسم الأم" runat="server" />
                    <asp:TextBox ID="txtmName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errmnameRequired" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtmName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="errmnameNoNum" runat="server" ErrorMessage="Name only" ControlToValidate="txtmName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
                    <br />

                    <asp:Label Text="رقم الوطني" runat="server" />
                    <asp:TextBox ID="txtNumId" MaxLength="10" runat="server"></asp:TextBox>
                    <asp:Label ID="errNumIdCh" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="errNumId" runat="server" ErrorMessage="Number cannot be blank" ControlToValidate="txtNumId"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="errNumIdTen" runat="server" ErrorMessage="Id number must be 10 digit" ControlToValidate="txtNumId" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                    <br />

                    <asp:Label Text="تاريخ الميلاد" runat="server" />
                    <asp:TextBox ID="txtdate" TextMode="Date" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errdateRequired" runat="server" ErrorMessage="Date cannot be blank" ControlToValidate="txtdate"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID ="errDate" runat ="server" ControlToValidate="txtdate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1990" MaximumValue="01/01/2005"></asp:RangeValidator>
                    <br />

                    <asp:RadioButtonList ID="RadioShahid" runat="server" Visible="True">
                        <asp:ListItem Selected="True" Value="NoShahid" Text="لا شهيد" />
                        <asp:ListItem Value="Shahid" Text="شهيد" />
                    </asp:RadioButtonList>

                    <!-- From Table Country-->
                    <asp:Label Text="محافظة الجامعة" runat="server" />
                    <asp:DropDownList ID="cty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cty_SelectedIndexChanged"></asp:DropDownList>
                    <br />

                    <!--Uname From Table University-->
                    <asp:Label Text="اختصاص" runat="server" />
                    <asp:DropDownList ID="Splzn" runat="server"></asp:DropDownList>
                    <br />

                    <asp:Label Text="المعدل" runat="server" />
                    <asp:TextBox ID="txtavg" MaxLength="5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="erravg" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtavg"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="erravgerage" runat="server" ErrorMessage="Age must be between 0 to 100" ControlToValidate="txtavg" MinimumValue="0" MaximumValue="100" Type="Double"></asp:RangeValidator>
                    <br />

                </div>

                <asp:Label Text="رقم الهاتف" runat="server" />
                <asp:TextBox ID="txtPhe" TextMode="Phone" MaxLength="10" runat="server"></asp:TextBox>
                <asp:Label ID="errPheCh" runat="server"></asp:Label>
                <asp:RequiredFieldValidator ID="errPhe" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhe"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="errPheTen" runat="server" ErrorMessage="Phone number must be 10 digit" ControlToValidate="txtPhe" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                <br />

                <div class="gradUnInfo" runat="server">

                    <!--From Table Country-->
                    <asp:Label Text="من محافظة : " runat="server" />
                    <asp:DropDownList ID="from_cty" runat="server"></asp:DropDownList>

                </div>

                <div class="dvCrtEmail" runat="server">

                    <asp:Label Text="البريد الكتروني" runat="server" />
                    <asp:TextBox ID="txtEmail" TextMode="Email" placeholder="@gmail.com" runat="server" AutoCompleteType="Email"></asp:TextBox>
                    <asp:Label ID="errEmailCh" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="errEmailRequired" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="errEmailConding" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />

                    <asp:Label Text="كلمة المرور جديدة" runat="server" />
                    <asp:TextBox ID="txtPswd" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errPswd" runat="server" ErrorMessage="Password cannot be blank" ControlToValidate="txtPswd" ForeColor="Red"></asp:RequiredFieldValidator>  
                    
                    <br />

                    <asp:Label Text="تأكيد كلمة المرور" runat="server" />
                    <asp:TextBox ID="txtPswdCm" TextMode="Password" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:CompareValidator ID="errPswdCompare" runat="server" ControlToCompare="txtPswd" ControlToValidate="txtPswdCm" ErrorMessage="Password and confiem password must be same" ForeColor="Red"></asp:CompareValidator>  
                    <br />

                </div>

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
