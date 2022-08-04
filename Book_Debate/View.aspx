<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Members.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 

    <style type="text/css">
        .auto-style18 {
            background-color: #FFFFFF;
        }
        .auto-style21 {
            text-align: left;
            width: 1249px;
        }
        .auto-style22 {
            background-color: #F3F3F3;
            margin:20px;
        }
        .auto-style27 {
            width: 150px;
            height: 37px;
        }
        
        .textbox{
            background-color:antiquewhite;
            border-color:burlywood;
        }


        .botton_design{
            background-color:brown;
            border-color:lemonchiffon;
            border-style:double;
        }
                                        
            
        .auto-style39 {
            width: 100%;
            height: 169px;
        }
        
    
        .auto-style41 {
            height: 38px;
        }
        
    
        .auto-style42 {
            width: 703px;
            height: 50px;
        }
        .auto-style43 {
            width: 290px;
            height: 50px;
        }
        
    
        .auto-style44 {
            width: 1256px;
        }
        
    
        .auto-style55 {
            width: 1070px;
            height: 100px;
            text-align: left;
            background-color: #E9E9E9;
        }
        
    
    
        .auto-style59 {
            background-color: #B4E2EA;
            height: 50px;
        }
        .auto-style60 {
            height: 50px;
        }
                
    
        .auto-style63 {
            text-align: right;
            width: 1234px;
            margin:5px;
            padding:5px;
        }
        
    
            
        .auto-style67 {
            text-align: center;
            background-color: #B4E2EA;
            width: 1070px;
        }
        
    
        .auto-style70 {
            width: 1236px;
        }
        
    
        .auto-style72 {
            color: #000000;
        }
        
    
        .auto-style73 {
            width: 1072px;
            height: 746px;
        }
        
    
        .auto-style74 {
        width: 1253px;
    }
            
    
        .auto-style76 {
            margin:5px;
            padding:5px;
            width: 1043px;
            border:1px solid gainsboro;
            }
        
    
        .auto-style77 {
            height: 11px;
            width: 992px;
        }
        
    
        .auto-style78 {
            width: 992px;
        }
        
    
        .auto-style79 {
            width: 1300px;
            height: 3077px;
        }
        
    
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- 전체 뷰  -->
    <div style="margin-left:550px;background-color:white; " class="auto-style79" >


    <!-- 타이틀 범위 -->
        <!-- 타이틀 범위 -->
    




    <asp:Image ID="Image2" runat="server" Height="150px" Width="1296px" ImageUrl="~/CSS_pic/토론방_메뉴.jpg" />

    

        <br />
        
    <div style="margin:20px; border-style:solid; border-width:1px; margin:20px; padding:10px;" class="auto-style44">
        <table border="0" class="auto-style39">
                    <tr>
                        <td colspan="3" style="border-bottom:solid;" class="auto-style59"><strong>&nbsp;

                           <asp:Label ID="LabelSubject" runat="server" CssClass="auto-style72"></asp:Label>

                            </strong>

                           </td>
                    </tr>
                    <tr>
                        <td style="border-bottom:solid;" class="auto-style42"><strong>⊙ 작성자</strong>&nbsp; <asp:Label ID="LabelName" runat="server"></asp:Label>

                           </td>
                        <td style="border-bottom:solid;" class="auto-style43"><strong>⊙ </strong>
                    <span>


                            <strong >주제 상정일</strong></span>&nbsp;<asp:Label ID="LabelRegDate" runat="server"></asp:Label>

                           </td>
                        <td style="border-bottom:solid;" class="auto-style60"><strong>⊙ 조회</strong>&nbsp;

                           <asp:Label ID="LabelReadCount" runat="server"></asp:Label>

                           </td>
                    </tr>
                    <tr>
                        <td style="border-bottom:solid;" class="auto-style42">
                    <span>


                            <strong >⊙ 토론 시작일&nbsp; </strong>
                            <asp:Label ID="lbl_Term_start2" runat="server"></asp:Label>
            </span>

                           </td>
                        <td style="border-bottom:solid;" class="auto-style60" colspan="2">
                    <span>


                            <strong>⊙ 토론 종료일&nbsp; </strong>
                            <asp:Label ID="lbl_Term_end2" runat="server" ></asp:Label>
            </span>

                           </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom:solid; padding:5px;" class="auto-style41">

                            <asp:TextBox ID="TextBox_Content" runat="server" Height="175px" ReadOnly="True" TextMode="MultiLine" Width="1237px" BorderStyle="None"></asp:TextBox>
                            <br />

                        </td>
                    </tr>
                </table>
            <div class="auto-style63">
                    <asp:Label ID="LabelSeq" runat="server" Visible="False"></asp:Label>
                    <asp:Button ID="bnt_list" runat="server" CssClass="button-style33" OnClick="bnt_list_Click" Text="목록" CausesValidation="False" />
                    &nbsp;
                    <asp:Button ID="bnt_modify" runat="server" CssClass="button-style33" OnClick="bnt_modify_Click" Text="수정" CausesValidation="False" />
                    &nbsp;
                    <asp:Button ID="bnt_delete" runat="server" CssClass="button-style33" OnClick="bnt_delete_Click" Text="삭제" CausesValidation="False" />
                
        </div>
                <br />

    </div>

    <div style="margin:20px; padding:10px; border-style:solid; border-width:1px;" class="auto-style74">
               
                <div class="auto-style21">
                    <asp:Panel ID="Panel4" runat="server" Height="39px" Width="1249px" BorderStyle="Solid" BorderWidth="2px" BorderColor="white">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="댓글열기" CausesValidation="False" CssClass="button-style33" />
                        &nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="댓글닫기" CausesValidation="False" CssClass="button-style33" />
                        <span class="auto-style27"><strong>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="tbox1" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </strong></span>
                        <br />
                    </asp:Panel>
                </div>
        


         
            </div>
     
        
        
        
            <asp:Panel ID="Panel_comment" runat="server" CssClass="auto-style22" Height="2037px" Visible="False" Width="1279px">
                <br />
                <br />
                <table class="auto-style70" style="margin:20px; border:2px solid gainsboro;">
                    <tr>
                        <td class="auto-style67" style="padding:5px;"><span class="auto-style72"><strong>
                            <br />
                            댓글 입력하기 (* 300자 제한)<br />
                            <br />
                            </strong></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="댓글 내용을 입력하셔야 댓글을 남기실 수 있습니다." Visible="False">[댓글 내용] 필수입력</asp:RequiredFieldValidator>
                            <strong>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                            </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style55" style="padding:5px;">
                            <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None" CssClass="tbox1" Height="111px" MaxLength="300" TextMode="MultiLine" Width="1217px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="bnt_co_write" runat="server" CssClass="button-style33" OnClick="bnt_co_write_Click" Text="댓글쓰기" />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
                <div class="auto-style8" style="margin-left:100px;">
                    <asp:Panel ID="Panel_co_notice" runat="server" CssClass="auto-style18" Height="63px" Visible="False" Width="1068px">
                        <strong>
                        <br />
                        <asp:Label ID="lblText" runat="server" CssClass="auto-style18" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <br />
                        </strong>
                    </asp:Panel>
                </div>
                <br />
                <br />
                <div class="auto-style73" style="margin-left:100px;">
                    <asp:DataList ID="DtlBooks" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyField="c_seq" GridLines="Both" OnDeleteCommand="DtlBooks_DeleteCommand" RepeatColumns="1" Width="1069px">
                        <FooterStyle BackColor="#99CCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="#CCCCFF" />
                        <HeaderTemplate>
                            <div style="background-color:#B4E2EA; text-align:center;">
                                <strong>
                                <br class="auto-style72" />
                                <span class="auto-style72">의견을 남겨주세요.</span></strong><span class="auto-style72">
                                <br />
                                </span>
                                <br />
                            </div>
                        </HeaderTemplate>
                        <ItemStyle BackColor="White" ForeColor="#003399" />
                        <ItemTemplate>
                            <strong><span class="auto-style27">
                            <table class="auto-style76">
                                <tr>
                                    <td class="auto-style77">
                                        &nbsp;
                                        <asp:Image ID="Image1" runat="server" Height="20px" ImageUrl="~/CSS_pic/forum_re.gif" Width="20px" />
                                        <asp:Label ID="lbl_c_seq" runat="server" Text='<%# Eval("c_seq") %>' Visible="False"></asp:Label>
                                        <b><strong><span class="auto-style27">
                                        <asp:Label ID="lbl_c_content" runat="server" Text='<%# Eval("c_content") %>' Visible="False"></asp:Label>
                                        </span></strong>&nbsp;작성자&nbsp; :&nbsp;</b>&nbsp;<asp:Label ID="lbl_c_nickname" runat="server" Text='<%# Eval("c_nickname") %>'>[lbl_c_nickname]</asp:Label>
                                        &nbsp;&nbsp;<strong><span class="auto-style27">작성일자&nbsp; :&nbsp;&nbsp;<asp:Label ID="lbl_c_regDate" runat="server" Text='<%# Eval("c_regDate") %>'>[lbl_c_regDate]</asp:Label>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("c_seq") %>' CommandName="Delete" OnClick="LinkButton1_Click">[삭제]</asp:LinkButton>
                                        </span></strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style78"><strong><span class="auto-style27">
                                        <asp:TextBox ID="TextBox4" runat="server" BorderStyle="None" Height="59px" ReadOnly="True" Text='<%# Eval("c_content") %>' TextMode="MultiLine" Width="1031px"></asp:TextBox>
                                        <br />
                                        </span></strong></td>
                                </tr>
                            </table>
                            </span></strong>
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    </asp:DataList>
                    <br />
                </div>
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
                <br />
                <br />
                <div id="banner" class="auto-style48">
                    <asp:Label ID="lblPageFrom" runat="server" Text="Label"></asp:Label>
                    &nbsp;
                    <asp:Label ID="lblOf" runat="server" Text="Label"></asp:Label>
                    &nbsp;
                    <asp:Label ID="lblPageTo" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnFirst" runat="server" CausesValidation="False" CssClass="button-style33" onclick="btnFirst_Click" Text="처음" />
                    &nbsp;
                    <asp:Button ID="btnPrev" runat="server" CausesValidation="False" CssClass="button-style33" onclick="btnPrev_Click" Text="앞" />
                    &nbsp;
                    <asp:Button ID="btnNext" runat="server" CausesValidation="False" CssClass="button-style33" onclick="btnNext_Click" Text="다음" />
                    &nbsp;
                    <asp:Button ID="btnLast" runat="server" CausesValidation="False" CssClass="button-style33" onclick="btnLast_Click" Text="마지막" />
                    <br />
                    <asp:DataList ID="dtlpaging" runat="server" onselectedindexchanged="dtlpaging_SelectedIndexChanged" RepeatDirection="Horizontal" Visible="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lk" runat="server" CommandName="select" Text="<%#Container.DataItem %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <br />
                <br />
            </asp:Panel>
       
        
        
         
                <br />
       
        
        
        
    </div>
       
        
        
         
    <!-- 전체 뷰  -->
     
</asp:Content>

