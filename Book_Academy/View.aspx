<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Book_Academy_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style23 {
            width: 1129px;
            height: 229px;
        }
                                            
     
        
    
        .auto-style44 {
            width: 1188px;
            height: 1742px;
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
            border-color:#D6CEAA;
            border-style:solid;
            padding:10px;
        }
                
    
        .auto-style62 {
            height: 46px;
            text-align: justify;
        }
                
    
        .auto-style64 {
        width: 1162px;
        height: 229px;
    }
    .auto-style65 {
        width: 1300px;
        height: 2574px;
    }
                
    
        .auto-style66 {
            text-align: justify;
            height: 123px;
        }
                
    
        

        .auto-style43 {
            font-size: 10pt;
        }
                        
    


        .auto-style40 {
            width: 138px;
        }
        
    

        

        .auto-style71 {
            height: 46px;
            background-color: #D6CEAA;
            color: #FFFFFF;
            width: 150px;
        }
        .auto-style72 {
            height: 46px;
            width: 375px;
            text-align: justify;
        }
        .auto-style73 {
            height: 46px;
            width: 377px;
            text-align: justify;
        }
        .auto-style74 {
            height: 46px;
            background-color: #D6CEAA;
            color: #FFFFFF;
            width: 151px;
        }
        
    

        

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!-- 전체 뷰  -->
    <div style="margin-left:550px; background-color:white;" class="auto-style65" >


    <!-- 타이틀 범위 -->
        <!-- 타이틀 범위 -->
    




    <asp:Image ID="Image2" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/1대1논술교실_메뉴.jpg" />
    




             <br />


     
        <br />


     
        <fieldset class="auto-style43">
                    <legend class="auto-style40">&nbsp; ※&nbsp; 알림 사항</legend>

     
                    <br />

                    &nbsp; *&nbsp; 글 작성자 혹은 담당자가 아니면 글 내용을 조회할 수 없습니다.<br /> &nbsp; *&nbsp; 답변은 논술선생님만 작성 가능합니다.<br />
                    <br />
                    </fieldset><br />
        
                    <asp:Panel ID="Panel_menu" runat="server" Height="67px" Width="1279px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro">
                        &nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" CssClass="button-style44" OnClick="Button1_Click" Text="목록으로" />
                        <asp:Button ID="bnt_modify" runat="server" CssClass="button-style44" OnClick="Button2_Click" Text="글 수정하기" Visible="False" />
                        <asp:Button ID="bnt_del" runat="server" CssClass="button-style44" OnClick="Button3_Click" Text="글 삭제하기" Visible="False" />
                        <asp:Button ID="bnt_reply" runat="server" CssClass="button-style44" OnClick="Button4_Click" Text="답글달기" Visible="False" />
                    </asp:Panel>
        <div class="auto-style8">
        <asp:Panel ID="Panel_warning" runat="server" Height="414px" Visible="False">
            &nbsp;<br /> &nbsp;
            <br />
            <asp:Image ID="Image10" runat="server" Height="368px" ImageUrl="~/CSS_pic/논술-뷰-글을열람하실수없습니다.png" Width="515px" />
        </asp:Panel>
        </div>
        <br />
        <asp:Panel ID="Panel_view" runat="server" Height="1830px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px" Visible="False">
                <asp:Label ID="LabelSeq" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelReadCount" runat="server" Visible="False"></asp:Label>
                <br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style44">
                <br />
                <asp:Panel ID="Panel_question" runat="server" CssClass="auto-style59" Height="509px">
                    <br />
                    <asp:Panel ID="Panel_table" runat="server" Height="409px">
                        <asp:Image ID="Image7" runat="server" Height="100px" ImageUrl="~/CSS_pic/질문답변-디자인.png" Width="1158px" />
                        <table class="auto-style23" style="border-top:solid;border-top-color:gainsboro;border-top-width:2px;  border-bottom:solid;border-bottom-color:gainsboro;border-bottom-width:2px;">
                            <tr>
                                <td align="center" class="auto-style71"><strong>제목</strong></td>
                                <td bgcolor="white" class="auto-style62" colspan="5" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">&nbsp;
                                    <asp:Label ID="LabelSubject" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style71"><strong>이름</strong></td>
                                <td bgcolor="white" class="auto-style73" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">&nbsp;
                                    <asp:Label ID="LabelName" runat="server"></asp:Label>
                                </td>
                                <td align="center" bgcolor="Silver" class="auto-style74"><strong>날짜</strong></td>
                                <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">&nbsp;
                                    <asp:Label ID="LabelRegDate" runat="server"></asp:Label>
                                </td>
                                <td align="center" bgcolor="Silver" class="auto-style71"><strong>분야</strong></td>
                                <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">&nbsp;
                                    <asp:Label ID="LabelGenre" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="white" class="auto-style58" colspan="6">
                                    <asp:Label ID="LabelContent" runat="server" Visible="False"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txt_Content" runat="server" BorderStyle="None" Height="260px" ReadOnly="True" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                <br />
                <div class="auto-style8">
                    <asp:Panel ID="Panel_answer_error" runat="server" BorderColor="Gainsboro" BorderStyle="Solid" BorderWidth="2px" Height="393px" Visible="False" Width="1185px">
                        &nbsp;<br />
                        <asp:Image ID="Image9" runat="server" Height="371px" ImageUrl="~/CSS_pic/질문이작성되지않았습니다.png" Width="329px" />
                    </asp:Panel>
                </div>
                <br />
                <asp:Panel ID="Panel_answer" runat="server" CssClass="auto-style59" Height="702px" Visible="False">
                    <asp:Image ID="Image8" runat="server" Height="100px" ImageUrl="~/CSS_pic/답변이등록_판넬.png" Width="1158px" />
                    <br />
                    <asp:Label ID="lbl_seq2" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lbl_b_seq" runat="server" Visible="False">lbl_b_seq</asp:Label>
                    <br />
                    <table class="auto-style64" style="border-top:solid;border-top-color:gainsboro;border-top-width:2px;  border-bottom:solid;border-bottom-color:gainsboro;border-bottom-width:2px;">
                        <tr>
                            <td align="center" bgcolor="Silver" class="auto-style71"><strong>제목</strong></td>
                            <td bgcolor="white" class="auto-style62" colspan="5" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="lbl_Title" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="Silver" class="auto-style71"><strong>이름</strong></td>
                            <td class="auto-style72" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="lbl_answer" runat="server">lbl_answer</asp:Label>
                            </td>
                            <td align="center" bgcolor="Silver" class="auto-style71"><strong>날짜</strong></td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="lbl_anRegdate" runat="server"></asp:Label>
                            </td>
                            <td align="center" bgcolor="Silver" class="auto-style71"><strong>분야</strong></td>
                            <td class="auto-style57" style="border-bottom:solid;border-bottom-width:2px;border-bottom-color:gainsboro;">
                                <asp:Label ID="lbl_Genre" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="white" class="auto-style66" colspan="6">
                                <asp:Label ID="lbl_anContent" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:TextBox ID="txt_anContent" runat="server" BorderStyle="None" Height="260px" ReadOnly="True" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <asp:Panel ID="Panel_answer_bnt" runat="server" BorderColor="Gainsboro" BorderStyle="Solid" BorderWidth="2px" Height="69px" Visible="False" Width="1153px">
                        &nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="bnt_answer_modify" runat="server" CssClass="button-style44" OnClick="bnt_answer_modify_Click" style="height: 39px" Text="답글수정" />
                        &nbsp;
                        </asp:Panel>
                    <br />
                    <br />
                </asp:Panel>
                <br />
                <br />
            </div>
            <br />
        </asp:Panel><br />
                <br /> 
       
        
        
        
    </div> <!-- 전체 뷰  -->
    <br />
       </asp:Content>

