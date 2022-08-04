<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Book_HappyCampus_Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style18 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>

        <br />
        <br />
        <table class="table" style="width:600px;">

             <tr>

                    <td align="center" bgcolor="Silver" width="150" class="auto-style18">

                           이름</td>

                    <td width="450" class="auto-style18">

                           &nbsp;&nbsp;<asp:Label ID="LabelName" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150">

                           이메일</td>

                    <td width="450">

                           &nbsp;&nbsp;<asp:Label ID="LabelEmail" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150">

                           제목</td>

                    <td width="450">

                           &nbsp;&nbsp;<asp:Label ID="LabelTitle" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150" style="padding:10px;">

                           내용</td>

                    <td width="450">

                           <asp:Label ID="LabelContent" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150" class="auto-style18">

                           번호</td>

                    <td width="450" class="auto-style18">

                           &nbsp;&nbsp;<asp:Label ID="LabelSeq" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150">

                           읽음</td>

                    <td width="450">

                           &nbsp;&nbsp;<asp:Label ID="LabelReadCount" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150">

                           날짜</td>

                    <td width="450">

                           &nbsp;&nbsp;<asp:Label ID="LabelDate" runat="server"></asp:Label>

                    </td>

             </tr>

             <tr>

                    <td align="center" bgcolor="Silver" width="150">

                           첨부파일</td>

                    <td width="450">

                           &nbsp;&nbsp;<asp:Label ID="LabelFile" runat="server" Text="LabelFile" ></asp:Label>

                    &nbsp;
                           <asp:TextBox ID="txtFileName" runat="server" ReadOnly="True"></asp:TextBox>
&nbsp;
                           
                           <asp:Label ID="lbldownloadcnt" runat="server" Text="Label"></asp:Label>

                    </td>

             </tr>

 

       </table>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </div>
</asp:Content>

