<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Members.master" AutoEventWireup="true" CodeFile="Del.aspx.cs" Inherits="Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 
    <style type="text/css">
                
        .auto-style37 {
        width: 1221px;
        margin: 0px auto;
        font-size: x-large;
    }
        
    
        .auto-style38 {
            font-size: medium;
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

     

       <div style="width:1300px;margin-left:550px;background-color:white;">

    
    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/토론방_메뉴.jpg" />

             <br />

             <div id="banner" class="auto-style37">  


                 <span class="auto-style38">정말 삭제하시겠습니까?</span><br />
                 <br />
                 <asp:Button ID="Button4" runat="server" CssClass="button-style33" OnClick="Button4_Click" Text="삭제하기" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Button3" runat="server" CssClass="button-style33" OnClick="Button3_Click" Text="돌아가기" />
             
            </div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             <br />

    </div>



</asp:Content>

