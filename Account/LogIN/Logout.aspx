<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title></title>

    <link href="../../CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 

    <style type="text/css">
        .auto-style20 {
            font-size: x-large;
        }
            
    
        .auto-style44 {
            width: 1191px;
        }
        
    
        

    
        .auto-style28 {
            width: 993px;
            text-align: center;
            margin: 0px auto;
            background-color: #EFEFEF;
            height: 279px;
        }
                
    
        

        .auto-style52 {
            text-align: center;
        }
        

    
        .auto-style2 {
            background-color: #FEEB9E;
        }


        .auto-style5 {}
        

    

        .auto-style11 {
            background-color: #FDCD0F;
            text-align: right;
        } 
        
             
        .auto-style4 {
            color: #000000;
        }
        
                                

        </style>
    
    </head>
<body style="height: 1838px">
    <form id="form1" runat="server" class="auto-style54">

    <div class="auto-style52">
          

                <asp:Panel ID="PanelLogIN0" runat="server"  Height="100px" CssClass="auto-style11" Width="1900px" Wrap="False"> 
                
                
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <br />
                    <br />



                    <strong>
                    <asp:Label ID="Label3" runat="server" CssClass="auto-style4" style="color: #333333; background-color: #FDCD0F;" Text="[Label3]" Visible="False"></asp:Label>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="bnt_mypage" runat="server" CausesValidation="False" CssClass="button-style22" OnClick="bnt_mypage_Click" Text="마이페이지" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="bnt_logout" runat="server" CausesValidation="False" CssClass="button-style22" OnClick="bnt_logout_Click" Text="로그아웃" />
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                    <br />

                
            </asp:Panel>
          
                    <asp:Panel ID="Panel_logo" runat="server"  Height="100px" CssClass="auto-style2" Width="1900px"> 
                
                
                    <asp:ImageButton ID="bnt_logohome4" runat="server" BorderStyle="Groove" Height="92px" ImageUrl="~/CSS_pic/홈로고.png" OnClick="bnt_logohome2_Click" Width="571px" CausesValidation="False" />
                        <br />

                
            </asp:Panel>


            <asp:Panel ID="PanelLogIN" runat="server"  Height="55px" CssClass="auto-style5" Width="1900px"> 
                
                
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
                        </div>
                    </div>

                </div>



            </asp:Panel>





    
     

         
        
                    <div style="margin-left:300px; margin-right:300px; background-color:white; height: 799px;" class="auto-style48">
     




    <asp:Image ID="Image3" runat="server" Height="300px" Width="1300px" ImageUrl="~/CSS_pic/회원끼리_상단배너.jpg" />
     



             
        <asp:Panel ID="Panel_view" runat="server" Height="471px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1295px">
            <div style="margin:20px; border-style:solid; border-width:1px; padding:10px 30px; height: 391px;" class="auto-style44">
                <br />
                <br />
                <br />
                <div id="page" class="auto-style28">
                    <br />
                    <span class="auto-style27"><span class="auto-style20">
                    <br />
                    LogOut_로그아웃하기</span><br /> </span>
                    <br />
                    <div id="banner0" class="auto-style30">
                        <br />
                        <br />
                        정말 로그아웃 하시겠습니까?<br />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CssClass="button-style22" OnClick="Button1_Click" Text="로그아웃" />
                        <br />
                        <br />
                        <br />
                    </div>
                    <br />
                    <br />
                </div>
                <br />
            </div>
        </asp:Panel>
        <br />
       <br />
       </div>

        </div>
         <br />
       <br />

          <div style="background-image:url('/CSS_pic/하단.jpg'); height: 296px;" class="auto-style53">
     </div>
        
    </form>
    <br />
     

    </body>
</html>