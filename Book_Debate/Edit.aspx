<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Members.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <link href="CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 

    <style type="text/css">

        
        
        .auto-style45 {
            width: 1165px;
        }

        .auto-style44 {
            background-color: #B4E2EA;
            text-align: center;
            width: 78px;
            color: #FFFFFF;
        }
        
        .auto-style46 {
            text-align: justify;
        }

        .auto-style47 {
            font-size: 10pt;
        }

            
        .auto-style51 {
            height: 903px;
            width: 1193px;
        }
        
         

        
        

        .auto-style41 {
            background-color: #FFFFFF;
        }

        .auto-style55 {
            width: 800px;
        }
        .auto-style56 {
            width: 1300px;
            height: 1170px;
        }

            
        </style>

    
<script type="text/javascript">

function button_event(){

    if (confirm("작성 중이던 문서를 취소하고 목록으로 이동하시겠습니까?") == true){    //확인

        location.replace('/Book_Debate/List.aspx');


}else{   //취소

    return;

}

}

</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="width:1300px; margin-left:550px; background-color:white; " class="auto-style56">

    
    <asp:Image ID="Image2" runat="server" Height="140px" Width="1300px" ImageUrl="~/CSS_pic/토론방_메뉴.jpg" />

    
        <br />
        <span class="auto-style27">
            <span>


    
        <asp:Panel ID="Panel_view" runat="server" Height="970px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"><span class="auto-style27"><span>
            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                <strong>
                <br />
                <br />
                <span class="auto-style27"><span>
                <br />
                <br />
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">제목</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27"><span><strong>
                            <asp:TextBox ID="TextBoxSubject" runat="server" CssClass="txt" style="font-size: small" Width="600px"></asp:TextBox>
                            <span class="auto-style47">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxSubject" Display="None" ErrorMessage="제목을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span></strong></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><span class="auto-style27"><strong>토론기간</strong></span></td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27"><span><strong>
                            <table class="auto-style55">
                                <tr>
                                    <td><span class="auto-style27"><span><strong>
                                        <asp:Calendar ID="cdrCalendar_start" runat="server" backcolor="White" bordercolor="White" borderwidth="1px" font-names="Verdana" font-size="9pt" ForeColor="Black" height="190px" nextprevformat="FullMonth" OnSelectionChanged="cdrCalendar_start_SelectionChanged" width="350px">
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                        </asp:Calendar>
                                        <br />
                                        <asp:TextBox ID="txtDOB_start" Runat="server" CssClass="auto-style47" ReadOnly="True" Width="250px"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDOB_start" CssClass="auto-style41" Display="Static" ErrorMessage="토론 시작일을 입력하세요." ValidationGroup="debatewrite" Visible="False">토론 시작일을 입력하세요.</asp:RequiredFieldValidator>
                                        </strong></span></span></td>
                                    <td><span class="auto-style27"><span>
                                        <asp:Calendar ID="cdrCalendar_end" runat="server" backcolor="White" bordercolor="White" borderwidth="1px" font-names="Verdana" font-size="9pt" ForeColor="Black" height="190px" nextprevformat="FullMonth" OnSelectionChanged="cdrCalendar_end_SelectionChanged" width="350px">
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                        </asp:Calendar>
                                        <strong>
                                        <br />
                                        <asp:TextBox ID="txtDOB_end" Runat="server" ReadOnly="True" Width="250px"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOB_end" CssClass="auto-style41" Display="Static" ErrorMessage="토론 마지막날을 입력하세요." ValidationGroup="debatewrite" Visible="False">토론 마지막날을 입력하세요.</asp:RequiredFieldValidator>
                                        </strong></span></span></td>
                                </tr>
                            </table>
                            </strong></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">내용</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27"><span><strong>
                            <asp:TextBox ID="TextBoxContent" runat="server" bgcolor="Silver" CssClass="txt" Height="300px" style="font-size: small" TextMode="MultiLine" Width="600px"></asp:TextBox>
                            <span class="auto-style47">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxContent" Display="None" ErrorMessage="내용을 입력하세요." SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span></strong></span></span></td>
                    </tr>
                </table>
                </span></span>
                </strong>
                <span class="auto-style27"><span>
                <div id="banner" class="container">
                    <asp:Button ID="bnt_submit" runat="server" CssClass="button-style33" OnClick="bnt_submit_Click" Text="글쓰기" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="Button1" class="button-style33" type="button" value="취소하기" onclick="button_event();" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                <br />
                <br />
                </span></span>
            </div>
            </span></span><br />
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;<br />
                <br />
        </asp:Panel>


    
            </span>
            </span>
        <br />
    <br />
     
        
    </div>


    
    <br />
     
     <br />

       </asp:Content>

