<%@ Page Title="Student Add" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="StudentAdd.aspx.cs" Inherits="Project_for_Al_Aseel_Mosque.Anas_bin_Malik_Episode.StudentAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container w-50 m-0">
        <h2 class="text-center mt-3">إضافة الطالب</h2>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">اسم الطالب :</label>
            <input type="text" class="form-control w-75" id="sname" autocomplete="off" placeholder="أدخل اسم الطالب" runat="server">
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">صف الطالب :</label>
            <asp:XmlDataSource ID="XmlDataSource1" DataFile="~/SClass.xml" XPath="Students/Classes/class" runat="server"></asp:XmlDataSource>
            <asp:DropDownList ID="DropDownClass" DataSourceID="XmlDataSource1" DataTextField="text" DataValueField="value" CssClass="form-control form-select w-75 text-center" runat="server">
            </asp:DropDownList>
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">رقم الطالب :</label>
            <input type="text" class="form-control w-75" id="spho" autocomplete="off" placeholder="أدخل رقم الطالب" runat="server">
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">رقم الوالد :</label>
            <input type="text" class="form-control w-75" id="dpho" autocomplete="off" placeholder="أدخل رقم الوالد" runat="server">
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">رقم الوالدة :</label>
            <input type="text" class="form-control w-75" id="mpho" autocomplete="off" placeholder="أدخل رقم الوالدة" runat="server">
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-1">
            <label class="m-2">الاستاذ :</label>
            <asp:RadioButtonList ID="RadioTeacher" CssClass="ms-5 mt-2" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem class="radio-inline ms-5" Value="OmarBinKhattab" Text="وسام العمري" Selected="True"></asp:ListItem>
                <asp:ListItem class="radio-inline" Value="AnasBinMalek" Text="براء اللحام"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="d-flex justify-content-center">
            <button id="btnStudentAdd" class="btn btn-success w-50" onserverclick="btnStudentAdd_ServerClick" runat="server">إضافة</button>
        </div>
    </div>
    <img src="Images/IMG-20211113-WA0012.jpg" class="rounded m-3" width="484" height="416">
</asp:Content>
