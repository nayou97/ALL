<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Happy_Edit.aspx.cs" Inherits="Book_HappyCampus_Happy_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        
                
        .auto-style29 {
            margin-bottom: 0px;
        }
         
        .auto-style51 {
            height: 792px;
            width: 1171px;
        }
        
         

        
        

        .auto-style45 {
            font-size: medium;
            
            width: 1100px;
        }
        .auto-style53 {
            width: 930px;
            margin: 0px auto;
            height: 100px;
        }


        

        .auto-style47 {
            font-size: 10pt;
        }

        .auto-style46 {
            text-align: justify;
            font-size: 10pt;
        }

        

            
        .auto-style54 {
            background-color: #D6CEAA;
            text-align: center;
            font-size: 10pt;
            color: #FFFFFF;
        }
        .auto-style55 {
            background-color: #D6CEAA;
            text-align: center;
            width: 101px;
            font-size: 10pt;
            color: #FFFFFF;
        }
        .auto-style56 {
            width: 1300px;
            height: 1153px;
        }
        .auto-style57 {
            background-color: #FFFFFF;
            text-align: center;
            font-size: 10pt;
            color: #FFFFFF;
        }

        

            
        </style>

    
    
<script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인
    
        location.replace('/Book_HappyCampus/HappyCampus.aspx');


}else{   //취소

        return;
    }

}


</script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="margin-left:550px; background-color:white; " class="auto-style56" >
    




    <asp:Image ID="Image3" runat="server" Height="132px" Width="1298px" ImageUrl="~/CSS_pic/자료나눔_메뉴.jpg" CssClass="auto-style29" />
    




        <br />
        <asp:Panel ID="Panel_view" runat="server" Height="884px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <br />
                <span><span class="auto-style27">
                <br />
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2"><strong><span class="auto-style27"><span>
                            <br />
                            *&nbsp; 입력하신 내용에 맞춰 글이 수정됩니다.<br />
                            <br />
                            </span></span></strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style55" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><span><strong>글번호</strong></span></td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span>
                            <asp:Label ID="lblNum" runat="server" Text="lblNum"></asp:Label>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style55" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><strong>제목</strong></td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="txt" style="font-size: 10pt" Width="600px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtSubject" CssClass="auto-style47" Display="None" ErrorMessage="제목을 입력해주세요.">제목을 입력해주세요.</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style57" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2"><span><span class="auto-style27"><span class="auto-style47">
                            <asp:TextBox ID="txtContent" runat="server" CssClass="txt" Height="200px" style="font-size: 10pt" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            </span></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style55"><span><strong>첨부파일</strong></span></td>
                        <td class="auto-style47" style="text-align: justify" width="450"><span><span class="auto-style27"><span class="auto-style47">
                            <asp:TextBox ID="txtFileName" runat="server" ReadOnly="True" Width="600px"></asp:TextBox>
                            <br />
                            </span><span class="auto-style45">
                            <asp:TextBox ID="txtFilePath" runat="server" CssClass="auto-style47" ReadOnly="True" Width="600px"></asp:TextBox>
                            <br />
                            <br />
                            <strong>
                            <asp:Image ID="Image5" runat="server" Height="24px" ImageUrl="~/CSS_pic/truth-4432841_1280.png" Width="64px" />
                            </strong>
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style47" Width="600px" />
                            </span></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style55"><strong>글 비밀번호</strong></td>
                        <td class="auto-style47" style="text-align: justify" width="450"><span>
                            <asp:TextBox ID="txtPwd" runat="server" CssClass="txt" style="font-size: 10pt" TextMode="Password" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtPwd" CssClass="auto-style47" Display="None" ErrorMessage="암호를 입력하세요" SetFocusOnError="True">암호를 입력하세요</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                </table>
                </span>
                <div id="banner" class="auto-style53">
                    <asp:Button ID="bnt_modify" runat="server" CssClass="button-style44" OnClick="bnt_modify_Click" style="height: 39px" Text="수정" />
                    &nbsp;&nbsp;&nbsp;
                    <input id="Button1" type="button" value="목록으로" OnClick="button_event();" class="button-style44" />
                    <br />
                    <br />
                    <span><span class="auto-style27"><span class="auto-style47">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtContent" Display="None" ErrorMessage="내용을 입력하세요" SetFocusOnError="True">내용을 입력하세요</asp:RequiredFieldValidator>
                    </span></span></span>
                    <br />
                    &nbsp;<div style="text-align:center;margin:10px;">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>
                </span>
                <br />
            </div>
            <br />
                <br />
        </asp:Panel>

    <br />
     
        
    </div>

    <br />

    </asp:Content>

