<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_AnaBada.master" AutoEventWireup="true" CodeFile="FreeStore_BADA.aspx.cs" Inherits="Book_etc_FreeStore_BADA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <script type="text/javascript">
 
        function message()
        {


            var message = "작성하던 문서를 취소하시겠습니까?";


            var result = confirm(message);
 
 
            if (result == true) {  //응 취소하고 갈길 갈래

                window.location.href = '/Book_FreeStore/FreeStore.aspx';

            }

            else //아니요;; 잘못누른거니까 계속작성할거임.
            {
                return;

            }

        }
 
</script>


    <style type="text/css">

        .auto-style1 {
            color: #FFFFFF;
            background-color: #00CCFF;
        } 


        

        

        .auto-style40 {
            text-align: center;
            margin-left:50px;
            font-size:10pt;
            width: 1200px;
        }
        



        .auto-style48 {
            width: 311px;
            text-align: justify;
            border-bottom: 2px solid lightsteelblue;
            background-color: #FFFFFF;
            padding-left:10px;
        }
        



        
        .auto-style33 {
            font-size: x-large;
        }




        .auto-style50 {
            background-color: #FFFFFF;
            font-size: 10pt;
        }




        .auto-style65 {
            width: 1012px;
            height: 227px;
            margin-left:10px;
        }




        .auto-style67 {
            width: 105px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            text-align: justify;
            padding:10px;
        }




        .auto-style78 {
            width: 1209px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            height: 988px;
            text-align: right;
        }
        .auto-style76 {
            width: 916px;
            height: 175px;
            border-top-color: orangered;
            border-top-width: 2px;
            border-top-style: double;
            border-top-color: inherit;
            margin-left: 100px;
        }
        
        
        .auto-style99 { 
            text-align: left;
            padding-left:20px;
            border-bottom:2px solid gainsboro;
            font-size: xx-large;
        }

        .auto-style100 {
            color: #FF0000;
        }

        .auto-style101 {
            font-size: small;
        }

        .auto-style102 {
            display: inline-block;
            padding: 10px 20px;
            background: #99CCBB;
            border-radius: 5px;
            box-shadow: 0px 0px 0px 5px rgba(255,255,255,0.1);
            border: 1px solid #8EBEAE;
            line-height: normal;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            text-shadow: 0px 1px 0px rgba(0,0,0,.2);
            font-size: 10pt;
            font-weight: 400;
            color: #FFF;
        }

        .auto-style104 {
            text-align: center;
            margin-left: 50px;
            font-size: small;
            height: 860px;
            width: 1109px;
        }
        
        .auto-style106 {
            text-align: center;
            margin-left: 50px;
            font-size: 10pt;
            height: 783px;
            width: 1026px;
        }

        .auto-style107 {
            width: 1182px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            height: 868px;
            text-align: right;
        }
        .auto-style108 {
            text-align: center;
            margin-left: 50px;
            font-size: 10pt;
            width: 920px;
        }

        .auto-style109 {
            display: inline-block;
            padding: 10px 20px;
            background: #DCDCDC;
            border-radius: 5px;
            box-shadow: 0px 0px 0px 5px rgba(255,255,255,0.1);
            border: 1px solid #706C53;
            line-height: normal;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            text-shadow: 0px 1px 0px rgba(0,0,0,.2);
            font-size: 10pt;
            font-weight: 400;
            color: #FFF;
            font-weight: bold;
        }

        .auto-style110 {
            width: 893px;
        }

        .auto-style111 {
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            text-align: center;
            padding: 10px;
            font-size: small;
        }
        .auto-style112 {
            width: 105px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            text-align: justify;
            padding: 10px;
            font-size: small;
        }

        .auto-style113 {
            height: 484px;
            width: 1228px;
        }

        </style>

    
<script type="text/javascript">

    function button_event() {

        if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true) {    //확인
           
            location.replace('/Book_FreeStore/FreeStore.aspx');


        } else {   //취소

            return;

        }

    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id=id style=" width: 1300px; margin-left:550px; height: 3643px;">


         

        <asp:Image ID="Image3" runat="server" Height="133px" ImageUrl="~/CSS_pic/아나바다_BADA.jpg" Width="1297px" />


            <br />
                        <asp:Panel ID="Panel_step1" runat="server" CssClass="auto-style50" Height="1016px" Width="1292px"> 
                                
                            <h1 class="auto-style99">1단계&nbsp; -&nbsp; 책 고르기</h1>
                            <div class="auto-style107" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                                <br />
                                <div class="auto-style106" style="border-style: groove; border-color: inherit; border-width: medium; background-color:white; ">
                                    <br />
                                    <br />
                                    <div style="border:solid; padding:10px; margin-left:50px;" class="auto-style110">
                                    <br />
                                     
                                    <asp:GridView ID="gridBADA" runat="server" AllowPaging="True" 
                                        OnPageIndexChanging="gridBADA_PageIndexChanging" PageSize="5"
                                        AutoGenerateColumns="False" CssClass="auto-style101" DataKeyNames="num" Width="893px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="CheckAll">
                                                <HeaderTemplate>
                                                    <div class="auto-style31">
                                                        <span class="auto-style26">현재 ANA를 통해 기부된 책 목록</span></div>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="num" HeaderText="등록번호" InsertVisible="False" ReadOnly="True" SortExpression="num" />
                                            <asp:BoundField DataField="BookTitle1" HeaderText="책 제목" SortExpression="BookTitle1" />
                                            <asp:BoundField DataField="Author1" HeaderText="작가명" SortExpression="Author1" />
                                            <asp:BoundField DataField="Publisher1" HeaderText="책 출판사" SortExpression="Publisher1" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <EmptyDataTemplate>
                                            <br />
                                            등록된 기부 목록이 없습니다.<br />
                                            <br />
                                        </EmptyDataTemplate>
                                        
                                        
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                        
                                    </asp:GridView>
                                        <br />
                                    <asp:Label ID="lblInfo" runat="server" CssClass="auto-style101" Text="lblInfo" Visible="False"></asp:Label>
                                    <br />
                                        </div><br />
                                    <table class="auto-style108">
                                        <tr>
                                            <td class="auto-style67">기부 등록번호</td>
                                            <td class="auto-style48"><strong>
                                                <asp:TextBox ID="txtnum" runat="server" ReadOnly="True" Width="61px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtnum" Display="None" ErrorMessage="기부받고 싶으신 책을 선택하세요." SetFocusOnError="True">기부받고 싶으신 책을 선택하세요.</asp:RequiredFieldValidator>
                                                </strong></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style67">책이름</td>
                                            <td class="auto-style48"><strong><span class="auto-style26"><span class="auto-style33"><span class="auto-style27"><span>
                                                <asp:TextBox ID="txtBookTitle1" runat="server" MaxLength="3" ReadOnly="True" Width="600px"></asp:TextBox>
                                                </span></span></span></span></strong></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style67">책 저자</td>
                                            <td class="auto-style48"><strong><span class="auto-style26"><span class="auto-style33"><span class="auto-style27"><span>
                                                <asp:TextBox ID="txtAuthor1" runat="server" ReadOnly="True" Width="600px"></asp:TextBox>
                                                </span></span></span></span></strong></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style67">책 출판사</td>
                                            <td class="auto-style48"><strong><span class="auto-style26"><span class="auto-style33"><span class="auto-style27"><span>
                                                <asp:TextBox ID="txtPublisher1" runat="server" ReadOnly="True" Width="600px"></asp:TextBox>
                                                </span></span></span></span></strong></td>
                                        </tr>
                                    </table> 
                                    <br />
                                    <div class="auto-style65">
                                        <br />
                                        <br />
                                        <div style="padding-left:10px;">
                                            <asp:Button ID="btnReset_ana" runat="server" CausesValidation="False" CssClass="button-style22" onclick="btnReset_ana_Click" Text="다시 선택하기" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="bnt_next1" runat="server" CssClass="button-style55" OnClick="bnt_next1_Click" Text="다음단계로" />
                                        </div>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <div class="auto-style9" style="padding-right: 50px;">
                                            <input id="Button1" class="button-style22" type="button" value="목록으로" onclick="button_event();" />
                                        </div>
                                    </div>
                                    &nbsp;<br />
                                    <br />
                                    <br />
                                    &nbsp;
                                <br />
                                <br />
                                <br />
                            </div>
                                <br />
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
                        </asp:Panel>







                        <br />
                        <asp:Panel ID="Panel_step2" runat="server" CssClass="auto-style50" Height="1096px" Visible="False">
                           
                            <h1 class="auto-style99">2단계&nbsp; -&nbsp; 신청자 정보 입력</h1>
                            <div class="auto-style78" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                                
                                <br />
                                <asp:Button ID="btnReset" runat="server" CausesValidation="False" CssClass="auto-style102" onclick="btnReset_Click" Text="입력한 값 모두 지우기" />
                                <br />
                               
                                <br />
                                <div class="auto-style104" style="border-style: groove; border-color: inherit; border-width: medium; background-color:white; ">
                                   <br />
                                    <br />
                                    <br />
                                    <br />
                                    <table class="auto-style76">
                                        <tr>
                                            <td class="auto-style111" colspan="2"><strong><span class="auto-style26"><span class="auto-style101">*&nbsp; 이메일과 전화번호는 비상연락망이므로 정확하게 입력해주세요.<br /> (문제가 발생할 시, 해당 연락처로 연락할 것입니다.)<br /> *&nbsp; 수집된 정보는 관련 업무에만 이용됩니다.<br />
                                                <br />
                                                *&nbsp; 모든 정보를 꼼꼼하게 입력해주세요.<br />
                                                <br />
                                                *&nbsp; 가급적 기증자 본인의 개인정보를 입력해주시기 바랍니다.</span></span></strong></td>
                                        </tr> 
                                    <tr>
                                        <td class="auto-style67">아이디</td>
                                        <td class="auto-style48">
                                        <asp:TextBox ID="txtID" runat="server" CssClass="auto-style101" ReadOnly="True" Width="312px"></asp:TextBox>
                                    </td>
                                    </tr> 
                                    <tr>
                                        <td class="auto-style67">받는 이 이름</td>
                                         <td class="auto-style48">
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style101" Width="300px"></asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserName" Display="None" ErrorMessage="이름을 입력하세요" SetFocusOnError="True">이름을 입력하세요</asp:RequiredFieldValidator>
                                        </td>
                                    </tr> 

                                    <tr>
                                        <td class="auto-style67">전화번호</td>
                                        <td class="auto-style48">
                                        <asp:TextBox ID="txtphone1" runat="server" CssClass="auto-style101" MaxLength="11" Width="300px"></asp:TextBox>
                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtphone1" Display="None" ErrorMessage="전화번호를 입력하세요" SetFocusOnError="True">전화번호를 입력하세요</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                     
                                     
                                    <tr>
                                        <td class="auto-style67">우편번호</td>
                                        <td class="auto-style48">
                                        <asp:TextBox ID="txtPostNum" runat="server" CssClass="auto-style101" Width="250px"></asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPostNum" Display="None" ErrorMessage="우편번호를 입력하세요" SetFocusOnError="True">우편번호를 입력하세요</asp:RequiredFieldValidator>
                                        </td>
                                    </tr> 


                                    <tr>
                                        <td class="auto-style67">주소</td>
                                        <td class="auto-style48">
                                        <asp:TextBox ID="txtAddress1" runat="server" CssClass="auto-style101" Width="300px"></asp:TextBox>
                                        <span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtAddress1" Display="None" ErrorMessage="주소를 입력하세요" SetFocusOnError="True">주소를 입력하세요</asp:RequiredFieldValidator>
                                        </span></td>
                                    </tr>
                                    
                                     
                                    <tr>
                                        <td class="auto-style67">나머지주소</td>
                                        <td class="auto-style48">
                                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="auto-style101" Width="300px"></asp:TextBox>
                                        <span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtAddress2" Display="None" ErrorMessage="나머지주소를 입력하세요" SetFocusOnError="True">나머지주소를 입력하세요</asp:RequiredFieldValidator>
                                        </span></td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <td class="auto-style67">이메일</td>
                                        <td class="auto-style48">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style101" Width="300px"></asp:TextBox>
                                        <span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="이메일을 입력하세요" SetFocusOnError="True">이메일을 입력하세요</asp:RequiredFieldValidator>
                                        </span></td>
                                    </tr>
                                   
                                    
                                    
                                    <tr>
                                        <td class="auto-style67">수령 방법</td>
                                        <td class="auto-style48">
                                        <asp:RadioButtonList ID="rdPostWay" runat="server" AutoPostBack="True" Height="27px" OnSelectedIndexChanged="rdPostWay_SelectedIndexChanged" RepeatDirection="Horizontal" Width="332px">
                                            <asp:ListItem>직접방문</asp:ListItem>
                                            <asp:ListItem>택배배송</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txtPostWay" runat="server" CssClass="auto-style101" ReadOnly="True" Width="306px"></asp:TextBox>
                                        <span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="rdPostWay" Display="None" ErrorMessage="기증방법을 선택하세요." SetFocusOnError="True">기증방법을 선택하세요.</asp:RequiredFieldValidator>
                                        </span></td>
                                    </tr> 
                                    
                                    <tr>
                                        <td class="auto-style112"><span class="auto-style101">기타<br /><br /> (하고 싶은 말 / 주의사항)<br />
                                            <br />
                                            </span><strong><span class="auto-style26"><span class="auto-style101">*&nbsp;&nbsp; 선택사항</span></span></strong></td>
                                        <td class="auto-style48">
                                            <asp:TextBox ID="txtWarningText" runat="server" CssClass="auto-style101" Height="138px" TextMode="MultiLine" Width="308px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    </table>
                                    
                                    <div class="auto-style8">
                                        <br />
                                        <br />
                                        <asp:Button ID="bnt_back2" runat="server" CausesValidation="False" CssClass="auto-style109" OnClick="bnt_back2_Click" Text="이전단계로" />
                                        &nbsp;
                                        <asp:Button ID="bnt_next2" runat="server" CssClass="auto-style109" OnClick="bnt_next2_Click" Text="다음단계로" />
                                        <br />
                                        <br />
                                        <input id="Button4" type="button" value="목록으로"  onclick="button_event();" class="button-style22" />
                                        <br />
                                        <br />
                                    </div>
                                    
                                </div>




                            </div>
                            <br />
                            &nbsp;<br />
                        </asp:Panel>
                    
                    


                        <br />
                        <asp:Panel ID="Panel_step3" runat="server" CssClass="auto-style50" Height="862px" Wrap="False" Visible="False">
                           
                            <h1 class="auto-style99">3단계&nbsp; -&nbsp; 안내사항 읽고 동의하기</h1>
                            
                            <br /> 
                            <div style="border-style: groove; padding:30px; border-color: inherit; border-width: medium; background-color:#E6E6E6; " class="auto-style113">
                                <strong>
                                <br />
                                <br />
                                기증처리 동의
                                <br  />
                                <br />
                                <br />
                                귀하께서 기증하시는 자료는 본래 원하는 회원이 가져가지만, 재고가 남을 경우 정보 소외지역 도서관으로 재기증됩니다.<br /> 또, 우리 회사에서의 보다 좋은 서비스를 위한 자료 디지타이징에 활용될 수 있음을 알려드립니다.<br />
                                다만, 자료의 오훼손 등으로 재기증이 어렵거나 디지타이징에 활용된 자료는 폐기될 수 있음을 양지하여 주시기 바랍니다.<br />
                                국립중앙도서관 기증 처리 절차에 동의 하시면, 기증 신청하여 주시기 바랍니다.</strong><br />
                                <br />
                                <br />
                                개인정보 수집 및 이용 동의<br />

                                         • 개인정보 수집 및 이용 목적<br />
                                      • 아나바다 자료 기증 신청 접수를 위해 수집하며 수집된 정보는 관련 업무에만 이용됩니다.<br />
                                <br />
                                <br />
                                수집하려는 개인정보 항목<br />
                                • (필수) 개인 및 기관명, 전화번호<br /> • (선택) 휴대폰 번호, 우편번호, 주소, 이메일
                                <br />
                                <br />
                                <br />
                                개인정보 보유 및 이용기간<br /> • 3년 
                                <br />
                                <br />
                                <br />
                                동의를 거부할 권리가 있으며 동의하지 않을 경우 자료 기증 및 재기증 신청이 되지 않습니다.
                                <br />
                                <asp:RadioButtonList ID="rdYesNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdYesNo_SelectedIndexChanged" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="yes">동의</asp:ListItem>
                                    <asp:ListItem Value="no">비동의</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Label ID="lbl_submit" runat="server" CssClass="auto-style100" Text="Label"></asp:Label>
                                
                                </div>



                                <br />
                                <div class="auto-style40">
                                        <br />
                                        <span class="auto-style100">주의사항<br />
                                        <br />
                                        * 신청자가 많은 도서를 선택했을 경우, 신청순으로 우선 지급됩니다.</span><br />
                                        <br />
                                        <br /> <strong>
                                        <asp:Button ID="bnt_back3" runat="server" CssClass="button-style55" Text="이전단계로" CausesValidation="False" OnClick="bnt_back3_Click" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnSave" runat="server" CssClass="button-style55" onclick="btnSave_Click" Text="제출하기" Visible="False" />
                                        <br />
                                        <br />
                                        <br />
                                        </strong>
                                        <input id="Button5" class="button-style22" type="button" value="목록으로" onclick="button_event();" />
                                        <br />
                                        &nbsp;<strong><asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="auto-style1" ShowMessageBox="True" ShowSummary="False" />
                                        </strong>
                                    </div>
                            <br />
                        </asp:Panel>
                        <br />
                        <br />

          
    
                            </div>
</asp:Content>

