<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title></title>
   <link href="../../CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 

    <style type="text/css">
     

        
        

        .auto-style2 {
            background-color: #FEEB9E;
        }


        .auto-style30 {
            width: 455px;
            margin-left: 100px;
            background-color: #FFFFFF;
            height: 50px;
            

        } 




        .auto-style39 {
            width: 381px;
        }
                
    
        .auto-style44 {
            width: 1066px;
        height: 429px;
    }
        
    
        

        .auto-style45 {
            width: 1117px;
            text-align: justify;
            color: #0066FF;
            font-weight: normal;
        }
        
    
        

    .auto-style46 {
        width: 1194px;
        height: 578px;
    }
        
    
        

        .auto-style48 {
            width: 1300px;
            height: 1015px;
        }
        
    
        

        .auto-style49 {
            background-color: #E7E7E7;
        }
        
    
        

        .auto-style50 {
            width: 690px;
            margin-left: 200px;
            background-color: #FFFFFF;
            height: 202px;
        }
        
    
        

        .auto-style51 {
            width: 792px;
        }
        
    
        

        .auto-style52 {
            text-align: center;
        }
        
    
        

        .auto-style53 {
            height: 350px;
            width: 1551px;
        }
        .auto-style54 {
            height: 1807px;
        }
        
    
        

        </style>
    
    </head>
<body style="height: 1838px">
    <form id="form1" runat="server" class="auto-style54">
        <div class="auto-style52">
                    <asp:Panel ID="Panel_logo" runat="server"  Height="100px" CssClass="auto-style2" Width="1900px"> 
                
                
                    <asp:ImageButton ID="bnt_logohome4" runat="server" BorderStyle="Groove" Height="92px" ImageUrl="~/CSS_pic/홈로고.png" OnClick="bnt_logohome2_Click" Width="571px" CausesValidation="False" />
                       

                
            </asp:Panel>


                </div>


            <asp:Panel ID="PanelLogIN" runat="server"  Height="62px" CssClass="auto-style5" Width="1900px"> 
                
                
                <div id="menu-wrapper_mybook">
                    <div id="menu" class="container">
                        <div id="menu0" class="container">
                            <ul class="auto-style16">
                            <li>
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style12" NavigateUrl="~/Book_etc/etc_Notice.aspx">공지사항</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style12" NavigateUrl="~/Book_ReviewWrite/List.aspx">토론방</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink4" runat="server" CssClass="auto-style12" NavigateUrl="~/Book_Academy/List.aspx">스마트에듀</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink7" runat="server" CssClass="auto-style12" NavigateUrl="~/Account/MyPage.aspx">아나바다</asp:HyperLink>
                            </li>

                        </ul>
                            <br />
                        </div>
                        <br />
                    </div>

                </div>



            </asp:Panel>
         
        <div style="margin-left:300px; margin-right:300px; background-color:white;" class="auto-style48">
     




    <asp:Image ID="Image3" runat="server" Height="300px" Width="1300px" ImageUrl="~/CSS_pic/회원끼리_상단배너.jpg" />
     



             
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;" class="auto-style46" __designer:mapid="79b">
        <asp:Panel ID="Panel_view" runat="server" Height="565px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1187px">
            <div style="margin:20px; border-style:solid; border-top:double; border-top-color:blue; border-width:1px; padding:40px; margin-right:20px;" class="auto-style44">
                <h1 class="auto-style45"><span class="auto-style27"><strong>로그인</strong></span></h1>
                
                <br />
                <p>
                    <strong>TREEBOOKEE에 오신 것을 환영합니다.</strong>
                    <asp:Panel ID="Panel1" runat="server" CssClass="auto-style49" Height="94px">
                        <br />
                        &nbsp; -&nbsp; 트리부키의 모든 서비스는 회원제이오니 로그인 후 사용해 주십시오.<br /> &nbsp; -&nbsp; 서비스 이용 후에는 반드시 로그아웃을 해 주십시오.<br /> &nbsp; -&nbsp; 한 번의 로그인으로 자유롭게 서비스를 이용하실 수 있습니다.</asp:Panel>
                    <br />
                    <div id="banner" class="auto-style50">
                        <table class="auto-style30">
                            <tr>
                                <td class="auto-style51">아이디</td>
                                <td class="auto-style39">
                                    <asp:TextBox ID="TextBoxID" runat="server" CssClass="txt" Width="230px"></asp:TextBox>
                                </td>
                                <td rowspan="2">
                                    <asp:Button ID="Button1" runat="server" CssClass="button-style22" OnClick="Button1_Click" Text="로그인" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style51">비밀번호</td>
                                <td class="auto-style39">
                                    <asp:TextBox ID="TextBoxPwd" runat="server" CssClass="txt" TextMode="Password" Width="230px">비밀번호</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        ▶&nbsp; 아직 회원이 아니신가요?<br />
                        <br />
                        <asp:Button ID="bnt_mjoin" runat="server" CssClass="button-style22" OnClick="bnt_mjoin_Click" Text="회원가입" />
                    </div>
                    <br />
                    <br />
                    </p>

            </div>
        </asp:Panel>
                <br />
            </div>
        <br />

        
        
          

    </div>
    <br />
    <br />
        <div style="background-image:url('/CSS_pic/하단.jpg')" class="auto-style53">
     </div>
    <br />
    </form>
    <br />
     

    </body>
</html>
