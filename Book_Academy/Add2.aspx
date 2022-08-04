<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Add2.aspx.cs" Inherits="_Book_Academy_Add" %>

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
            width: 1112px;
        }

        .auto-style46 {
            text-align: justify;
        }

        .auto-style51 {
            height: 833px;
            width: 1193px;
        }
        

        
        

        .auto-style55 {
            width: 1096px;
            margin: 0px auto;
        }

        .auto-style56 {
            width: 1300px;
            height: 1404px;
        }

            



        .auto-style58 {
            background-color: #D6CEAA;
            text-align: center;
            color: #FFFFFF;
        }
        .auto-style59 {
            background-color: #FFFFFF;
            text-align: center;
            color: #FFFFFF;
        }

        .auto-style60 {
            font-size: small;
        }
        .auto-style61 {
            text-align: justify;
            font-size: small;
        }

        .auto-style62 {
            background-color: #D6CEAA;
            text-align: center;
            width: 101px;
            color: #FFFFFF;
        }

        </style>

    
    <script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인
    
        location.replace('/Book_Academy/List.aspx');


}else{   //취소

    return;

    }

} 

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="margin-left:550px; background-color:white; " class="auto-style56">
    




    <asp:Image ID="Image5" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/독후감쓰기_메뉴.jpg" />
    <br />
        <span class="auto-style27">
            <strong>
            <span>


    
        <asp:Panel ID="Panel_view" runat="server" Height="907px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <br />
                    <span>
                    <br />
                    <span class="auto-style27"><strong>
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td align="center" class="auto-style58" colspan="2" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">
                            <br />
                            *&nbsp; 논술 선생님 전용 페이지입니다.<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style62" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">답글을 달<br /> 질문글 번호</td>
                        <td class="auto-style61" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27"><strong><span>
                            <asp:Label ID="lbl_b_seq" runat="server" Text="lbl_b_seq"></asp:Label>
                            </span></strong></span></td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style62" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">작성자</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:TextBox ID="TextBoxName" runat="server" CssClass="txt" ReadOnly="True" style="font-size: small" Width="300px"></asp:TextBox>
                            <span class="auto-style60">&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxName" Display="None" ErrorMessage="[아이디] 필수입력">[아이디] 필수입력</asp:RequiredFieldValidator>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style62" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">제목</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <asp:TextBox ID="TextBoxSubject" runat="server" CssClass="txt" style="font-size: small" Width="600px"></asp:TextBox>
                            <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="제목을 입력하세요!" CssClass="auto-style60">[제목] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style62" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">분야/장르</td>
                        <td class="auto-style61" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span>
                            <asp:TextBox ID="TextBoxGenre" runat="server" CssClass="txt" ReadOnly="True" style="font-size: small" Width="300px"></asp:TextBox>
                            <span class="auto-style60">
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxGenre" Display="None" ErrorMessage="문의할 분야를 골라주세요!">[분야/장르] 필수입력</asp:RequiredFieldValidator>
                            </span>
                            </span></td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style59" colspan="2" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><span class="auto-style27"><strong><span>
                            <asp:TextBox ID="TextBoxContent" runat="server" CssClass="txt" Height="200px" style="font-size: small" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            </span></strong></span></td>
                    </tr>
                </table>
                </strong></span>
                    <br />
                    <div id="banner" class="auto-style55">
                        <asp:Button ID="Button2" runat="server" CssClass="button-style44" OnClick="Button2_Click" Text="글쓰기" />
                        &nbsp; &nbsp;
                        <span class="auto-style27"><strong><span>
                        <input id="Button33" onclick="button_event();" type="button" value="취소" class="button-style44" />
                        <br />
                        </span></strong></span>
                        <br />
                        <span class="auto-style27"><strong><span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력하세요!">[내용] 필수입력</asp:RequiredFieldValidator>
                        </span></strong></span>
                        <br />
                        <span class="auto-style27"><strong><span>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </span></strong></span>
                    </div>
                    <br />
                    </span>
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
        <br />
       <br />
        
    </div>
    <br />
    <br />
</asp:Content>

