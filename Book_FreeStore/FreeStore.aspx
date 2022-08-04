<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_AnaBada.master" AutoEventWireup="true" CodeFile="FreeStore.aspx.cs" Inherits="Book_etc_FreeStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="../CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 

    <style type="text/css">
        



        .auto-style33 {
            font-size: x-large;
        }




        .auto-style35 {
            width: 1300px;
            margin-left:550px;
        }




        .auto-style36 {
            display: inline-block;
            border-radius: 5px;
            box-shadow: 0px 0px 0px 5px rgba(255, 255, 255, 0.1);
            line-height: normal;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            text-shadow: 0px 1px 0px rgba(0, 0, 0, .2);
            font-size: 1em;
            font-weight: 400;
            color: #FFF;
            border: 1px solid #8EBEAE;
            padding: 10px 20px;
            background: #99CCBB;
        }




    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="align-content:center;" class="auto-style35">

    <div id="page">
    

        <span class="auto-style33">
        <asp:Image ID="Image3" runat="server" Height="133px" ImageUrl="~/CSS_pic/아나바다_ana.jpg" Width="1297px" />
            </span>
            <br />


            <span class="auto-style26">
            <asp:Image ID="Image7" runat="server" Height="608px" ImageUrl="~/CSS_pic/아나바다-메인화면.png" Width="907px" />
    </span>
        <br />
        <span class="auto-style26">
        <br />
        <br />
        <asp:Image ID="Image8" runat="server" Height="219px" ImageUrl="~/CSS_pic/아나바다_문의사항.png" Width="898px" />
        <br />
        <br />
        <br />
            <asp:Button ID="bnt_admin" runat="server" Height="36px" OnClick="Button1_Click" Text="운영자전용" Width="143px" CssClass="auto-style36" Visible="False" />
        <br />
        <br />
        <br />

        
    </div>
    </div>
    <br />
    </span>
</asp:Content>

