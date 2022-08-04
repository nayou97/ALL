<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Notice.master" AutoEventWireup="true" CodeFile="etc_Notice_Del.aspx.cs" Inherits="Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style13 {
            width: 1221px;
            margin: 0px auto;
            text-align: center;
        }
        .txt {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:1300px; margin-left:550px;">



        <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl="~/CSS_pic/공지사항_메뉴.jpg" Width="1300px" />

    

    <br />
    <br />
        <div id="page" class="auto-style13">
            <span>
            <br />



            정말



    <asp:Label ID="lblNum" runat="server" ForeColor="Red"></asp:Label>
                 번 글을 삭제하시겠습니까?<br />
    
       



            <br />
            </span>
            <div id="banner" class="container">  



    <asp:Button ID="bnt_del" runat="server" OnClick="bnt_del_Click" Text="삭제하기" CssClass="button-style66" />



    &nbsp;



    <asp:Button ID="bnt_list" runat="server" OnClick="bnt_list_Click" Text="돌아가기" CssClass="button-style66" />
                </div>

    </div>
        <br />
    <br />
    </div>
</asp:Content>

