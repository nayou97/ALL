<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_AnaBada.master" AutoEventWireup="true" CodeFile="FreeStore_admin.aspx.cs" Inherits="Book_FreeStore_FreeStore_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">





        .auto-style51 {
            height: 1832px;
            width: 1171px;
        }
        
         

        
        

        .auto-style27 {
            width: 1166px;
        }
        
        
        .auto-style77 {
            width: 1098px;
            margin:20px;
            padding:10px;
            background-color: #E5E5E5;
        }
        
        
        

                        

        .auto-style39 {
            width: 1148px;
            height: 169px;
        }
        
    
            
        .auto-style61 {
            font-size: small;
            padding-left: 20px;
            height: 50px;
        }


                 

         
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:1700px;height:2243px; margin-left:550px;">
        <strong>


        <span class="auto-style33">
        <span class="auto-style26">
        <asp:Image ID="Image3" runat="server" Height="133px" ImageUrl="~/CSS_pic/아나바다-운영자관리-상단배너.png" Width="1297px" />





    </span>
            </span>
            </strong><br />
        <span class="auto-style27">
            <span>


    
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="돌아가기" CssClass="button-style22" />
        <br />
        <br />


    
        <asp:Panel ID="Panel_view" runat="server" Height="1962px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><span class="auto-style27"><span>
            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                <br />
                <br />
                <br />
                <span class="auto-style27"><span>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [ANA]"></asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="569px">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <EmptyDataTemplate>
                        <div>
                            * 기부하신 데이터가 없습니다!
                        </div>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <div>
                            나의 ANA 목록
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <span class="auto-style27">
                        <table border="0" class="auto-style39">
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid;"><span><strong><span class="auto-style27">⊙ ANA 등록번호&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="lbl_num" runat="server" Text='<%# Eval("num") %>'></asp:Label>
                                    </span></strong></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; 기부자의 아이디(현 계정)&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; </strong>기부자 수령자 이름<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    </span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; </strong>기부자 전화번호<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </span></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; 기부자의 이메일&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; </strong>주소1<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Address1") %>'></asp:Label>
                                    </span></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; </strong>주소2<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Address2") %>'></asp:Label>
                                    </span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙&nbsp; </strong>기부자의 우편번호<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("PostNum") %>'></asp:Label>
                                    <strong>&nbsp;</strong></span></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙</strong>배송 방법<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("PostWay") %>'></asp:Label>
                                    </span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid;"><span class="auto-style27"><span><strong>
                                    <br />
                                    ⊙ </strong>주의사항(메모)<br />
                                    <br />
                                    </span>
                                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="124px" ReadOnly="True" Text='<%# Bind("WarningText") %>' TextMode="MultiLine" Width="958px"></asp:TextBox>
                                    <br />
                                    </span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙ </strong>책 제목<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("BookTitle1") %>'></asp:Label>
                                    </span></span></td>
                                <td class="auto-style61" style="border-bottom:solid;"><span><strong>⊙&nbsp; <span class="auto-style27">책 저자명&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Author1") %>'></asp:Label>
                                    </span></strong></span></td>
                                <td class="auto-style61" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙ 책 출판사명&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Publisher1") %>'></asp:Label>
                                    </strong></span></span></td>
                                <td class="auto-style61" style="border-bottom:solid;"><span class="auto-style27"><span><strong>⊙ </strong>동의 여부<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("YesOrNo") %>'></asp:Label>
                                    </span></span></td>
                            </tr>
                        </table>
                        </span>
                        <br />
                    </ItemTemplate>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:FormView>
                <br />
                <br />
                <br />
                </span></span>
                <br />
                    <br />
                    <asp:FormView ID="FormView2" runat="server" AllowPaging="True" DataKeyNames="num" DataSourceID="SqlDataSource2" Width="598px">
                        <EditItemTemplate>
                            num:
                            <asp:Label ID="numLabel2" runat="server" Text='<%# Eval("num") %>' />
                            <br />
                            bada_num:
                            <asp:TextBox ID="bada_numTextBox1" runat="server" Text='<%# Bind("bada_num") %>' />
                            <br />
                            UserID:
                            <asp:TextBox ID="UserIDTextBox1" runat="server" Text='<%# Bind("UserID") %>' />
                            <br />
                            UserName:
                            <asp:TextBox ID="UserNameTextBox1" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            Phone:
                            <asp:TextBox ID="PhoneTextBox1" runat="server" Text='<%# Bind("Phone") %>' />
                            <br />
                            PostNum:
                            <asp:TextBox ID="PostNumTextBox1" runat="server" Text='<%# Bind("PostNum") %>' />
                            <br />
                            Address1:
                            <asp:TextBox ID="Address1TextBox1" runat="server" Text='<%# Bind("Address1") %>' />
                            <br />
                            Address2:
                            <asp:TextBox ID="Address2TextBox1" runat="server" Text='<%# Bind("Address2") %>' />
                            <br />
                            email:
                            <asp:TextBox ID="emailTextBox1" runat="server" Text='<%# Bind("email") %>' />
                            <br />
                            BookTitle1:
                            <asp:TextBox ID="BookTitle1TextBox1" runat="server" Text='<%# Bind("BookTitle1") %>' />
                            <br />
                            Author1:
                            <asp:TextBox ID="Author1TextBox1" runat="server" Text='<%# Bind("Author1") %>' />
                            <br />
                            Publisher1:
                            <asp:TextBox ID="Publisher1TextBox1" runat="server" Text='<%# Bind("Publisher1") %>' />
                            <br />
                            PostWay:
                            <asp:TextBox ID="PostWayTextBox1" runat="server" Text='<%# Bind("PostWay") %>' />
                            <br />
                            WarningText:
                            <asp:TextBox ID="WarningTextTextBox1" runat="server" Text='<%# Bind("WarningText") %>' />
                            <br />
                            YesOrNo:
                            <asp:TextBox ID="YesOrNoTextBox1" runat="server" Text='<%# Bind("YesOrNo") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" CommandName="Update" Text="업데이트" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <div style="background-color:gainsboro; align-content:center; height: 42px; text-align: center;">
                                <br />
                                <strong>* 도서 수령 신청 기록이 없습니다!</strong><br />
                            </div>
                        </EmptyDataTemplate>
                        <HeaderTemplate>
                            <div style="background-color:gainsboro; align-content:center; height: 43px; text-align: center;">
                                <br />
                                <strong>BADA 바다 - 기록</strong><br />
                            </div>
                        </HeaderTemplate>
                        <InsertItemTemplate>
                            bada_num:
                            <asp:TextBox ID="bada_numTextBox2" runat="server" Text='<%# Bind("bada_num") %>' />
                            <br />
                            UserID:
                            <asp:TextBox ID="UserIDTextBox2" runat="server" Text='<%# Bind("UserID") %>' />
                            <br />
                            UserName:
                            <asp:TextBox ID="UserNameTextBox2" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            Phone:
                            <asp:TextBox ID="PhoneTextBox2" runat="server" Text='<%# Bind("Phone") %>' />
                            <br />
                            PostNum:
                            <asp:TextBox ID="PostNumTextBox2" runat="server" Text='<%# Bind("PostNum") %>' />
                            <br />
                            Address1:
                            <asp:TextBox ID="Address1TextBox2" runat="server" Text='<%# Bind("Address1") %>' />
                            <br />
                            Address2:
                            <asp:TextBox ID="Address2TextBox2" runat="server" Text='<%# Bind("Address2") %>' />
                            <br />
                            email:
                            <asp:TextBox ID="emailTextBox2" runat="server" Text='<%# Bind("email") %>' />
                            <br />
                            BookTitle1:
                            <asp:TextBox ID="BookTitle1TextBox2" runat="server" Text='<%# Bind("BookTitle1") %>' />
                            <br />
                            Author1:
                            <asp:TextBox ID="Author1TextBox2" runat="server" Text='<%# Bind("Author1") %>' />
                            <br />
                            Publisher1:
                            <asp:TextBox ID="Publisher1TextBox2" runat="server" Text='<%# Bind("Publisher1") %>' />
                            <br />
                            PostWay:
                            <asp:TextBox ID="PostWayTextBox2" runat="server" Text='<%# Bind("PostWay") %>' />
                            <br />
                            WarningText:
                            <asp:TextBox ID="WarningTextTextBox2" runat="server" Text='<%# Bind("WarningText") %>' />
                            <br />
                            YesOrNo:
                            <asp:TextBox ID="YesOrNoTextBox2" runat="server" Text='<%# Bind("YesOrNo") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert" Text="삽입" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <span class="auto-style27"><span>
                            <table border="0" class="auto-style39">
                                <tr>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;" colspan="2"><span><strong><span class="auto-style27">⊙&nbsp; BADA등록번호&nbsp; :&nbsp;
                                        <asp:Label ID="numLabel3" runat="server" Text='<%# Eval("num") %>' />
                                        </span></strong></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 기부(ANA) 등록번호&nbsp; :&nbsp;
                                        <asp:Label ID="bada_numLabel0" runat="server" Text='<%# Bind("bada_num") %>' />
                                        </strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 기부자의 아이디(현 계정)&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                        </strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 받는 이 이름&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="UserNameLabel0" runat="server" Text='<%# Bind("UserName") %>' />
                                        </strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 전화번호&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="PhoneLabel0" runat="server" Text='<%# Bind("Phone") %>' />
                                        </strong></span></span></td>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 이메일&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="emailLabel0" runat="server" Text='<%# Bind("email") %>' />
                                        </strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 주소1&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="Address1Label0" runat="server" Text='<%# Bind("Address1") %>' />
                                        </strong></span></span></td>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 주소2&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="Address2Label0" runat="server" Text='<%# Bind("Address2") %>' />
                                        </strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 우편번호&nbsp;&nbsp; :&nbsp;&nbsp; &nbsp;<asp:Label ID="PostNumLabel0" runat="server" Text='<%# Bind("PostNum") %>' />
                                        </strong></span></span></td>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 배송 방법&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="PostWayLabel0" runat="server" Text='<%# Bind("PostWay") %>' />
                                        </strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"></strong><span class="auto-style27"><span>
                                        <br />
                                        <strong>⊙ 주의사항(메모)<br /></strong>
                                        <br />
                                        <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Height="200px" ReadOnly="True" Text='<%# Bind("WarningText") %>' TextMode="MultiLine" Width="1099px"></asp:TextBox>
                                        </span></span>
                                        <br />
                                    </td>
                                </tr>



                                <tr>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 책 제목&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="LabelBookTitle1" runat="server" Text='<%# Bind("BookTitle1") %>' />
                                        </strong></span></span></td>
                                    <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 책 출판사&nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:Label ID="LabelPublisher1" runat="server" Text='<%# Bind("Publisher1") %>' />
                                        </strong></span></span></td>
                                </tr>

                                 
                            </span>
                            </span>
                            <tr>
                                <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 책 저자&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="LabelAuthor1" runat="server" Text='<%# Bind("Author1") %>' />
                                    </strong></span></span></td>
                                <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 동의 여부&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="LabelYesOrNo" runat="server" Text='<%# Bind("YesOrNo") %>' />
                                    </strong></span></span></td>
                            </tr>
                            </table>
                            </span></span></td>
                            </tr>
                            </span></span>
                            <caption>
                            </caption>
                        </ItemTemplate>
                    </asp:FormView>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [BADA]"></asp:SqlDataSource>
                </div>
                <br />
                <br />
            </span></span><br />
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;<br />
                <br />
        </asp:Panel>


    
            </span>
            </span>
        <br />
        <br />
        <br />
    <br />
    <br />
        <br />
        <br />
    </div>
</asp:Content>

