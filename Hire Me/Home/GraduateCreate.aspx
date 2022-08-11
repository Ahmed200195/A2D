<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home/BasicesPage.Master" CodeBehind="GraduateCreate.aspx.cs" Inherits="Hire_Me.GraduateCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <title>Create Graduate Account</title>
    <style>
        .Validation {
            position: absolute;
        }

        .Red {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="dvCrtAcnt" runat="server">
        <asp:Label ID="changeName" Text="اسم الخريج" runat="server" />
        <asp:TextBox ID="txtName" runat="server" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errNameRequired" CssClass="Validation Red" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errNameNoNum" CssClass="Red" runat="server" ErrorMessage="Name only" ControlToValidate="txtName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
        <br />

        <asp:Label Text="اسم العائلة" runat="server" />
        <asp:TextBox ID="txtlName" MaxLength="20" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errlnameRequired" CssClass="Validation Red" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtlName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errlnameNoNum" CssClass="Red" runat="server" ErrorMessage="Name only" ControlToValidate="txtlName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
        <br />

        <asp:Label Text="اسم الأب" runat="server" />
        <asp:TextBox ID="txtfName" MaxLength="20" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errfnameRequired" CssClass="Validation Red" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtfName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errfnameNoNum" CssClass="Red" runat="server" ErrorMessage="Name only" ControlToValidate="txtfName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
        <br />

        <asp:Label Text="اسم الأم" runat="server" />
        <asp:TextBox ID="txtmName" MaxLength="20" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errmnameRequired" CssClass="Validation Red" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtmName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errmnameNoNum" CssClass="Red" runat="server" ErrorMessage="Name only" ControlToValidate="txtmName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
        <br />

        <asp:Label Text="رقم الوطني" runat="server" />
        <asp:TextBox ID="txtNumId" MaxLength="10" runat="server"></asp:TextBox>
        <asp:Label ID="errNumIdCh" CssClass="Validation Red" runat="server"></asp:Label>
        <asp:RequiredFieldValidator ID="errNumId" runat="server" CssClass="Validation Red" ErrorMessage="Number cannot be blank" ControlToValidate="txtNumId"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errNumIdTen" CssClass="Red" runat="server" ErrorMessage="Id number must be 10 digit" ControlToValidate="txtNumId" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        <br />

        <asp:Label Text="تاريخ الميلاد" runat="server" />
        <asp:TextBox ID="txtdate" TextMode="Date" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="errdateRequired" runat="server" CssClass="Validation Red" ErrorMessage="Date cannot be blank" ControlToValidate="txtdate"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="errDate" runat="server" CssClass="Red" ControlToValidate="txtdate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1990" MaximumValue="01/01/2005"></asp:RangeValidator>
        <br />

        <asp:RadioButtonList ID="RadioShahid" runat="server" Visible="True">
            <asp:ListItem Selected="True" Value="NoShahid" Text="لا شهيد" />
            <asp:ListItem Value="Shahid" Text="شهيد" />
        </asp:RadioButtonList>

        <!-- From Table Country-->
        <asp:Label Text="محافظة الجامعة" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="cty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cty_SelectedIndexChanged"></asp:DropDownList>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />

        <!--Uname From Table University-->
        <asp:Label Text="اختصاص" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="Splzn" AutoPostBack="True" runat="server"></asp:DropDownList>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />

        <asp:Label Text="المعدل" runat="server" />
        <asp:TextBox ID="txtavg" MaxLength="5" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="erravg" CssClass="Validation Red" runat="server" ErrorMessage="Average cannot be blank" ControlToValidate="txtavg"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="erravgerage" CssClass="Red" runat="server" ErrorMessage="Avg must be between 50 to 100" ControlToValidate="txtavg" MinimumValue="50" MaximumValue="100" Type="Double"></asp:RangeValidator>
        <br />

        <asp:Label Text="رقم الهاتف" runat="server" />
        <asp:TextBox ID="txtPhe" TextMode="Phone" MaxLength="10" runat="server"></asp:TextBox>
        <asp:Label ID="errPheCh" CssClass="Validation Red" runat="server"></asp:Label>
        <asp:RequiredFieldValidator ID="errPhe" runat="server" CssClass="Validation Red" ErrorMessage="Phone cannot be blank" ControlToValidate="txtPhe"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errPheTen" CssClass="Validation Red" runat="server" ErrorMessage="Phone Numbers 10 Characters Only" ControlToValidate="txtPhe" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        <asp:CustomValidator ID="errStartPhe" CssClass="Red" runat="server" OnServerValidate="errStartPhe_ServerValidate" ClientValidationFunction="validateStartPhe" ControlToValidate="txtPhe" ErrorMessage="It must contain the phone number '09 or 011'"></asp:CustomValidator>
        <br />

        <asp:Label Text="من محافظة : " runat="server" />
        <asp:DropDownList ID="from_cty" runat="server"></asp:DropDownList>
        <br />

        <asp:Label ID="lpEmail" Text="البريد الكتروني" runat="server" />
        <asp:TextBox ID="txtEmail" TextMode="Email" placeholder="@gmail.com" runat="server" AutoCompleteType="Email"></asp:TextBox>
        <asp:Label ID="errEmailCh" CssClass="Validation Red" runat="server"></asp:Label>
        <asp:RequiredFieldValidator ID="errEmailRequired" CssClass="Validation Red" runat="server" ErrorMessage="Email cannot be blank" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errEmailConding" CssClass="Validation Red" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter proper email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:CustomValidator ID="errGmail" CssClass="Red" runat="server" ControlToValidate="txtEmail" ClientValidationFunction="validateGmail" ErrorMessage="must contain @gmail.com only"></asp:CustomValidator>
        <br id="bremail" runat="server" />

        <asp:Label ID="lpPass" Text="كلمة المرور جديدة" runat="server" />
        <asp:TextBox ID="txtPswd" TextMode="Password" runat="server" MaxLength="100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errPswd" CssClass="Validation Red" runat="server" ErrorMessage="Password cannot be blank" ControlToValidate="txtPswd"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="errPasswordCh" CssClass="Red" OnServerValidate="errPasswordCh_ServerValidate" ClientValidationFunction="validateLengthPwrd" ControlToValidate="txtPswd" runat="server" ErrorMessage="You must enter more than 15 characters"></asp:CustomValidator>
        <br id="brpass" runat="server" />

        <asp:Label ID="lpPassCm" Text="تأكيد كلمة المرور" runat="server" />
        <asp:TextBox ID="txtPswdCm" TextMode="Password" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errPswdCm" CssClass="Validation Red" runat="server" ControlToValidate="txtPswdCm" ErrorMessage="Password Confirm cannot be blank"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="errPswdCompare" CssClass="Red" runat="server" ControlToCompare="txtPswd" ControlToValidate="txtPswdCm" ErrorMessage="Password and confiem password must be same"></asp:CompareValidator>
        <br id="brpasscm" runat="server" />

        <asp:Button ID="brnCrt" runat="server" Text="إنشاء حساب" OnClick="BrnCrt_Click" />
    </div>

    <div id="EntCode" runat="server">
        <asp:Label Text="أدخل الرمز" runat="server" />
        <asp:TextBox ID="txtCode" MaxLength="30" runat="server"></asp:TextBox>
        <asp:Label ID="errCode" runat="server"></asp:Label>
        <asp:Button ID="CodeConfirm" runat="server" Text="تأكيد" OnClick="CodeConfirm_Click" />
    </div>
</asp:Content>

