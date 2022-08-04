<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_AnaBada.master" AutoEventWireup="true" CodeFile="FreeStore_ANA.aspx.cs" Inherits="Book_etc_FreeStore_ANA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
                    



        .auto-style37 {
        text-align: justify;
        width: 1268px;
            height: 841px;
        }
        .auto-style39 {
            height: 61px;
            background-color: #FAEBD7;
        }
                     




        .auto-style47 {
            text-align: justify;
        }
        .auto-style48 {
            width: 311px;
            text-align: justify;
            border-bottom: 2px solid lightsteelblue;
            background-color: #FFFFFF;
            padding-left:10px;
        }
        .auto-style49 {
            width: 784px;
            height: 175px;
            border-top-color:orangered;
            border-top-width:2px;
            border-top-style: double;
            border-top-color: inherit;
            margin-left:100px;
        }
        .auto-style51 {
            width: 1146px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
        }
        .auto-style52 {
            width: 1126px;
            height: 638px;
        }

        .auto-style54 {
            color: #FF3300;
        }
        .auto-style56 {
            text-align: center;
            height: 3416px;
            width: 1300px;
        } 
        .auto-style59 {
            height: 23px;
        }



        
        .auto-style62 {
            background-color: #FFFFFF;
            width: 1120px;
            height: 569px;
            align-content:center;
        }
        .auto-style65 {
            width: 936px;
            height: 597px;
            margin-left:100px;
        }




        .auto-style67 {
            width: 105px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            text-align: justify;
            padding:10px;
        }




        .auto-style68 {
            text-align: left;
            padding-left:20px;
            border-bottom:2px solid gainsboro;
            font-size: xx-large;
        }




        .auto-style72 {
            width: 1300px;
            height: 3437px;
        }




        .auto-style73 {
            text-align: justify;
            height: 1358px;
            background-color: #FFFFFF;
        }
        .auto-style74 {
            background-color: #FFFFFF;
            margin-right: 0px;
        }




        .auto-style75 {
            width: 950px;
            height: 962px;
            margin-left: 100px;
            text-align: right;
        }
        .auto-style76 {
            width: 837px;
            height: 175px;
            border-top-color: orangered;
            border-top-width: 2px;
            border-top-style: double;
            border-top-color: inherit;
            margin-left: 100px;
        }
        .auto-style77 {
            width: 1170px;
            height: 1142px;
        }
        .auto-style78 {
            width: 1177px;
            background-color: #ECECEC;
            border-bottom: 2px solid lightsteelblue;
            background-color: #E6E6E6;
            height: 1225px;
        }
        .auto-style79 {
            background-color: #FFFFFF;
            width: 1173px;
            height: 1114px;
            align-content: center;
        }




        .auto-style80 {
        width: 950px;
        height: 437px;
        margin-left: 100px;
    }
    .auto-style81 {
        width: 1170px;
        height: 498px;
    }
    .auto-style82 {
        background-color: #FFFFFF;
        width: 1173px;
        height: 411px;
        align-content: center;
    }
    .auto-style83 {
        width: 1177px;
        background-color: #ECECEC;
        border-bottom: 2px solid lightsteelblue;
        background-color: #E6E6E6;
        height: 649px;
    }




        .auto-style84 {
            text-align: right;
            height: 49px;
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
     

 
<!-- <input type="button" value="삭제하기" onclick="button_event();">    -->

     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="id" style="margin-left:550px; " class="auto-style72">



        <div id="page" class="auto-style56">


    <asp:Image ID="Image2" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/아나바다_ana.jpg" />
    

            <br />

        
                <asp:Panel ID="Panel_step1" runat="server" Height="899px" Width="1300px">
                    <div style="align-content:center; padding:20px;" class="auto-style37">
                        <h1 class="auto-style68">1단계&nbsp; -&nbsp; <strong>기증자 정보 입력하기</strong></h1> 
                        <strong><span class="auto-style27"><span>
                        <asp:Panel ID="Panel_view" runat="server" Height="771px" Width="1256px">
                            <br />
                            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                                <br />
                                <br />
                                <div id="page" class="auto-style52">
                                    <span class="auto-style27"><strong><span>
                                    <div id="banner" class="auto-style62">
                                        <strong><span class="auto-style27"><span>
                                        <div class="auto-style65">
                                            <br />
                                            <br />
                                            <table class="auto-style49">
                                                <tr>
                                                    <td class="auto-style67">아이디</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtID" runat="server" ReadOnly="True" Width="309px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style67">개인 및 기관명</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtUserName" runat="server" Width="308px"></asp:TextBox>
                                                        <strong><span class="auto-style27"><span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="None" ErrorMessage="이름을 입력하세요" SetFocusOnError="True">이름을 입력하세요</asp:RequiredFieldValidator>
                                                        </span></span></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style67">전화번호</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtphone1" runat="server" MaxLength="11" Width="306px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtphone1" Display="None" ErrorMessage="전화번호를 입력하세요" SetFocusOnError="True">전화번호를 입력하세요</asp:RequiredFieldValidator>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style67">우편번호</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtPostNum" runat="server" Width="305px"></asp:TextBox>
                                                        
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPostNum" Display="None" ErrorMessage="우편번호를 입력하세요" SetFocusOnError="True">우편번호를 입력하세요</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style67">주소</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtAddress1" runat="server" Width="303px"></asp:TextBox>
                                                        
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress1" Display="None" ErrorMessage="주소를 입력하세요" SetFocusOnError="True">주소를 입력하세요</asp:RequiredFieldValidator>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style67">나머지주소</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtAddress2" runat="server" Width="303px"></asp:TextBox>
                                                        
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress2" Display="None" ErrorMessage="나머지주소를 입력하세요" SetFocusOnError="True">나머지주소를 입력하세요</asp:RequiredFieldValidator>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style67">이메일</td>
                                                    <td class="auto-style48">
                                                        <asp:TextBox ID="txtEmail" runat="server" Width="305px"></asp:TextBox>
                                                        
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="이메일을 입력하세요" SetFocusOnError="True">이메일을 입력하세요</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:Button ID="btn_step1" runat="server" CssClass="button-style" onclick="btn_step1_Click" style="margin-top: 0px" Text="다음단계로" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input id="Button33" onclick="button_event();" type="button" value="돌아가기" class="button-style22" />
                                            <br />
                                            <br />
                                            <br />
                                            <asp:Panel ID="Panel8" runat="server" BackColor="Gainsboro" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="143px">
                                                <strong><span class="auto-style27"><span>
                                                <br />
                                                *&nbsp; </span></span></strong>이메일과 전화번호는 비상연락망이므로 정확하게 입력해주세요.<br /> (문제가 발생할 시, 해당 연락처로 연락할 것입니다.)<br />
                                                <br />
                                                <strong><strong><span class="auto-style27"><span class="auto-style27"><span>*&nbsp; </span></span></span></strong></strong>모든 정보를 꼼꼼하게 입력해주세요.<br />
                                                <br />
                                                <strong><span class="auto-style27"><span>*&nbsp; 가급적 기증자 본인의 개인정보를 입력해주시기 바랍니다.<br /> </span></span></strong>
                                            </asp:Panel>
                                            <strong><span class="auto-style27"><span>
                                            <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                            </span></span></strong>
                                            <br />
                                        </div>
                                        </span></span></strong>&nbsp;&nbsp;&nbsp;
                                        <br />
                                        <br />
                                        &nbsp;<br />
                                        <br />
                                        <br />
                                    </div>
                                    </span></strong></span>
                                </div>
                                <br />
                                <br />
                            </div>
                        </asp:Panel>
                        </span></span></strong>
                        <br />
                        <br />
                        <br />
                        <strong>
                        <br />
                        <span class="auto-style27"><span>
                        <br />
                        </span></span>
                        </strong> 
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:Panel>

        
                <br /> 
                <asp:Panel ID="Panel_step2" runat="server"  Height="1368px" Visible="False" Width="1308px">
                    <div  class="auto-style73">
                        <h1 class="auto-style68">2단계&nbsp; -&nbsp; <strong>도서 수량/정보 &amp; 기증방법</strong></h1>
                        <strong><span class="auto-style27"><span>
                            <asp:Panel ID="Panel_view2" runat="server" Height="1318px" Width="1256px">
                                <br />
                                <strong><span class="auto-style27"><span>
                                <div class="auto-style78" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                                    <br />
                                    <br />
                                    <div id="page" class="auto-style77">
                                        <div id="banner" class="auto-style79">
                                            <div class="auto-style75">
                                                <br />
                                                <strong><span class="auto-style27"><span>
                                                <br />
                                                <asp:Button ID="btnReset2" runat="server" CausesValidation="False" CssClass="button-style" onclick="btnReset2_Click" style="margin-top: 0px" Text="입력사항 초기화하기" />
                                                <br />
                                                <br />
                                                </span></span></strong>
                                                <br />
                                                <table class="auto-style76">
                                                    <tr>
                                                        <td class="auto-style67"><strong><span class="auto-style27"><span>기부할<br /> 도서 목록</span></span></strong></td>
                                                        <td class="auto-style48"><strong><span class="auto-style27"><span>
                                                            <fieldset style="width: 550px">
                                                                <legend>기증할 책 목록 (한 번 신청글을 작성할 시, 최대 5권의 책을 등록하실 수 있습니다.</legend>
                                                                <br />
                                                                *&nbsp; 최대 3권 가능<br />
                                                                <asp:Panel ID="Panel_bookinfo1" runat="server" Height="115px">
                                                                    <table style="width:100%">
                                                                        <tr>
                                                                            <td width="25%">BookName</td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtBookName1" runat="server"></asp:TextBox>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtPostNum" Display="None" ErrorMessage="도서제목을 영어, 한글로 입력하세요." ValidationExpression="[0-9A-za-z가-힣]{1,100}">도서제목을 영어, 한글로 입력하세요.</asp:RegularExpressionValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Author</td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtAuthor1" runat="server"></asp:TextBox>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtPostNum" Display="None" ErrorMessage="도서저자를 영어, 한글로 입력하세요." ValidationExpression="[0-9A-za-z가-힣]{1,100}">도서저자를 영어, 한글로 입력하세요.</asp:RegularExpressionValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style59">Publisher</td>
                                                                            <td class="auto-style59">
                                                                                <asp:TextBox ID="txtPublisher1" runat="server"></asp:TextBox>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtPostNum" Display="None" ErrorMessage="도서출판사를 한글,영어로 입력하세요." ValidationExpression="[0-9A-za-z가-힣]{1,100}">도서출판사를 한글,영어로 입력하세요.</asp:RegularExpressionValidator>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <br />
                                                            </fieldset></span></span></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style67"><strong><span class="auto-style27"><span>기증 방법</span></span></strong></td>
                                                        <td class="auto-style48"><strong><span class="auto-style27"><span>
                                                            <asp:RadioButtonList ID="rdPostWay" runat="server" AutoPostBack="True" Height="27px" OnSelectedIndexChanged="rdPostWay_SelectedIndexChanged" RepeatDirection="Horizontal" Width="332px">
                                                                <asp:ListItem>직접방문</asp:ListItem>
                                                                <asp:ListItem>택배배송(착불)</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:TextBox ID="txtPostWay" runat="server" ReadOnly="True" Width="306px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rdPostWay" Display="None" ErrorMessage="기증방법을 선택하세요." SetFocusOnError="True">기증방법을 선택하세요.</asp:RequiredFieldValidator>
                                                            </span></span></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style67"><strong><span class="auto-style27"><span>기타<br />
                                                            <br />
                                                            (하고 싶은 말 / 주의사항)<br /> *&nbsp;&nbsp; 선택사항</span></span></strong></td>
                                                        <td class="auto-style48"><strong><span class="auto-style27"><span>
                                                            <asp:TextBox ID="txtWarningText" runat="server" Height="138px" TextMode="MultiLine" Width="545px"></asp:TextBox>
                                                            <asp:ValidationSummary ID="ValidationSummary5" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                                            &nbsp;</span></span></strong></td>
                                                    </tr>
                                                </table>
                                                <div id="banner" class="auto-style84">
                                                    <asp:Button ID="btn_backstep2" runat="server" CausesValidation="False" CssClass="button-style55" onclick="btn_backstep2_Click" style="margin-top: 0px" Text="이전단계로" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btn_step2" runat="server" CssClass="button-style55" onclick="btn_step2_Click" Text="다음단계로" />
                                                    <br />
                                                    
                                                </div>
                                                <strong><span class="auto-style27"><span>
                                                <div class="auto-style47">
                                                    <asp:Panel ID="Panel9" runat="server" BackColor="Gainsboro" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="186px" style="text-align: center">
                                                        <strong><span class="auto-style27"><span>
                                                        <br />
                                                        <div id="banner1" class="auto-style53">
                                                            <span class="auto-style54">*&nbsp; 수집된 정보는 관련 업무에만 이용됩니다.</span></div>
                                                        <br />
                                                        *&nbsp; </span></span></strong>이메일과 전화번호는 비상연락망이므로 정확하게 입력해주세요.<br /> (문제가 발생할 시, 해당 연락처로 연락할 것입니다.)<br />
                                                        <br />
                                                        <strong><strong><span class="auto-style27"><span class="auto-style27"><span>*&nbsp; </span></span></span></strong></strong>모든 정보를 꼼꼼하게 입력해주세요.<br />
                                                        <br />
                                                        <strong><span class="auto-style27"><span>*&nbsp; 가급적 기증자 본인의 개인정보를 입력해주시기 바랍니다.<br />
                                                        <br />
                                                        &nbsp;</span></span></strong></asp:Panel>
                                                </div>
                                                </span></span></strong>
                                                <br />
                                                <strong><span class="auto-style27"><span>
                                                    <div id="banner2" class="auto-style84">
                                                        &nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="auto-style27"><span>
                                                        <input id="Button34" onclick="button_event();" type="button" value="돌아가기" class="button-style44" />
                                                        </span></span></strong>
                                                </div>
                                                    </span></span></strong>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;
                                            <br />
                                            <br />
                                            &nbsp;<br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                </div>
                                </span></span></strong>
                                <br />
                        </asp:Panel>
                            <br /><br />
                            <br />
                            <br />
                            <br />
                        </span></span></strong>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </asp:Panel> 
                <br />
                <br />


                <asp:Panel ID="Panel_step3" runat="server" CssClass="auto-style74" Height="754px" Visible="False" Width="1305px">
                    <br />
                    <h1 class="auto-style68">3단계&nbsp; -&nbsp; <strong>도서 수량/정보 &amp; 기증방법</strong></h1>
                        
                        <asp:Panel ID="Panel1" runat="server" Height="771px" Width="1292px">
                    <div class="auto-style83" style="margin: 20px; border-style: solid; border-width: 1px; padding: 10px; padding-left: 30px; padding-right: 30px; margin-right: 20px;">
                        <br />
                        <div id="page" class="auto-style81">
                            <div id="banner" class="auto-style82">
                                <div class="auto-style80">
                                    <span class="auto-style54">
                                    <br />
                                    <strong><span class="auto-style27"><span>
                                    <div class="auto-style47">
                                        <asp:Panel ID="Panel10" runat="server" BackColor="Gainsboro" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="auto-style4" Height="270px">
                                            <strong>
                                            <br />
                                            &nbsp; * 수집하려는 개인정보 항목<br />
                                            <br />
                                            &nbsp; • (필수) 개인 및 기관명, 전화번호<br /> &nbsp; • (선택) 휴대폰 번호, 우편번호, 주소, 이메일<br />
                                            <br />
                                            <br />
                                             &nbsp;&nbsp;개인정보 보유 및 이용기간&nbsp; =&gt;&nbsp; 3년 <br />
                                            <br />
                                            &nbsp; 동의를 거부할 권리가 있으며 동의하지 않을 경우 도서 기증 및 재기증 신청이 되지 않습니다.<br /> <br /> 
                                            <asp:RadioButtonList ID="rdYesNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdYesNo_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                <asp:ListItem Selected="True" Value="yes">동의</asp:ListItem>
                                                <asp:ListItem Value="no">동의하지않습니다.</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                                </strong>
                                        </asp:Panel>
                                    </div>
                                    <br />
                                    <br />
                                    <asp:Label ID="lbl_submit" runat="server" CssClass="auto-style54" Text="lbl_submit"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Button ID="btn_backstep3" runat="server" CausesValidation="False" CssClass="button-style22" onclick="btn_backstep3_Click" style="margin-top: 0px" Text="이전단계로" />
                                    <asp:Button ID="btnSave" runat="server" CssClass="button-style22" onclick="btnSave_Click" Text="신청서 제출하기" Visible="False" />
                                    <input id="Button35" onclick="button_event();" type="button" value="돌아가기" class="button-style22" />
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                    </span></span></strong>
                                    </span>
                                </div>
                                <br />
                                <br />
                                <br />
                                <br />
                                
                                &nbsp;
                                    </div>
                        </asp:Panel>
                </asp:Panel>
                        </div>
                    </div>
                    <br />
                <br /> 
             <br /> 
         
     
        
    </asp:Content>

