<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Basic_View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style type="text/css">


        

        .textbox{
            background-color:antiquewhite;
            border-color:burlywood;
        }


        .botton_design{
            background-color:brown;
            border-color:lemonchiffon;
            border-style:double;
        }
                                        
        
        .auto-style51 {
            height: 796px;
            width: 1193px;
        }
                                        
        .auto-style53 {
            color: #333333;
        }
                                        
        .auto-style59 {
            background-color: #D6CEAA;
            color: #FFFFFF;
            text-align: center;
            width: 103px;
        }
          
        
        .auto-style10 {
            background-color: white;
            text-align: center;
            

            border-top:groove;
            border-top-width:1px;
            border-top-color:gainsboro;
            
            border-bottom:groove;
            border-bottom-width:1px;
            border-bottom-color:gainsboro;
        }


        .auto-style60 {
            background-color: white;
            text-align: justify;
            border-top: 1px groove gainsboro;
            border-bottom: 1px groove gainsboro;
        }


        .auto-style62 {
            background-color: #D6CEAA;
            color: #FFFFFF;
            width: 103px;
        }


        .auto-style63 {
            height: 581px;
        }


        .auto-style64 {
            background-color: #D6CEAA;
            color: #FFFFFF;
            width: 100px;
        }
        .auto-style65 {
            background-color: #D6CEAA;
            color: #FFFFFF;
            text-align: center;
            width: 100px;
        }
        .auto-style66 {
            background-color: #D6CEAA;
            color: #FFFFFF;
            width: 101px;
        }
        .auto-style67 {
            background-color: #D6CEAA;
            color: #FFFFFF;
            text-align: center;
            width: 101px;
        }


        </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <!-- 전체 뷰  -->
    <div style="width:1300px; margin-left:550px;">


    <!-- 타이틀 범위 -->
        <!-- 타이틀 범위 -->
    




    <asp:Image ID="Image2" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/독후감쓰기_메뉴.jpg" />
    <br />
        <asp:Panel ID="Panel_view" runat="server" Height="973px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1292px">
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <br />
                <asp:Panel ID="Panel_table" runat="server" CssClass="auto-style6" Height="661px" Width="1164px">
                    <asp:Panel ID="Panel1" runat="server">
                        <strong>
                        <asp:Button ID="btnList" runat="server" CssClass="button-style44" onclick="btnList_Click" Text="리스트" />
                        <asp:Button ID="btnModifty" runat="server" CssClass="button-style44" onclick="btnModifty_Click" Text="수정" />
                        </strong>
                        <asp:Button ID="btnDelete" runat="server" CssClass="button-style44" onclick="btnDelete_Click" Text="삭제" />
                        <asp:Label ID="lblNum" runat="server" ForeColor="black" Visible="False"></asp:Label>
                    </asp:Panel>
                    <br />
                    <br />
                    <table align="center" class="auto-style63" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                            <td align="center" bgcolor="Silver" class="auto-style64"><strong>제목</strong></td>
                            <td bgcolor="white" class="auto-style60" colspan="5">
                                <asp:Label ID="lblTitle" runat="server" CssClass="auto-style53" ForeColor="black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="Silver" class="auto-style64"><strong>작성자</strong></td>
                            <td bgcolor="white" class="auto-style60">
                                <asp:Label ID="lbID" runat="server" ForeColor="black"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lblPostIP" runat="server" ForeColor="Black" Visible="False"></asp:Label>
                            </td>
                            <td bgcolor="Silver" class="auto-style65"><strong>작성일</strong></td>
                            <td bgcolor="white" class="auto-style60">
                                <asp:Label ID="lblPostDate" runat="server" ForeColor="black"></asp:Label>
                            </td>
                            <td align="center" bgcolor="Silver" class="auto-style66"><strong>책 별점</strong></td>
                            <td class="auto-style60">
                                <asp:Label ID="lblReviewStar" runat="server" ForeColor="black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="Silver" class="auto-style65"><strong>책이름</strong></td>
                            <td bgcolor="white" class="auto-style60">
                                <asp:Label ID="lblBookName" runat="server" ForeColor="black"></asp:Label>
                            </td>
                            <td bgcolor="Silver" class="auto-style65"><strong>책 저자명</strong></td>
                            <td bgcolor="white" class="auto-style60">
                                <asp:Label ID="lblAuthor" runat="server" ForeColor="black"></asp:Label>
                            </td>
                            <td align="center" bgcolor="Silver" class="auto-style67"><strong>책 장르</strong></td>
                            <td bgcolor="white" class="auto-style60">
                                <asp:Label ID="lblGenre" runat="server" ForeColor="black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="white" colspan="6" class="auto-style10">
                                <br />
                                <asp:TextBox ID="TextBox_Content" runat="server" Height="480px" ReadOnly="True" TextMode="MultiLine" Width="1140px" BorderStyle="None"></asp:TextBox>
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                <br />
                &nbsp;
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <br />
            &nbsp;<br />
            <br />
            <br />
                <br />
        </asp:Panel>
        <br />


    <!-- 게시글 범위-->
        <br />
        <!-- 게시글 범위-->
        <br /><br />


    <!-- 댓글란 -->
        <!-- 댓글란 -->
       
        
        
        
    </div> <!-- 전체 뷰  -->


    <br />
    <br />
    <br />
    </asp:Content>