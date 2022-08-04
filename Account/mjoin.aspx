<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="mjoin.aspx.cs" Inherits="join" Debug="true"  %>
 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title></title>
    <link href="../../CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 

    <style type="text/css">
                 


        .auto-style34 {
            width: 111px;
            height: 21px;
            background-color: #B9E1E1;
            text-align: justify;
            font-size: 10pt;
            font-weight: bold;
            color: #FFFFFF;
        }
        
         
        .auto-style36 {
            font-size: x-large;
        }
        
        .auto-style37 {
            width: 111px;
            background-color: #B9E1E1;
            text-align: justify;
            height: 33px;
            font-size: 10pt;
            font-weight: bold;
            color: #FFFFFF;
        }
        .auto-style45 {
            width: 799px;
        }

        .auto-style46 {
            font-size: 10pt;
        }

        .auto-style47 {
            text-align: justify;
        }
        .auto-style48 {
            width: 1221px;
            text-align: center;
            margin: 0px auto;
            height: 523px;
        }

        
        
        

        .auto-style2 {
            background-color: #FEEB9E;
            text-align: center;
        }


        </style>
<script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인
        location.replace('/Account/LogIN/Home.aspx');
    } else {   //취소

        return;
    }

}

</script>    

</head>
<body style="height: 1838px">
    <form id="form1" runat="server" class="auto-style54">
  <div class="auto-style52">
                    <asp:Panel ID="Panel_logo" runat="server"  Height="100px" CssClass="auto-style2" Width="1900px"> 
                
                
                    <asp:ImageButton ID="bnt_logohome4" runat="server" BorderStyle="Groove" Height="92px" ImageUrl="~/CSS_pic/홈로고.png" OnClick="bnt_logohome2_Click" Width="571px" CausesValidation="False" />
                        <br />

                
            </asp:Panel>


                </div>



    <div style="width:1300px; margin-left:300px; margin-right:300px; background-color:white;">





    <asp:Image ID="Image2" runat="server" Height="300px" Width="1300px" ImageUrl="~/CSS_pic/회원끼리_상단배너.jpg" />
     




        <br />
        <div id="page" class="auto-style48">
        <span class="auto-style27">
        <span class="auto-style36">
            <br />
            <strong>Join_회원가입하기</strong><br />
            </span><strong>
            <br />
    </strong>
        </span>
            <div id="banner" class="container">  
        <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                           <tr>
                <td class="auto-style37"><strong>아이디</strong></td>
                <td class="auto-style47" >
                    <asp:TextBox ID="TextBoxID" runat="server" MaxLength="20" CssClass="auto-style46"></asp:TextBox>
                    <font size="2">&nbsp; *&nbsp; 20자까지&nbsp;</font><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="[아이디] 영문, 숫자 4~10자로 입력해주세요." ControlToValidate="TextBoxID" Display="None" CssClass="auto-style46">[아이디] 필수입력</asp:RequiredFieldValidator>
                    <font size="2">&nbsp; 
                    </font> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None" ErrorMessage="[아이디] 영문, 숫자 4~10자로 입력해주세요." ControlToValidate="TextBoxID" ValidationExpression="[0-9a-zA-Z]{4,10}" CssClass="auto-style46">[아이디] 영문, 숫자 4~10자로 입력해주세요.</asp:RegularExpressionValidator>
                    <br class="auto-style46" />
                </td>
            </tr>
            <tr>
                <td class="auto-style34"><strong>비밀번호</strong></td>
                <td class="auto-style47" >
                    <asp:TextBox ID="TextBoxPwd" runat="server" MaxLength="20" CssClass="auto-style46"></asp:TextBox>
                    <font size="2">&nbsp; *&nbsp; 20자까지&nbsp;
                </font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPwd" Display="None" ErrorMessage="[비밀번호]를 입력해주세요." CssClass="auto-style46">[비밀번호] 필수입력</asp:RequiredFieldValidator>
                    <font size="2">&nbsp;
                    </font>
                    <br class="auto-style46" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style34" ><strong>비밀번호 확인</strong></td>
                <td class="auto-style47"  >
                    <asp:TextBox ID="txtPwd_check" runat="server" CssClass="auto-style46"></asp:TextBox>
                    <font size="2">&nbsp;&nbsp;</font><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPwd_check" Display="None" ErrorMessage="[비밀번호 확인]을 입력해주세요." CssClass="auto-style46">[비밀번호 확인] 필수입력</asp:RequiredFieldValidator>
                &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBoxPwd" ControlToValidate="txtPwd_check" Display="None" ErrorMessage="비밀번호가 일치하지 않습니다." CssClass="auto-style46">비밀번호가 일치하지 않습니다.</asp:CompareValidator>
                    <br class="auto-style46" />
                    </td>
            </tr>
            <tr >
                <td class="auto-style34" ><strong >성함</strong></td>
                <td class="auto-style47" >
                    <asp:TextBox ID="TextBoxName" runat="server" MaxLength="20" CssClass="auto-style46"></asp:TextBox>
                    <font size="2">&nbsp; *&nbsp; 20자까지&nbsp;</font><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToCompare="TextBox4" Display="None" ErrorMessage="[이름]을 입력해주세요." ControlToValidate="TextBoxName" CssClass="auto-style46">[이름] 필수입력</asp:RequiredFieldValidator>
                    <font size="2">&nbsp;
                    </font>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="None" ErrorMessage="[성함] 한글로 2~10자 까지 입력해주세요." ControlToValidate="TextBoxName" ValidationExpression="[가-횟]{2,10}" CssClass="auto-style46">[성함] 한글로 2~10자 까지 입력해주세요.</asp:RegularExpressionValidator>
                    <br class="auto-style46" />
                    </td>
            </tr>
            <tr >
                <td class="auto-style34"><strong >전화번호</strong></td>
                <td class="auto-style47" >
                    <asp:TextBox ID="TextBoxPhone1" runat="server" MaxLength="11" Width="227px" TextMode="Phone" CssClass="auto-style46" ></asp:TextBox>
                    <font size="2">&nbsp; *&nbsp; &#39;-&#39;없이 그대로. (11자 제한)
                </font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToCompare="TextBox4" Display="None" ErrorMessage="[전화번호]를 입력해주세요." ControlToValidate="TextBoxPhone1" CssClass="auto-style46">[전화번호] 필수입력</asp:RequiredFieldValidator>
                    <br class="auto-style46" />
                    </td>
            </tr>
            </table>
                <br /> 
                <br />
                <asp:Button ID="btnID" runat="server" Text="유효성 확인" CssClass="button-style33" OnClick="btnID_Click" />
                    <br />
                <br />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
                <asp:Button ID="Button1GoJoin" runat="server" CssClass="button-style33" Text="가입하기" OnClick="GoJoin_Click" />
            &nbsp;&nbsp; 
        <span class="auto-style27">
            <span>
            <input id="Button33" onclick="button_event();" type="button" value="돌아가기" class="button-style33" /></span></span><br />
            <br />
        <asp:Label ID="Label2" runat="server" Style="font-weight:700; color: #CC0066" Text="Label" Visible="False"></asp:Label>
        
        
            <br />
        
        
    </div>

    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" style="text-align: center" />
        <span class="auto-style27">
        <br class="auto-style36" />
        </span>
        <br />
        <br />
        <br />

        <br />
        <br />
        </div>
    </form>
    <br />
     

    </body>
</html>
         

