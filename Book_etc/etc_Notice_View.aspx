<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Notice.master" AutoEventWireup="true" CodeFile="etc_Notice_View.aspx.cs" Inherits="Book_Academy_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         
        
    
        .auto-style44 {
            width: 1186px;
            height: 499px;
        }
        
    
        .auto-style23 {
            width: 1179px;
            height: 403px;
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
            width: 1300px;
            height: 1064px;
        }
        
    
        .auto-style60 {
            height: 46px;
            text-align: justify;
        }
        
    
        .auto-style61 {
            height: 46px;
            background-color: #FDA671;
            font-weight: bold;
            color: #FFFFFF;
        }
        
    
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="margin-left:550px; background-color:white; " class="auto-style59"  >



        <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl="~/CSS_pic/공지사항_메뉴.jpg" Width="1300px" />

    

       <br />
        <asp:Panel ID="Panel_view" runat="server" Height="658px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1286px">
            <br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style44">
                <asp:Button ID="bnt_list" runat="server" CssClass="button-style66" OnClick="bnt_list_Click" Text="목록" />
                <asp:Button ID="bnt_modify" runat="server" CssClass="button-style66" OnClick="bnt_modify_Click" Text="수정" />
                <asp:Button ID="bnt_del" runat="server" CssClass="button-style66" OnClick="bnt_del_Click" Text="삭제" />
                <asp:Label ID="LabelNum" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Panel ID="Panel_table" runat="server" Width="1199px" Height="433px">
                    <br />
                    <table class="auto-style23" style="border-top:solid;border-top-color:gainsboro;border-top-width:2px;  border-bottom:solid;border-bottom-color:gainsboro;border-bottom-width:2px;">
                        <tr>
                            <td align="center" class="auto-style61" width="150" >제목</td>
                            <td bgcolor="white" class="auto-style60" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;" colspan="5">
                                <asp:Label ID="LabelTitle" runat="server"></asp:Label>
                            </td>
                            </tr>
                           
                         <tr>

                            <td align="center" class="auto-style61" width="150">이름</td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="LabelID" runat="server"></asp:Label>
                             </td>
                            <td align="center" class="auto-style61" width="150">날짜</td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="LabelPostDate" runat="server"></asp:Label>
                             </td>
                            <td align="center" class="auto-style61" width="150">읽음</td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="LabelReadCount" runat="server"></asp:Label>
                             </td>
                        </tr>
                        <tr>
                            <td bgcolor="white" colspan="6" class="auto-style58">
                                <asp:TextBox ID="TextBox_Content" runat="server" Height="280px" ReadOnly="True" TextMode="MultiLine" Width="1165px" BorderStyle="None"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                <br />
            </div>
        </asp:Panel> 
    </div>
</asp:Content>

