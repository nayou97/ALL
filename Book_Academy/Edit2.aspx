<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Edit2.aspx.cs" Inherits="Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
                            




        .auto-style47 {
            font-size: 10pt;
        }

        .auto-style51 {
            height: 1062px;
            width: 1175px;
        }
        
         

        
        

        .auto-style45 {
            width: 1114px;
        }

        
        


        .auto-style44 {
            background-color: #D6CEAA;
            text-align: center;
            width: 82px;
            color: #FFFFFF;
        }
        
        .auto-style46 {
            text-align: justify;
        }

        



        .auto-style54 {
            width: 906px;
            margin: 0px auto;
            height: 92px;
        }
        .auto-style57 {
            background-color: #D6CEAA;
            text-align: center;
        }
        .auto-style58 {
            color: #FFFFFF;
        }
        .auto-style59 {
            width: 1300px;
            height: 1336px;
        }

        



        .auto-style60 {
            background-color: #FFFFFF;
            text-align: center;
            color: #FFFFFF;
        }

        



        </style>

    
    <script type="text/javascript">

        function button_event() {

            if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true) {    //확인

                location.replace('/Book_Academy/List.aspx');


            } else {   //취소

                return;

            }

        }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div style="margin-left:550px; background-color:white; " class="auto-style59">
    




    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/1대1논술교실_메뉴.jpg" />
             <br />
        <span class="auto-style27">
            <span>


    
        <asp:Panel ID="Panel_view" runat="server" Height="1163px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <br />
                <br />
                <br />
                <span class="auto-style27"><span><strong>
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style57" colspan="2" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><span class="auto-style27"><strong><span>
                            <br class="auto-style58" />
                            <span class="auto-style58">*&nbsp; 논술 선생님 전용 페이지입니다.<br />
                            <br />
                            </span></span></strong></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">글 번호</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27"><span><strong>
                            <asp:Label ID="lbl_b_seq" runat="server" Text="b_seq"></asp:Label>
                            </strong></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">제목</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27"><span><strong>
                            <asp:TextBox ID="TextBoxSubject" runat="server" CssClass="txt" Width="600px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="제목을 입력하세요.">[제목] 필수입력</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="이름을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </strong></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">분야/장르</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><span class="auto-style27"><span>
                            <asp:TextBox ID="TextBoxGenre_be" runat="server" CssClass="txt" ReadOnly="True" Width="300px"></asp:TextBox>
                            &nbsp;<strong><asp:Image ID="Image5" runat="server" Height="24px" ImageUrl="~/CSS_pic/truth-4432841_1280.png" Width="64px" />
                            </strong>
                            <br />
                            <br />
                            <asp:RadioButtonList ID="rd_genre" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rd_genre_SelectedIndexChanged" RepeatDirection="Horizontal" Width="95%">
                                <asp:ListItem>역사</asp:ListItem>
                                <asp:ListItem>미술</asp:ListItem>
                                <asp:ListItem>정치외교</asp:ListItem>
                                <asp:ListItem>문화</asp:ListItem>
                                <asp:ListItem>과학/IT</asp:ListItem>
                            </asp:RadioButtonList>
                            <strong>
                            <br />
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/CSS_pic/truth-4432841_1280.png" Height="24px" Width="64px" />
                            &nbsp;</strong><asp:TextBox ID="TextBoxGenre_af" runat="server" CssClass="txt" ReadOnly="True" Width="300px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxGenre_af" Display="None" ErrorMessage="문의할 장르를 골라주세요!">[분야/장르] 필수입력</asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxGenre_af" Display="None" ErrorMessage="제목을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style60" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" colspan="2"><span class="auto-style27"><span><strong><span class="auto-style47">
                            <asp:TextBox ID="TextBoxContent" runat="server" CssClass="txt" Height="200px" style="font-size: small" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            </span></strong></span></span></td>
                    </tr>
                </table>
                <div id="banner" class="auto-style54">
                    <asp:Button ID="Button2" runat="server" CssClass="button-style44" OnClick="Button2_Click" Text="수정" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="Button33" onclick="button_event();" type="button" value="취소" class="button-style44" />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    <br />
                    <span class="auto-style27"><span><strong><span class="auto-style47">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력하세요.">[내용] 필수입력</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </span></strong></span></span>
                </div>
                <br />
                <br />
                </strong></span></span>
            </div>
            <br />
                <br />
        </asp:Panel>

            </span>
            </span>
        <br />
        <br />
        <br />
        <br />
       <br />
        
    </div>
    <br />
    <br />

       </asp:Content>

