<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Info.master" AutoEventWireup="true" CodeFile="MyPage_change.aspx.cs" Inherits="MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        
        .auto-style47 {
            font-size: 10pt;
        }

        .auto-style45 {
            width: 754px;
        }

        
        .auto-style53 {
            font-size: 20pt;
            color: #000000;
        }
        .auto-style52 {
            width: 1221px;
            margin: 0px auto;
            color: #808080;
            background-color: #ECECEC;
            text-align: center;
        }
        
        .auto-style49 {
            width: 115px;
            text-align: justify;
        }
        .auto-style50 {
            color: #99CCBB;
        }
        .auto-style54 {
            text-align: justify;
        }
        
        #banner0 {
            text-align: center;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div style="width:1300px;  margin-left:300px; margin-right:300px;  background-color:white; height: 1075px;">





    <asp:Image ID="Image3" runat="server" Height="300px" Width="1300px" ImageUrl="~/CSS_pic/회원끼리_상단배너.jpg" />
     



             
            <div id="banner" class="auto-style52"> 
                <strong><span class="auto-style53">회원정보 관리</span><br />
                <br />
                <br />
                회원님의 소중한 정보를 안전하게 관리하세요.<br />
                </strong></div>



                <strong>
            <div id="banner0"> 
                <br />
            <span class="auto-style27" __designer:mapid="210"><span __designer:mapid="211">
            <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;" __designer:mapid="213">
                <tr __designer:mapid="214">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="215" class="auto-style49">&nbsp;<span __designer:mapid="24f" class="auto-style50">*</span> 아이디</td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="216"><strong __designer:mapid="217">
                        <asp:Label ID="IDLabel" runat="server" Text="IDLabel"></asp:Label>
                        </strong></td>
                </tr>
                <tr __designer:mapid="219">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="21a" class="auto-style49">
            <span class="auto-style27" __designer:mapid="250"><span __designer:mapid="251"><strong __designer:mapid="252">
                        <span __designer:mapid="253" class="auto-style50">*</span>
            </strong></span></span>
                        비밀번호 수정</td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="21b">
                        <asp:TextBox ID="PWDtextbox" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PWDtextbox" Display="None" ErrorMessage="[비밀번호] 필수입력">[비밀번호] 필수입력</asp:RequiredFieldValidator>
                        <br __designer:mapid="21e" />
                    </td>
                </tr>
                <tr __designer:mapid="21f">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="220" class="auto-style49">
            <span class="auto-style27" __designer:mapid="254"><span __designer:mapid="255"><strong __designer:mapid="256">
                        <span __designer:mapid="257" class="auto-style50">*</span>
            </strong></span></span>
                        비밀번호 삽입</td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="221"><span class="auto-style47" __designer:mapid="222">
                        <asp:TextBox ID="txtPwd_check" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPwd_check" Display="None" ErrorMessage="[비밀번호 확인] 필수입력">[비밀번호 확인] 필수입력</asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="PWDtextbox" ControlToValidate="txtPwd_check" Display="None" ErrorMessage="비밀번호가 일치하지 않습니다.">비밀번호가 일치하지 않습니다.</asp:CompareValidator>
                        <br __designer:mapid="226" />
                        </span></td>
                </tr>
                <tr __designer:mapid="227">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="228" class="auto-style49">
            <span class="auto-style27" __designer:mapid="258"><span __designer:mapid="259"><strong __designer:mapid="25a">
                        <span __designer:mapid="25b" class="auto-style50">*</span>
            </strong></span></span>
                        성명</td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="229"><span class="auto-style47" __designer:mapid="22a">
                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToCompare="TextBox4" ControlToValidate="NameTextBox" Display="None" ErrorMessage="[이름] 필수입력">[이름] 필수입력</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="NameTextBox" Display="None" ErrorMessage="[성함] 한글로 2~10자 까지 입력해주세요." ValidationExpression="[가-횟]{2,10}">[성함] 한글로 2~10자 까지 입력해주세요.</asp:RegularExpressionValidator>
                        <br __designer:mapid="22e" />
                        </span></td>
                </tr>
                <tr __designer:mapid="22f">
                    <td style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" __designer:mapid="230" class="auto-style49">
            <span class="auto-style27" __designer:mapid="25c"><span __designer:mapid="25d"><strong __designer:mapid="25e">
                        <span __designer:mapid="25f" class="auto-style50">*</span>
            </strong></span></span>
                        휴대폰 번호(*)</td>
                    <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450" __designer:mapid="231"><span class="auto-style47" __designer:mapid="232">
                        <asp:TextBox ID="PhoneTextBox1" runat="server" Width="280px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToCompare="TextBox4" ControlToValidate="PhoneTextBox1" Display="None" ErrorMessage="전화번호를 입력하세요.">[전화번호] 필수입력</asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
                </span></span>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" style="text-align: center" />
                <br />
                <br />
                <asp:Button ID="Button7" runat="server" CssClass="button-style22" Height="55px" OnClick="Button7_Click" Text="저장" Width="139px" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="bnt_Cancel" runat="server" CausesValidation="False" CssClass="button-style22" Height="55px" OnClick="bnt_Cancel_Click" Text="취소" Width="139px" />
                <br />
                <br />
                <br />
                <br />
                </div>



            </strong>
        
     <br />
    </div>


        </asp:Content>

