<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Write.aspx.cs" Inherits="Basic_Write"  ValidateRequest="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style type="text/css">


        
        .auto-style45 {
            width: 1123px;
        }


        .auto-style46 {
            text-align: justify;
        }

        .auto-style51 {
            height: 833px;
            width: 1171px;
        }
        
         

        
        

        .auto-style54 {
            width: 959px;
            margin: 0px auto;
            height: 149px;
        }

        .auto-style55 {
            width: 1300px;
            height: 1099px;
        }

    .auto-style56 {
        background-color: #D6CEAA;
        text-align: center;
        color: #FFFFFF;
    }
    .auto-style57 {
        background-color: #FFFFFF;
        text-align: center;
        color: #FFFFFF;
    }
    .auto-style58 {
        background-color: #D6CEAA;
        text-align: center;
        width: 100px;
        color: #FFFFFF;
    }

    </style>

    
<script type="text/javascript">

    function button_event() {

        if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true) {    //확인

            location.replace('/Book_ReviewWrite/List.aspx');


        } else {   //취소

            return;
        }

    }


</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    
    
    
<div style="margin-left:550px;" class="auto-style55">

    
    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/독후감쓰기_메뉴.jpg" />
        <span class="auto-style27">
            <strong>
        <br />
            <span>


    
        <asp:Panel ID="Panel_view" runat="server" Height="914px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <span class="auto-style27"><strong><span>
                <br />
                <br />
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style56" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2">
                            <br />
                            *&nbsp; 글 내용을 작성해주세요!<br /> <br /> </td>
                    </tr>
                    <tr>
                        <td class="auto-style58" style="padding: 5px; border-bottom: groove; border-bottom-color: gainsboro; border-bottom-width: 2px;">글 제목</td>
                        <td class="auto-style46" style="padding: 5px; border-bottom: groove; border-bottom-color: gainsboro; border-bottom-width: 2px;" width="450">
                            <asp:TextBox ID="txtTitle" runat="server" Width="600px"></asp:TextBox>
                            <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTitle" Display="None" ErrorMessage="글 제목을 입력하세요!">[글 제목] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style58" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">책 제목</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:TextBox ID="txtBookName" runat="server" Width="600px"></asp:TextBox>
                            <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBookName" Display="None" ErrorMessage="책 제목을 입력하세요!">[책 제목] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style58" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">책 분야</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:DropDownList ID="ddlGenre" runat="server" Width="300px">
                                <asp:ListItem>역사</asp:ListItem>
                                <asp:ListItem>미술</asp:ListItem>
                                <asp:ListItem>정치외교</asp:ListItem>
                                <asp:ListItem>문화</asp:ListItem>
                                <asp:ListItem>과학/IT</asp:ListItem>
                                <asp:ListItem>기타</asp:ListItem>
                            </asp:DropDownList>
                            <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlGenre" Display="None" ErrorMessage="읽은 책의 분야를 골라주세요!">[분야/장르] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style58" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">책 저자</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:TextBox ID="txtAuthor" runat="server" Width="600px"></asp:TextBox>
                            <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAuthor" Display="None" ErrorMessage="책 저자를 입력하세요!">[책 저자] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style58" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">별점</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:DropDownList ID="ddlReviewStar" runat="server" Width="300px">
                                <asp:ListItem>★★★★★</asp:ListItem>
                                <asp:ListItem>★★★★☆</asp:ListItem>
                                <asp:ListItem>★★★☆☆</asp:ListItem>
                                <asp:ListItem>★☆☆☆☆</asp:ListItem>
                                <asp:ListItem>☆☆☆☆☆</asp:ListItem>
                            </asp:DropDownList>
                            <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlReviewStar" Display="None" ErrorMessage="별점을 매겨주세요!">[별점] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style57" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2"><span class="auto-style27"><strong><span>
                            <asp:TextBox ID="txtContent" runat="server" Columns="20" Height="200px" Rows="5" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            </span></strong></span></td>
                    </tr>
                </table>
                <div id="banner" class="auto-style54">
                    <asp:Button ID="btnWrite" runat="server" CssClass="button-style44" onclick="btnWrite_Click" Text="저장" />
                    &nbsp;&nbsp;&nbsp;&nbsp;<input id="Button1" type="button" value="목록으로"  onclick="button_event();" class="button-style44" /><br />
                    <br />
                    <br />
                    <span class="auto-style27"><strong><span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtContent" Display="None" ErrorMessage="내용을 입력하세요!">[내용] 필수입력</asp:RequiredFieldValidator>
                    </span></strong></span>
                    <br />
                    <span class="auto-style27"><strong><span>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </span></strong></span>
                </div>
                </span></strong></span>
                <br />
                &nbsp;
                <br />
            </div>
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;<br />
                <br />
        </asp:Panel>

            </span>
    </strong>
            </span>
        <br />

    </div>
        
          
    
    
    
    <br />
    </asp:Content>