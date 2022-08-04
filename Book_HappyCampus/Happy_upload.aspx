<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Happy_upload.aspx.cs" Inherits="Book_HappyCampus_Happy_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">



            
        .auto-style45 {
            width: 799px;
        }

        .auto-style46 {
            text-align: justify;
        }

        

            
        .auto-style51 {
            height: 865px;
            width: 1168px;
        }
        
         

        
        

        .auto-style53 {
            width: 1100px;
        }
        
        

            
        .auto-style54 {
            background-color: #D6CEAA;
            text-align: center;
            color: #FFFFFF;
        }
        .auto-style55 {
            background-color: #D6CEAA;
            text-align: center;
            width: 100px;
            color: #FFFFFF;
        }
        .auto-style56 {
            width: 1300px;
            height: 1254px;
        }
        .auto-style57 {
            width: 1088px;
            margin: 0px auto;
        }
        .auto-style58 {
            background-color: #FFFFFF;
            text-align: center;
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

    <div style="margin-left:550px; background-color:white; " class="auto-style56">
    




    <asp:Image ID="Image3" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/자료나눔_메뉴.jpg" CssClass="txt" />
        <br />
        <asp:Panel ID="Panel_view" runat="server" Height="959px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px">
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <br />
                <br />
                <table align="center" class="auto-style53" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2"><span class="auto-style27"><span><strong>
                            <br />
                            *&nbsp; 글을 작성해주세요!<br />
                            <br />
                            </strong></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style55" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><strong>제목</strong></td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:TextBox ID="TextBoxSubject" runat="server" CssClass="txt" Width="600px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="제목을 입력해주세요.">제목을 입력해주세요.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style58" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2">
                            <asp:TextBox ID="TextBoxContent" runat="server" CssClass="txt" Height="200px" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style55"><span><strong>첨부파일</strong></span></td>
                        <td style="text-align: justify" width="450"><span><span class="auto-style45"><span class="auto-style27">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="600px" />
                            </span></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style55"><strong>글 비밀번호</strong></td>
                        <td style="text-align: justify" width="450">
                            <asp:TextBox ID="TextBoxPwd" runat="server" CssClass="txt" TextMode="Password" Width="600px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBoxPwd" Display="None" ErrorMessage="글 비밀번호를 입력하세요!">글 비밀번호를 입력하세요!</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <div id="banner" class="auto-style57">
                    <asp:Button ID="btn_write" runat="server" CssClass="button-style44" OnClick="btn_write_Click" Text="글쓰기" />
                    &nbsp;&nbsp;&nbsp;&nbsp; 
                    <input id="Button1" type="button" value="목록으로" OnClick="button_event();" class="button-style44" />
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력해주세요.">내용을 입력해주세요.</asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <div style="text-align:center;margin:10px;">
                        &nbsp;&nbsp; &nbsp;
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>
            </div>
            <br />
        </asp:Panel>

    <br />
     
        
    </div>

    <br />
    
</asp:Content>

