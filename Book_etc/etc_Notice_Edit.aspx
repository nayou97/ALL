<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Notice.master" AutoEventWireup="true" CodeFile="etc_Notice_Edit.aspx.cs" Inherits="Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .auto-style51 {
            height: 519px;
            width: 1175px;
        }
        
         

        
        

        .auto-style53 {
            width: 1073px;
            margin: 0px auto;
        }

        .auto-style45 {
            width: 1049px;
        }

        
        


        .auto-style44 {
            background-color: #FED8C2;
            text-align: center;
            width: 82px;
            color: #FFFFFF;
        }
        
        .auto-style46 {
            text-align: justify;
        }

        </style>

    
<script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인

        location.replace('/Book_etc/etc_Notice.aspx');


}else{   //취소

        return;
    }

}


</script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:1300px; margin-left:550px;">



        <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl="~/CSS_pic/공지사항_메뉴.jpg" Width="1300px" />

    

        <br />
            <span>
        <span class="auto-style27">
        <asp:Panel ID="Panel_view" runat="server" Height="611px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><br />
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style51">
                <span><span class="auto-style27"><strong>
                <div id="banner0" class="auto-style53">
                    &nbsp;&nbsp;&nbsp;
                    <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                        <tr>
                            <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">제목</td>
                            <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span><span class="auto-style27">
                                <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="txt" Width="600px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxTitle" Display="None" ErrorMessage="제목을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </span></span></td>
                        </tr>
                        <tr>
                            <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">내용</td>
                            <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span><span class="auto-style27">
                                <asp:TextBox ID="TextBoxContent" runat="server" CssClass="txt" Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용를 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </span></span></td>
                        </tr>
                    </table>
                </div>
                </strong></span></span>&nbsp;<div style="text-align:center;margin:10px;">
                    <asp:Button ID="bnt_Write" runat="server" CssClass="button-style66" OnClick="bnt_Write_Click" Text="수정하기" />
                    &nbsp;<span><span class="auto-style27"><strong><input id="Button1" type="button" value="작성 취소" onclick="button_event();" class="button-style66" /></strong></span></span><br />
                    <span>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </span>
                    <br />
                </div>
                <br />
            </div>
            <br />
            <br />
        </asp:Panel>
            </span>
            <br />
            </span>

        </div>
</asp:Content>

