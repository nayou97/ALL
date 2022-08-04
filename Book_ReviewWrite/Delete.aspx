<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Basic_Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <div style="width:1300px; margin-left:550px; background-color:white; ">
    




    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/독후감쓰기_메뉴.jpg" />
        <br />
        <br />

             <div id="banner" class="auto-style37">  



                 삭<span>제 버튼을 누르면 삭제됩니다.<br />
                 <br />
                 <br />
                 <br />
    <asp:Button ID="btnDelete" runat="server" Text="삭제" 
            OnClientClick="return confirm('정말로삭제??');" onclick="btnDelete_Click" CssClass="button-style44" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancel" runat="server" Text="취소" onclick="btnCancel_Click" CssClass="button-style44" CausesValidation="False" />
    
                 <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>

        <br />
    
    </div>
    </asp:Content>