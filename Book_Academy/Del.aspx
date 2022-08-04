<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Del.aspx.cs" Inherits="Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
                                    
        .auto-style36 {
            font-size: x-large;
        }
        
    
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     

       <div style="text-align:center; background-color:white; margin-left:550px; width:1300px;">
    




    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/1대1논술교실_메뉴.jpg" />
    




           <div id="banner" class="container">  



             <div id="banner0" class="auto-style37">  



    <asp:Label ID="lblNum" runat="server" ForeColor="Red"></asp:Label>
                 번 글을 삭제하시려면 <span>&#39;삭제하기&#39; 버튼을 클릭하세요.</span></div>
               <span class="auto-style27">
                 <span>

    
                    <span class="auto-style36">

                 <br />
                 <br />
                 </span></span></span>
                 <asp:Button ID="Button2" runat="server" CssClass="button-style44" Text="삭제하기" OnClick="Button2_Click"/>

             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" CssClass="button-style44" Text="돌아가기" OnClick="Button1_Click" CausesValidation="False" />
                 <br />
                 <br />
            </div>

             <br />
             <br />
             <br />
             <br />

    </div>



</asp:Content>

