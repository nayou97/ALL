<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Members.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 
    
    <style type="text/css">


        #page {
            overflow: hidden;
            width: 1100px;
            margin-bottom: 3em;
            padding: 5em 50px;
            background: #FFF;
            border: 1px solid #D9D2A5;
        }


        .container{
             background-color: #F0E9D7;
        }



        .container {
            width: 993px;
            margin: 0px auto;

        }
        
        
        #banner {
            padding: 30px 0px;

        }





        #page {
            overflow: hidden;
            width: 1100px;
            margin-bottom: 3em;
            padding: 5em 50px;
            background: #FFF;
            border: 1px solid #D9D2A5;

        }

        #banner {
            padding: 30px 0px;

        }

        .auto-style41 {
            background-color: #FFFFFF;
        }

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

        .auto-style48 {
            width: 993px;
            margin: 0px auto;
            background-color: #FFFFFF;
        }

        
         

         
        .auto-style51 {
            height: 836px;
            width: 1193px;
        }
        
         

        
        

        #banner0 {
            padding: 30px 0px;

        }





        #banner0 {
            padding: 30px 0px;

        }

        
         

         
        .auto-style55 {
            width: 800px;
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

    <div style="width:1300px; margin-left:550px; background-color:white;">

    

        <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/토론방_메뉴.jpg" />
        <span class="auto-style27">
        <br />
            
            
     
    
    

    
        <asp:Panel ID="Panel_view" runat="server" Height="890px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"> 
            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                 
                <br />
                <span class="auto-style27"><span><strong>
                <table align="center" class="auto-style45" style="border-top:solid;border-top-color:gainsboro;border-bottom:solid;border-bottom-color:gainsboro;">
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">제목</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27">
                            <asp:TextBox ID="TextBoxSubject" runat="server" Columns="150" CssClass="txt" style="font-size: 10pt" Width="97%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxSubject" CssClass="auto-style41" Display="Dynamic" ErrorMessage="제목을 입력하세요." Visible="False">제목을 입력하세요.</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;"><span class="auto-style27"><strong>토론기간</strong></span></td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450">
                            <table class="auto-style55">
                                <tr>
                                    <td><span class="auto-style27"><span><strong>
                                        <asp:Calendar ID="cdrCalendar_start" runat="server" backcolor="White" bordercolor="White" borderwidth="1px" font-names="Verdana" font-size="9pt" height="190px" nextprevformat="FullMonth" OnSelectionChanged="cdrCalendar_start_SelectionChanged" width="350px" ForeColor="Black">
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BackColor="White" BorderColor="Black" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                        </asp:Calendar>
                                        </strong></span></span></td>
                                    <td><span class="auto-style27"><span>
                                        <asp:Calendar ID="cdrCalendar_end" runat="server" backcolor="White" bordercolor="White" borderwidth="1px" font-names="Verdana" font-size="9pt" height="190px" nextprevformat="FullMonth" OnSelectionChanged="cdrCalendar_end_SelectionChanged" width="350px" ForeColor="Black">
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BackColor="White" BorderColor="Black" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                        </asp:Calendar>
                                        </span></span></td>
                                </tr>
                                <tr>
                                    <td><span class="auto-style27"><span><strong>
                                        <asp:TextBox ID="txtDOB_start" Runat="server" CssClass="auto-style47" ReadOnly="True" Width="350px"></asp:TextBox>
                                        </strong></span></span></td>
                                    <td><span class="auto-style27"><span><strong>
                                        <asp:TextBox ID="txtDOB_end" Runat="server" ReadOnly="True" Width="350px"></asp:TextBox>
                                        </strong></span></span></td>
                                </tr>
                            </table>
                            <span class="auto-style27"><span><strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDOB_start" CssClass="auto-style41" Display="Static" ErrorMessage="토론 시작일을 입력하세요." ValidationGroup="debatewrite" Visible="False">토론 시작일을 입력하세요.</asp:RequiredFieldValidator>
                            </strong></span></span>
                            <br />
                            <span class="auto-style27"><span><strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOB_end" CssClass="auto-style41" Display="Static" ErrorMessage="토론 마지막날을 입력하세요." ValidationGroup="debatewrite" Visible="False">토론 마지막날을 입력하세요.</asp:RequiredFieldValidator>
                            </strong></span></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style44" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;">내용</td>
                        <td class="auto-style46" style="padding:5px;border-bottom:groove;border-bottom-color:gainsboro;border-bottom-width:2px;" width="450"><span class="auto-style27">
                            <asp:TextBox ID="TextBoxContent" runat="server" CssClass="txt" Height="205px" style="font-size: 10pt" TextMode="MultiLine" Width="99%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxContent" CssClass="auto-style41" Display="Static" ErrorMessage="내용을 입력하세요." ValidationGroup="debatewrite" Visible="False">내용을 입력하세요.</asp:RequiredFieldValidator>
                            </span></td>
                    </tr>
                </table>
                <br />
                <div id="banner" class="auto-style48">
                    <asp:Button ID="Button2" runat="server" CssClass="button-style33" OnClick="Button2_Click" Text="글쓰기" />
                    &nbsp;&nbsp;&nbsp;<input id="Button3" class="button-style33" type="button" value="목록으로" onclick="button_event();" />&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:Label ID="lbl_message" runat="server" Style="font-weight:700; color: #CC0066" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" />
                </div>
                <br />
                <br />
                <br />
                <br />
                </strong></span></span>
                 
                <br />
                  
                 
                <br />
                 
                <span class="auto-style27"><span><strong>
                <asp:Label ID="lbl_start" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="lbl_end" runat="server" Text="Label" Visible="False"></asp:Label>
                </strong></span></span>
                 
            </div>
        </asp:Panel>


     
        <br />
       <br />
        
    </div>
    <br />
    
    
     
    
    

    </span>
    
    
     
    
    

</asp:Content>

