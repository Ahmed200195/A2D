<%@ Page Title="" Language="C#" MasterPageFile="~/University/BasicUniversity.Master" AutoEventWireup="true" CodeBehind="GraduateCheck.aspx.cs" Inherits="Hire_Me.University.GraduateCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Graduate Check</title>
    <style>
        #ContentPlaceHolder1_Graduates_Tb {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            text-align: center;
        }

            #ContentPlaceHolder1_Graduates_Tb td, #ContentPlaceHolder1_Graduates_Tb th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #ContentPlaceHolder1_Graduates_Tb tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #ContentPlaceHolder1_Graduates_Tb th {
                padding-top: 15px;
                padding-bottom: 15px;
                background-color: #0480AA;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Table ID="Graduates_Tb" runat="server" Height="123px" Width="567px" dir="rtl">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>التفاصيل</asp:TableHeaderCell>
                    <asp:TableHeaderCell>المعلومات</asp:TableHeaderCell>
                    <asp:TableHeaderCell>تأكيد</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="الرقم الوطني" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpNumId" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="ChNumId" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="الاسم الأول" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpfName" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="ChfName" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="الاسم العائلة" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lplName" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="ChlName" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="الاسم الأب" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpfaName" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="ChfaName" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="الاسم الأم" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpmaName" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="ChmaName" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="المعدل" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpavg" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="Chavg" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="تاريخ الولادة" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpdate" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="Chdate" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="الاختصاص" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpspec" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="Chspec" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:Label Text="ابن شهيد" runat="server" /></asp:TableCell><asp:TableCell runat="server">
                        <asp:Label Text="none" ID="lpshahid" runat="server" />
                    </asp:TableCell><asp:TableCell runat="server">
                        <asp:CheckBox AutoPostBack="true" ID="Chshahid" runat="server" OnCheckedChanged="ChNumId_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell ColumnSpan="2" runat="server">
                        <asp:Button ID="btnAcept" runat="server" Enabled="false" Text="مقبول" OnClick="btnAcept_Click" />
                        <asp:Button ID="btnUntrue" runat="server" Text="غير صحيحة" OnClick="btnUntrue_Click" />
                    </asp:TableCell><asp:TableCell ColumnSpan="1" runat="server">
                        <asp:CheckBox ID="CheAll" AutoPostBack="true" Text="تحديد الكل" runat="server" OnCheckedChanged="CheAll_CheckedChanged" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TabRowErr" Visible="false">
                    <asp:TableCell ColumnSpan="3">
                        <asp:Label ID="lpError" Text="Error Send Email" ForeColor="Red" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
