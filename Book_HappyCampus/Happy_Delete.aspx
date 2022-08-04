<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Happy_Delete.aspx.cs" Inherits="Book_HappyCampus_Happy_del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

                
    


        .auto-style29 {
            margin-bottom: 0px;
        }
        
                
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="background-color:white; margin-left:550px; width:1300px;">
    




    <asp:Image ID="Image3" runat="server" Height="132px" Width="1298px" ImageUrl="~/CSS_pic/자료나눔_메뉴.jpg" CssClass="auto-style29" />
    




         <br />
         <br />

             <div id="banner" class="auto-style37">  



    <asp:Label ID="lblNum" runat="server" ForeColor="Red"></asp:Label>
                 번 글을 삭제하시려면 &#39;삭<span>제&#39; 버튼을 클릭하세요.</span><br />
                 <br />
                 <br />
                 <br />
    <asp:Button ID="btnDelete" runat="server" Text="삭제" 
            OnClientClick="return confirm('정말로삭제??');" onclick="btnDelete_Click" CssClass="button-style44" />
    &nbsp;&nbsp; &nbsp;
    <asp:Button ID="btnCancel" runat="server" Text="취소" onclick="btnCancel_Click" CssClass="button-style44" CausesValidation="False" />
    
        <br />
                 <br />
        <br />
    
            </div>

         <br />
         <br />
        <br />
    
        <asp:Label ID="lblError" runat="server" Text="Label" Visible="False"></asp:Label>
    
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="278px" Visible="False"></asp:TextBox>
        <br />
    
    </div>
</asp:Content>

