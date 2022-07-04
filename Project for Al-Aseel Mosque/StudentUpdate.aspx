<%@ Page Title="Student Update" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="StudentUpdate.aspx.cs" Inherits="Project_for_Al_Aseel_Mosque.StudentUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container w-75">
        <h2 class="text-center mt-4 mb-3 border-bottom border-4 border-success pb-2">تعديل بيانات الطالب</h2>
        <asp:UpdatePanel ID="UpdatePanel1" class="w-100 text-center" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="DropDownInfoOrMiss" AutoPostBack="true" CssClass="form-select text-center" runat="server" OnSelectedIndexChanged="DropDownInfoOrMiss_SelectedIndexChanged">
                    <asp:ListItem Selected="True">معلومات الطالب</asp:ListItem>
                    <asp:ListItem>مهمات الطالب</asp:ListItem>
                </asp:DropDownList>
                <div class="d-flex justify-content-between mt-3 mb-3">
                    <label class="m-2">الاستاذ :</label>
                    <asp:RadioButtonList ID="RadioTeacher" AutoPostBack="true" CssClass="w-75" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RadioTeacher_SelectedIndexChanged">
                        <asp:ListItem class="radio-inline ms-5" Value="OmarBinKhattab" Text="وسام العمري"></asp:ListItem>
                        <asp:ListItem class="radio-inline" Value="AnasBinMalek" Text="براء اللحام"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="d-flex justify-content-between mt-3 mb-3">
                    <label class="m-2">الطالب :</label>
                    <asp:DropDownList ID="DropDownStudents" AutoPostBack="true" CssClass="form-select w-75 text-center" runat="server" OnSelectedIndexChanged="DropDownStudents_SelectedIndexChanged">
                        <asp:ListItem Value="0">none</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div id="infoStudent" runat="server">
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">الاسم :</label>
                        <input type="text" class="form-control w-75 text-center" id="sname" autocomplete="off" placeholder="أدخل اسم الطالب" runat="server">
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">الصف :</label>
                        <asp:XmlDataSource ID="XmlDataSource1" DataFile="~/SClass.xml" XPath="Students/Classes/class" runat="server"></asp:XmlDataSource>
                        <asp:DropDownList ID="DropDownClass" AutoPostBack="true" DataSourceID="XmlDataSource1" DataTextField="text" DataValueField="value" CssClass="form-control form-select w-75 text-center" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">الهاتف :</label>
                        <input type="text" class="form-control w-75 text-center" id="spho" autocomplete="off" placeholder="أدخل رقم الطالب" runat="server">
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">رقم الوالد :</label>
                        <input type="text" class="form-control w-75 text-center" id="dpho" autocomplete="off" placeholder="أدخل رقم الوالد" runat="server">
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">رقم الوالدة :</label>
                        <input type="text" class="form-control w-75 text-center" id="mpho" autocomplete="off" placeholder="أدخل رقم الوالدة" runat="server">
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">الاستاذ :</label>
                        <asp:XmlDataSource ID="XmlDataSource2" DataFile="~/SClass.xml" XPath="Students/Teacher/name" runat="server"></asp:XmlDataSource>
                        <asp:DropDownList ID="DropDownListTecher" DataSourceID="XmlDataSource2" DataTextField="text" DataValueField="value" CssClass="form-control form-select w-75 text-center" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">محفوظات :</label>
                        <textarea type="text" class="form-control w-75" id="prevhis" rows="3" placeholder="أدخل محفوظاته" runat="server"></textarea>
                    </div>
                </div>
                <div id="infoMission" runat="server">
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">التاريخ :</label>
                        <asp:DropDownList ID="DropDownDate" AutoPostBack="true" CssClass="form-control form-select w-75 text-center" runat="server" OnSelectedIndexChanged="DropDownDate_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">عدد الصفحات :</label>
                        <input type="text" class="form-control w-75 text-center" id="numpage" autocomplete="off" placeholder="أدخل عدد الصفحات تم تسميعها" runat="server">
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">التقدير :</label>
                        <asp:RadioButtonList ID="lvl" CssClass="mt-2" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem class="radio-inline ms-5" Text="ممتاز"></asp:ListItem>
                            <asp:ListItem class="radio-inline ms-5" Text="جيد جدا"></asp:ListItem>
                            <asp:ListItem class="radio-inline ms-5" Text="جيد"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">الوظيفة :</label>
                        <input type="text" class="form-control w-75 text-center" id="hmwork" autocomplete="off" placeholder="أدخل الوظيفة" runat="server">
                    </div>
                    <div class="d-flex justify-content-between mt-3 mb-3">
                        <label class="m-2">ملاحظات :</label>
                        <textarea type="text" class="form-control w-75" id="notes" rows="3" placeholder="أدخل ملاحظات" runat="server"></textarea>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
                <button id="btnStudentUpd" class="btn btn-success w-100 mt-2 mb-2" onserverclick="btnStudentUpd_ServerClick" runat="server">تعديل</button>
    </div>
</asp:Content>