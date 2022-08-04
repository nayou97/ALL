<%@ Page Title="" Language="C#" MasterPageFile="~/Master_HappyCampus.master" AutoEventWireup="true" CodeFile="Happy_MyPage.aspx.cs" Inherits="Book_HappyCampus_Happy_MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .nav {
            float : left;
            width: 300px;
            height: 300px;
            background-color : antiquewhite;
        }
        .nav_2{
            float : left;
        }
        .auto-style2 {
            height: 1231px;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style2">
        <h1>내 내역 정보&nbsp;&nbsp;
            <asp:Label ID="lblID" runat="server" Text="lblID"></asp:Label>
        </h1>
        <br />
        <br />
        내가 현재 올려놓은 파일들<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" Height="55px" Width="1033px" AllowPaging="True" AutoGenerateColumns="False" >
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="seq" DataNavigateUrlFormatString="Happy_view.aspx?seq={0}" DataTextField="seq" HeaderText="seq" SortExpression="seq" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                <asp:BoundField DataField="readcount" HeaderText="readcount" SortExpression="readcount" />
                <asp:BoundField DataField="regdate" HeaderText="regdate" SortExpression="regdate" />
                <asp:BoundField DataField="fileName" HeaderText="fileName" SortExpression="fileName" />
                <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" />
                <asp:BoundField DataField="downloadCount" HeaderText="downloadCount" SortExpression="downloadCount" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        총 횟수&nbsp;
        <asp:Label ID="lblUpLoadcnt" runat="server" Text="Label"></asp:Label>
        &nbsp; 회<br />
        <br />
        <br />
        <br />
        <br />
        내가 올린 모든 내역<br />
        <br />
        <asp:GridView ID="Grid_saving" runat="server" Height="55px" Width="1033px" AllowPaging="True" AutoGenerateColumns="False"  >
            <Columns>
                <asp:BoundField DataField="seq" HeaderText="seq" SortExpression="seq" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="pwd" HeaderText="pwd" SortExpression="pwd" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                <asp:BoundField DataField="readcount" HeaderText="readcount" SortExpression="readcount" />
                <asp:BoundField DataField="regdate" HeaderText="regdate" SortExpression="regdate" />
                <asp:BoundField DataField="fileName" HeaderText="fileName" SortExpression="fileName" />
                <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" />
                <asp:BoundField DataField="downloadCount" HeaderText="downloadCount" SortExpression="downloadCount" />
                <asp:BoundField DataField="ModifyDate" HeaderText="ModifyDate" SortExpression="ModifyDate" />
            </Columns>
        </asp:GridView>
        <br />
        총 횟수&nbsp;
        <asp:Label ID="lblSavingCnt" runat="server" Text="Label"></asp:Label>
        &nbsp; 회<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;<br />
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="120px">
            꼭 확인해 주세요. </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel3" runat="server" Height="120px">
            주의 </asp:Panel>
        <br />
        <br />
        <br />
    </div>
</asp:Content>

