<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Info.master" AutoEventWireup="true" CodeFile="MyPage.aspx.cs" Inherits="MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         
        .auto-style34 {
            width: 1221px;
            text-align: center;
            margin: 0px auto;
            color: #808080;
            background-color: #FFFFFF;
        }
                 
        .auto-style53 {
            font-size: 20pt;
            color: #000000;
        }
                
        .auto-style45 {
            width: 754px;
        }

        
        .auto-style49 {
            width: 115px;
            text-align: justify;
        }
        .auto-style50 {
            color: #99CCBB;
        }
        .auto-style54 {
            text-align: justify;
        }
        
                
        .auto-style47 {
            font-size: 10pt;
        }

            .auto-style52 {
            width: 1221px;
            margin: 0px auto;
            color: #808080;
            background-color: #ECECEC;
            text-align: center;
        }        


        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div style="width:1300px; margin-left:300px; margin-right:300px; background-color:white;">
     




    <asp:Image ID="Image3" runat="server" Height="300px" Width="1300px" ImageUrl="~/CSS_pic/회원끼리_상단배너.jpg" />
     



             
        <br />
            <div id="banner" class="auto-style52"> 
                <strong><span class="auto-style53">마이페이지&nbsp; -&nbsp; 회원정보 수정</span><br />
                <br />
                <br />
                회원님의 소중한 정보를 안전하게 관리하세요.</strong></div>



        <div id="page" class="auto-style34">
            <strong>
            <span class="auto-style27" __designer:mapid="210"><span __designer:mapid="211">
            <br />
            <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;" __designer:mapid="213">
                <tr __designer:mapid="214">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="215" class="auto-style49"><span __designer:mapid="24f" class="auto-style50">*</span> 아이디</td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="216">
                <strong>
                <asp:Label ID="IDLabel" runat="server" Text="IDLabel"></asp:Label>
                </strong>
                    </td>
                </tr>
                <tr __designer:mapid="219">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="21a" class="auto-style49">
                <strong>
            <span class="auto-style27" __designer:mapid="210"><span __designer:mapid="211">
                        <span __designer:mapid="25b" class="auto-style50">*</span>
                        성명</span></span></strong></td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="21b">
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                    </td>
                </tr>
                <tr __designer:mapid="21f">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="220" class="auto-style49">
                <strong>
            <span class="auto-style27" __designer:mapid="210"><span __designer:mapid="211">
                        <span __designer:mapid="25f" class="auto-style50">*</span>
                        휴대폰 번호(*)</span></span></strong></td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="221"><span class="auto-style47" __designer:mapid="222">
                <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                        </span></td>
                </tr>
                </table>
                </span></span>
                </strong>
            <br />
            <br />
    <asp:Button ID="Button8" runat="server" Height="55px" Text="회원정보수정" Width="139px" CssClass="button-style22" OnClick="bnt_change_Click" />



            <br />
            <br />
            <br />
            

     
        </div>
        <br />
        <br />
        <br />

        <br />
        <br />
     <br />

        
    </div>


        </asp:Content>

