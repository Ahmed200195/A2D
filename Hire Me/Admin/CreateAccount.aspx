<%@ Page Language="C#" MasterPageFile="~/Admin/MrAdmin.Master"  AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Hire_Me.Admin.CreateAccount" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="headAdmin" runat="server">
    <title id="titPage" runat="server">Create Account</title>
        <style>
        .Validation {
            position: absolute;
        }
        .Red {
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="ContentSectionCrtAcnt" ContentPlaceHolderID="SectionAdmin" runat="server">
    <asp:Label ID="changeName" Text="اسم " runat="server" />
    <asp:TextBox ID="txtName" runat="server" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="errNameRequired" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="txtName"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="errNameNoNum" ValidationGroup="btnCrtOrUpdt" CssClass="Red" runat="server" ErrorMessage="Name only" ControlToValidate="txtName" ValidationExpression="^[\sa-zA-Zء-ي]*$"></asp:RegularExpressionValidator>
    <br />

    <asp:Label Text="رقم الهاتف" runat="server" />
    <asp:TextBox ID="txtPhe" TextMode="Phone" MaxLength="10" runat="server"></asp:TextBox>
    <asp:Label ID="errPheCh" CssClass="Validation Red" runat="server"></asp:Label>
    <asp:RequiredFieldValidator ID="errPhe" runat="server" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" ErrorMessage="Phone cannot be blank" ControlToValidate="txtPhe"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="errPheTen" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" runat="server" ErrorMessage="Phone Numbers 10 Characters Only" ControlToValidate="txtPhe" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
    <asp:CustomValidator ID="errStartPhe" ValidationGroup="btnCrtOrUpdt" CssClass="Red" runat="server" OnServerValidate="errStartPhe_ServerValidate" ControlToValidate="txtPhe" ClientValidationFunction="validateStartPhe" ErrorMessage="It must contain the phone number '09 or 011'"></asp:CustomValidator>
    <br />

    <div id="governorate" runat="server">
        <!--From Table Country-->
        <asp:Label ID="lgover" Text="محافظة : " runat="server" />
        <asp:DropDownList ID="from_cty" runat="server"></asp:DropDownList>
        <br />
    </div>

    <div id="infoemail" runat="server">
        <asp:Label ID="lemail" Text="البريد الكتروني" runat="server" />
        <asp:TextBox ID="txtEmail" TextMode="Email" placeholder="@gmail.com" runat="server" AutoCompleteType="Email"></asp:TextBox>
        <asp:Label ID="errEmailCh" CssClass="Validation Red" runat="server"></asp:Label>
        <asp:RequiredFieldValidator ID="errEmailRequired" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" runat="server" ErrorMessage="Email cannot be blank" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="errEmailConding" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter proper email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:CustomValidator ID="errGmail" ValidationGroup="btnCrtOrUpdt" CssClass="Red" runat="server" OnServerValidate="errGmail_ServerValidate" ControlToValidate="txtEmail" ClientValidationFunction="validateGmail" ErrorMessage="must contain @gmail.com only"></asp:CustomValidator>
        <br />

        <asp:Label ID="lpswd" Text="كلمة المرور جديدة" runat="server" />
        <asp:TextBox ID="txtPswd" TextMode="Password" runat="server" MaxLength="100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errPswd" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" runat="server" ErrorMessage="Password cannot be blank" ControlToValidate="txtPswd"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="errPasswordCh" ValidationGroup="btnCrtOrUpdt" CssClass="Red" OnServerValidate="errPasswordCh_ServerValidate" ClientValidationFunction="validateLengthPwrd" ControlToValidate="txtPswd" runat="server" ErrorMessage="You must enter more than 15 characters"></asp:CustomValidator>
        <br />

        <asp:Label ID="lpswdcm" Text="تأكيد كلمة المرور" runat="server" />
        <asp:TextBox ID="txtPswdCm" TextMode="Password" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="errPswdCm" ValidationGroup="btnCrtOrUpdt" CssClass="Validation Red" runat="server" ControlToValidate="txtPswdCm" ErrorMessage="Password Confirm cannot be blank"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="errPswdCompare" ValidationGroup="btnCrtOrUpdt" CssClass="Red" runat="server" ControlToCompare="txtPswd" ControlToValidate="txtPswdCm" ErrorMessage="Password and confiem password must be same"></asp:CompareValidator>
        <br />
    </div>
    <asp:Button ID="brnCrt" runat="server" ValidationGroup="btnCrtOrUpdt" Text="إنشاء حساب" />
</asp:Content>