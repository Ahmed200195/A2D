<%@ Page Title="Student Mission" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="StudentMission.aspx.cs" Inherits="Project_for_Al_Aseel_Mosque.StudentMission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container w-50 m-0">
        <h2 class="text-center mt-4 mb-3 border-bottom border-5 border-success pb-2">إضافة مهمات التسميع</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
                    <label class="m-2">الاستاذ :</label>
                    <asp:RadioButtonList ID="RadioTeacher" AutoPostBack="true" CssClass="ms-5 mt-2" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RadioTeacher_SelectedIndexChanged">
                        <asp:ListItem class="radio-inline ms-5" Value="OmarBinKhattab" Text="وسام العمري"></asp:ListItem>
                        <asp:ListItem class="radio-inline" Value="AnasBinMalek" Text="براء اللحام"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
                    <label class="m-2">الطالب :</label>
                    <asp:DropDownList ID="DropDownStudents" CssClass="form-control form-select w-75 text-center" runat="server">
                        <asp:ListItem Value="0">none</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">عدد الصفحات :</label>
            <input type="text" class="form-control w-75 text-center" id="numpage" autocomplete="off" placeholder="أدخل عدد الصفحات تم تسميعها" runat="server">
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">التقدير :</label>
            <asp:RadioButtonList ID="lvl" CssClass="mt-2" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem class="radio-inline ms-5" Text="ممتاز"></asp:ListItem>
                <asp:ListItem class="radio-inline ms-5" Text="جيد جدا"></asp:ListItem>
                <asp:ListItem class="radio-inline ms-5" Text="جيد"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">الوظيفة :</label>
            <input type="text" class="form-control w-75 text-center" id="hmwork" autocomplete="off" placeholder="أدخل الوظيفة" runat="server">
        </div>
        <div class="d-flex align-content-center justify-content-between mt-3 mb-3">
            <label class="m-2">ملاحظات :</label>
            <textarea type="text" class="form-control w-75" id="notes" rows="3" placeholder="أدخل ملاحظات" runat="server"></textarea>
        </div>
        <div class="d-flex justify-content-center mb-3">
            <button id="btnMissionAdd" class="btn btn-success w-50 me-5" onserverclick="btnMissionAdd_ServerClick" runat="server">إضافة</button>
        </div>
    </div>
    <div class="position-relative w-50 d-flex justify-content-center">
        <i class="bi bi-journal-check mt-4 position-absolute" style="color: seagreen; font-size: 300px;"></i>
    </div>
</asp:Content>
