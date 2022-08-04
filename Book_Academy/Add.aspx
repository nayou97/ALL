<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="_Book_Academy_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        /*

.auto-style20 {
            text-align: left;
        }
        .auto-style21 {
            text-align: right;
        }
        .auto-style22 {
            background-color: #CCCCCC;
        }
        .auto-style23 {
            width: 800px;
            height: 341px;
            background-color:white;
            border-style:groove;
        }
        */
        

        


        .auto-style45 {
            width: 1146px;
        }

        .auto-style46 {
            text-align: justify;
        }

        .auto-style47 {
            font-size: 10pt;
        }

        .auto-style51 {
            height: 697px;
            width: 1193px;
        }
        
         

        
        

        .auto-style53 {
            width: 1073px;
            margin: 0px auto;
            height: 73px;
        }

        .auto-style54 {
            background-color: #D6CEAA;
            text-align: center;
            color: #FFFFFF;
        }
        .auto-style55 {
            background-color: #FFFFFF;
            text-align: center;
            color: #FFFFFF;
        }
        .auto-style56 {
            width: 1300px;
            height: 1029px;
        }

        .auto-style57 {
            background-color: #D6CEAA;
            text-align: center;
            width: 100px;
            color: #FFFFFF;
        }

    </style>

    
<script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인
        location.replace('/Book_Academy/List.aspx');
    } else {   //취소

        return;
    }

}

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="margin-left:550px; background-color:white; " class="auto-style56">
    




    <asp:Image ID="Image2" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/1대1논술교실_메뉴.jpg" />
    




        <br />
        <span class="auto-style27">
            <span>


    
        <asp:Panel ID="Panel_view" runat="server" Height="779px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><span class="auto-style27"><span>
            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                <strong>
                <br />
                <span class="auto-style27"><span>
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style54" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2">
                            <br />
                            *&nbsp; 글을 작성해주세요!<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style57" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">제목</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:TextBox ID="TextBoxSubject" runat="server" CssClass="txt" style="font-size: 10pt" Width="600px"></asp:TextBox>
                            <span class="auto-style47">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="제목을 입력하세요!">[제목] 필수입력</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="이름을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style57" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">분야/장르</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:RadioButtonList ID="rd_genre" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rd_genre_SelectedIndexChanged" RepeatDirection="Horizontal" Width="424px">
                                <asp:ListItem>역사</asp:ListItem>
                                <asp:ListItem>미술</asp:ListItem>
                                <asp:ListItem>정치외교</asp:ListItem>
                                <asp:ListItem>문화</asp:ListItem>
                                <asp:ListItem>과학/IT</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                            <span>
                            <asp:TextBox ID="TextBoxGenre" runat="server" CssClass="txt" ReadOnly="True" style="font-size: 10pt" Width="600px"></asp:TextBox>
                            <span class="auto-style47">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxGenre" Display="None" ErrorMessage="문의할 분야를 골라주세요!">[분야/장르] 필수입력</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxGenre" Display="None" ErrorMessage="제목을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style55" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2"><span class="auto-style27"><span><strong><asp:TextBox ID="TextBoxContent" runat="server" CssClass="txt" Height="200px" MaxLength="500" style="font-size: 10pt" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            <span class="auto-style47">
                            <br />
                            * 500자 이내<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력하세요!">[내용] 필수입력</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span></strong></span></span></td>
                    </tr>
                </table>
                </span></span>
                <br />
                </strong>
                <div id="banner" class="auto-style53">
                    <asp:Button ID="Button2" runat="server" CssClass="button-style44" OnClick="Button2_Click" Text="글쓰기" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="Button33" onclick="button_event();" type="button" value="취소" class="button-style44" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                </div>
                <br />
            </div>
            </span></span><br />
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;<br />
                <br />
        </asp:Panel>


    
        <br />
        <br />

            </span>
            </span>
       <br />
        
    </div>
    <br />
</asp:Content>

