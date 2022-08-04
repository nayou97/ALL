<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_AnaBada.master" AutoEventWireup="true" CodeFile="FreeStore_mypage.aspx.cs" Inherits="Book_FreeStore_FreeStore_mypage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            font-size: 10pt;
        }
    




        .auto-style33 {
            font-size: 10pt;
        }




        .auto-style36 {
            text-align: center;
            font-size: large;
        }




                
        .auto-style51 {
            height: 1686px;
            width: 1175px;
        }
        
         

        
        

        .auto-style27 {
            text-decoration: none;
        }
        
            
        

        .auto-style27 {
            width: 150px;
            height: 37px;
        }
        
                

        
        .auto-style40 {
            width: 138px;
            text-align: left;
        }
        
    


                

        .auto-style39 {
            width: 1000px;
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
    <div style=" width: 1300px; margin-left:550px; height: 2582px;">
        <strong>

        <asp:Image ID="Image3" runat="server" Height="133px" ImageUrl="~/CSS_pic/나의아나바다사용목록_상단배너.png" Width="1297px" />




            <br />
        </strong>
        <br />
         


      
        <fieldset>
                    <legend class="auto-style40">&nbsp; ※ 알림 사항</legend>

     
                    <br />

                    &nbsp;*&nbsp; 
        <strong>


        <asp:Label ID="lbl_pageuser" runat="server" CssClass="auto-style36" Text="lbl_pageuser"></asp:Label>
                    &nbsp;님의 아나바다 사용기록을 이곳에서 확인해보세요!<br />
                    </strong>
                    <br />
                    &nbsp;*&nbsp; 기타 문의하실 사항이나 ANA &amp; BADA 폼 작성시, 정보를 잘못 작성하셨거나 신청기록을 취소하고 싶으시다면 운영자에게 메일을 보내주세요.<br />

                    <br />
                    </fieldset><br />
        <br />
        <br /> 


      
                <asp:Button ID="Button1" runat="server" CssClass="button-style22" OnClick="Button1_Click" Text="돌아가기" />
                


      
        <br />
        <br />
        <br />


    
        <asp:Panel ID="Panel_view" runat="server" Height="1779px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1294px">
            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
               
                <br />
               
                <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="526px">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <EmptyDataTemplate>
                        <strong>* 기부하신 데이터가 없습니다! </strong>
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
                                <td class="auto-style61" style="border-bottom:solid;" colspan="2"><span class="auto-style27">
                                    <span><strong>⊙&nbsp; </strong>주소2<strong>&nbsp;&nbsp; :&nbsp;&nbsp; </strong>
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
                                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" TextMode="MultiLine" BorderStyle="None" Height="124px" Text='<%# Bind("WarningText") %>' Width="958px"></asp:TextBox>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [ANA] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbl_pageuser" Name="UserID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </span></span>
               
                <br />
                <br />
                <br />
               
                <br />
                <asp:FormView ID="FormView2" runat="server" AllowPaging="True" DataKeyNames="num" DataSourceID="SqlDataSource2" Width="493px">
                    <EditItemTemplate>
                        num:
                        <asp:Label ID="numLabel1" runat="server" Text='<%# Eval("num") %>' />
                        <br />
                        bada_num:
                        <asp:TextBox ID="bada_numTextBox" runat="server" Text='<%# Bind("bada_num") %>' />
                        <br />
                        UserID:
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        <br />
                        UserName:
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                        <br />
                        Phone:
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        <br />
                        PostNum:
                        <asp:TextBox ID="PostNumTextBox" runat="server" Text='<%# Bind("PostNum") %>' />
                        <br />
                        Address1:
                        <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
                        <br />
                        Address2:
                        <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        BookTitle1:
                        <asp:TextBox ID="BookTitle1TextBox" runat="server" Text='<%# Bind("BookTitle1") %>' />
                        <br />
                        Author1:
                        <asp:TextBox ID="Author1TextBox" runat="server" Text='<%# Bind("Author1") %>' />
                        <br />
                        Publisher1:
                        <asp:TextBox ID="Publisher1TextBox" runat="server" Text='<%# Bind("Publisher1") %>' />
                        <br />
                        PostWay:
                        <asp:TextBox ID="PostWayTextBox" runat="server" Text='<%# Bind("PostWay") %>' />
                        <br />
                        WarningText:
                        <asp:TextBox ID="WarningTextTextBox" runat="server" Text='<%# Bind("WarningText") %>' />
                        <br />
                        YesOrNo:
                        <asp:TextBox ID="YesOrNoTextBox" runat="server" Text='<%# Bind("YesOrNo") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="업데이트" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <strong>* 도서 수령 신청 기록이 없습니다!</strong>
                    </EmptyDataTemplate>
                    <HeaderTemplate>
                        <div style="background-color:gainsboro; align-content:center; height: 43px; text-align: center;">
                            <br />
                            <strong>BADA 바다 - 기록</strong><br />
                            </div>
                    </HeaderTemplate>
                    <InsertItemTemplate>
                        bada_num:
                        <asp:TextBox ID="bada_numTextBox" runat="server" Text='<%# Bind("bada_num") %>' />
                        <br />
                        UserID:
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        <br />
                        UserName:
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                        <br />
                        Phone:
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        <br />
                        PostNum:
                        <asp:TextBox ID="PostNumTextBox" runat="server" Text='<%# Bind("PostNum") %>' />
                        <br />
                        Address1:
                        <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
                        <br />
                        Address2:
                        <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        BookTitle1:
                        <asp:TextBox ID="BookTitle1TextBox" runat="server" Text='<%# Bind("BookTitle1") %>' />
                        <br />
                        Author1:
                        <asp:TextBox ID="Author1TextBox" runat="server" Text='<%# Bind("Author1") %>' />
                        <br />
                        Publisher1:
                        <asp:TextBox ID="Publisher1TextBox" runat="server" Text='<%# Bind("Publisher1") %>' />
                        <br />
                        PostWay:
                        <asp:TextBox ID="PostWayTextBox" runat="server" Text='<%# Bind("PostWay") %>' />
                        <br />
                        WarningText:
                        <asp:TextBox ID="WarningTextTextBox" runat="server" Text='<%# Bind("WarningText") %>' />
                        <br />
                        YesOrNo:
                        <asp:TextBox ID="YesOrNoTextBox" runat="server" Text='<%# Bind("YesOrNo") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="삽입" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <span class="auto-style27"><span>
                        <table border="0" class="auto-style39">
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span><strong><span class="auto-style27">⊙&nbsp; BADA등록번호&nbsp; :&nbsp;
                                    <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' />
                                    </span></strong></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 기부(ANA) 등록번호&nbsp; :&nbsp;
                                    <asp:Label ID="bada_numLabel" runat="server" Text='<%# Bind("bada_num") %>' />
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 기부자의 아이디(현 계정)&nbsp;&nbsp; :&nbsp;&nbsp; 
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 받는 이 이름&nbsp;&nbsp; :&nbsp;&nbsp; 
                                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                                    </strong>
                                    </span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 전화번호&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                                    </strong></span></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 이메일&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 주소1&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
                                    </strong></span></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 주소2&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 우편번호&nbsp;&nbsp; :&nbsp;&nbsp; &nbsp;<asp:Label ID="PostNumLabel" runat="server" Text='<%# Bind("PostNum") %>' />
                                    </strong></span></span></td>
                                <td class="auto-style61" colspan="2" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙&nbsp; 배송 방법&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="PostWayLabel" runat="server" Text='<%# Bind("PostWay") %>' />
                                    </strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style61" colspan="4" style="border-bottom:solid; border-bottom-color: #B0C4DE;"></strong><span class="auto-style27"><span>
                                    <br />
                                    <strong>⊙ 주의사항(메모)<br /> </strong><br /> 
                                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Height="200px" ReadOnly="True" Text='<%# Bind("WarningText") %>' TextMode="MultiLine" Width="950px"></asp:TextBox>
                                    </span></span><br /> </span>
                                    <br />
                                    </span>
                                <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙ 책 제목&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="BookTitle1Label" runat="server" Text='<%# Bind("BookTitle1") %>' />
                                    </strong></span></span></td>
                                <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span><strong>⊙&nbsp; <span class="auto-style27">책 저자&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Author1Label" runat="server" Text='<%# Bind("Author1") %>' />
                                    </span></strong></span></td>
                                <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙ 책 출판사&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="Publisher1Label" runat="server" Text='<%# Bind("Publisher1") %>' />
                                    </strong></span></span></td>
                                <td class="auto-style61" style="border-bottom:solid; border-bottom-color: #B0C4DE;"><span class="auto-style27"><span><strong>⊙ 동의 여부&nbsp;&nbsp; :&nbsp;&nbsp;
                                    <asp:Label ID="YesOrNoLabel" runat="server" Text='<%# Bind("YesOrNo") %>' />
                                    </strong></span></span></td>
                            </tr>
                        </table>
                        </span></span>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [BADA] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbl_pageuser" Name="UserID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div><br />
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;<br />
                <br />
        </asp:Panel>

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

    </div>
</asp:Content>

