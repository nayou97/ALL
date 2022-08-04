<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="Basic_Modify" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style type="text/css">

        
        
        .auto-style20 {
            float: none;
            text-align: justify;
            width: 1266px;
            height: 21px;
            border-color: inherit;
            border-width: medium;
            background-color: #FFFFFF;
        }
        

        .auto-style35 {
            width: 725px;
            height: 21px;
            background-color: white;
            text-align: justify;
        }
        

        .auto-style36 {
            width: 1118px;
        }
        

        .auto-style51 {
            height: 764px;
            width: 1193px;
        }
        
         

        
        

        .auto-style44 {
            background-color: #B4E2EA;
            text-align: center;
            width: 82px;
        }
        .auto-style54 {
            width: 1049px;
            margin: 0px auto;
            height: 141px;
        }
        

        .auto-style55 {
        height: 21px;
        background-color: #D6CEAA;
        color: #FFFFFF;
    }
        

        .auto-style56 {
            height: 21px;
            background-color: #FFFFFF;
            color: #FFFFFF;
        }
        .auto-style57 {
            width: 716px;
            height: 21px;
            background-color: #D6CEAA;
            color: #FFFFFF;
        }
        .auto-style58 {
            width: 100px; 
            background-color: #D6CEAA;
            color: #FFFFFF;
        }
        

        </style>
    
<script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인
    
        location.replace('/Book_ReviewWrite/List.aspx');


}else{   //취소

        return;
    }

}


</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
 
    <div style="width:1300px; margin-left:550px; background-color:white; ">

    
    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/독후감쓰기_메뉴.jpg" />

        <br />
        <span class="auto-style27">
            <span>


    
        <asp:Panel ID="Panel_view" runat="server" Height="842px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <span class="auto-style27"><span>
                <br />
                <br />
                <table align="center" class="auto-style36" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr class="auto-style44">
                        <td class="auto-style55" colspan="2">
                            <br />
                            <strong><span class="auto-style27"><span>
                            <br />
                            *&nbsp; 입력하신 내용에 맞춰 글이 수정됩니다.<br />
                            <br />
                            </span></span></strong>
                            <br />
                        </td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style58"><strong>글 번호</strong></td>
                        <td class="auto-style35">
                            <asp:Label ID="lblNum" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style58"><strong>글 제목</strong></td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtTitle" runat="server" MaxLength="20" Width="600px"></asp:TextBox>
                            &nbsp; *&nbsp; 20자까지&nbsp;<span><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTitle" Display="None" ErrorMessage="글 제목을 입력하세요!">[글 제목] 필수입력</asp:RequiredFieldValidator>
                            </span>&nbsp; </td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style58"><strong>책 제목</strong></td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtBookName" runat="server" MaxLength="20" Width="600px"></asp:TextBox>
                            &nbsp;&nbsp;<span><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBookName" Display="None" ErrorMessage="책 제목을 입력하세요!">[책 제목] 필수입력</asp:RequiredFieldValidator>
                            </span>&nbsp;</td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style58"><strong>책 작가명</strong></td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtAuthor" runat="server" MaxLength="20" Width="300px"></asp:TextBox>
                            &nbsp;*&nbsp; 20자까지&nbsp;&nbsp; <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAuthor" Display="None" ErrorMessage="책 저자를 입력하세요!">[책 저자] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style58"><strong>책 분야</strong></td>
                        <td class="auto-style20">
                            <asp:DropDownList ID="ddlGenre" runat="server" Height="16px" Width="199px">
                                <asp:ListItem>인문학</asp:ListItem>
                                <asp:ListItem>미술</asp:ListItem>
                                <asp:ListItem>기타</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp; <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlGenre" Display="None" ErrorMessage="읽은 책의 분야를 골라주세요!">[분야/장르] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style56" colspan="2"><span class="auto-style27"><span>
                            <asp:TextBox ID="txtContent" runat="server" Columns="20" Height="200px" Rows="5" TextMode="MultiLine" Width="1150px"></asp:TextBox>
                            </span></span></td>
                    </tr>
                    <tr class="auto-style44">
                        <td class="auto-style58"><strong>별점</strong></td>
                        <td class="auto-style20">
                            <asp:DropDownList ID="ddlReviewStar" runat="server" Height="16px" Width="211px">
                                <asp:ListItem>★★★★★</asp:ListItem>
                                <asp:ListItem>★★★★☆</asp:ListItem>
                                <asp:ListItem>★★★☆☆</asp:ListItem>
                                <asp:ListItem>★★☆☆☆</asp:ListItem>
                                <asp:ListItem>★☆☆☆☆</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp; <span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlReviewStar" Display="None" ErrorMessage="별점을 매겨주세요!">[별점] 필수입력</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                </table>
                <div id="banner" class="auto-style54">
                    <asp:Button ID="btnModify" runat="server" CssClass="button-style44" onclick="btnWrite_Click" Text="수정" />
                    &nbsp;&nbsp;&nbsp;
                    <input id="Button1" type="button" value="목록으로" onclick="button_event();" class="button-style44" />
                    <span class="auto-style27"><span>
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtContent" Display="None" ErrorMessage="내용을 입력하세요!">[내용] 필수입력</asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </span></span>
                </div>
                </span></span>
                <br />
            </div>
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;<br />
                <br />
        </asp:Panel>

            </span>
            </span>
        <br />
        <br />
        <br />
        <br />
        <br />

        <br />
     
    
    </div>
    </asp:Content>