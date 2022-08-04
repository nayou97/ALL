<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Happy_view.aspx.cs" Inherits="Book_HappyCampus_Happy_sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style51 {
            height: 857px;
            width: 1172px;
        }
        


        
        .auto-style29 {
            margin-bottom: 0px;
        }
        
        .auto-style23 {
            width: 1149px;
            height: 261px;
        }
                                            
    
        .auto-style57 {
            height: 46px;
            width: 376px;
            text-align: justify;
        }
        .auto-style58 {
            text-align: justify;
        }
        
    
        
    
        .auto-style59 {
            height: 46px;
            text-align: justify;
        }
        
    
        
    
        .auto-style61 {
            height: 46px;
            width: 150px;
            background-color: #D6CEAA;
            color: #FFFFFF;
        }
        
    
        
    
        .auto-style62 {
            height: 46px;
            background-color: #D6CEAA;
            color: #FFFFFF;
        }
        
    
        
    
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="width:1300px; margin-left:550px; background-color:white; ">
    




    <asp:Image ID="Image3" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/자료나눔_메뉴.jpg" CssClass="auto-style29" />
    




        <br />

    <br />
        <asp:Panel ID="Panel_view" runat="server" Height="1046px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px">
            <span>
            <asp:Label ID="LabelSeq" runat="server" Visible="False"></asp:Label>
            </span>
            <br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <br />
                <asp:Panel ID="Panel_table" runat="server" CssClass="auto-style6" Height="776px" Width="1164px">
                    <asp:Button ID="btn_list" runat="server" CssClass="button-style44" OnClick="btn_list_Click" Text="목록" />
                    <asp:Button ID="bnt_del" runat="server" CssClass="button-style44" OnClick="bnt_del_Click" Text="삭제" />
                    <asp:Button ID="bnt_modify" runat="server" CssClass="button-style44" OnClick="bnt_modify_Click" Text="수정" />
                    <br />
                    <br />
                    <table class="auto-style23" style="border-top:solid;border-top-color:gainsboro;border-top-width:2px;  border-bottom:solid;border-bottom-color:gainsboro;border-bottom-width:2px;">
                        <tr>
                            <td align="center" class="auto-style62" width="150"><strong>제목</strong></td>
                            <td bgcolor="white" class="auto-style57" colspan="5" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">&nbsp;<span><asp:Label ID="LabelTitle" runat="server"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td align="center" class="auto-style62" width="150"><strong>작성자</strong></td>
                            <td bgcolor="white" class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;"><span>
                                &nbsp;<asp:Label ID="LabelName" runat="server"></asp:Label>
                                </span></td>
                            <td align="center" class="auto-style61"><strong>작성일</strong></td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;"><span>
                                &nbsp;<asp:Label ID="LabelDate" runat="server"></asp:Label>
                                </span></td>
                            <td align="center" class="auto-style62" width="150"><strong>조회수</strong></td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;"><span>
                                &nbsp;<asp:Label ID="LabelReadCount" runat="server"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td align="center" class="auto-style62" width="150"><strong>첨부파일</strong></td>
                            <td bgcolor="white" class="auto-style59" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;" colspan="5"><span>
                                &nbsp;<asp:Label ID="LabelFile" runat="server" Text="LabelFile"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td bgcolor="white" class="auto-style58" colspan="6">
                                <asp:TextBox ID="TextBox_Content" runat="server" Height="552px" ReadOnly="True" TextMode="MultiLine" Width="1138px" BorderStyle="None"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                <br />
                <br />
                <br />
            </div>
        </asp:Panel>

    <br />
     
        
    </div>

       <br />

    <br />
    </asp:Content>

