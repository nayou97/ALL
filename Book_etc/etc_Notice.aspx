<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Notice.master" AutoEventWireup="true" CodeFile="etc_Notice.aspx.cs" Inherits="Book_etc_Book_etc_Meeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

            
        .auto-style27 {
            font-size: large;
        }
        
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="height:1000px; width:1300px; margin-left:550px; background-color:white;">


        <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl="~/CSS_pic/공지사항_메뉴.jpg" Width="1300px" />

    

    <br />

    

        <div id="page" class="container">
            <span>
            <br />

            <br />

       
        <asp:GridView ID="ctlBasicList" runat="server" BackColor="White" 
            AutoGenerateColumns="False"
            BorderColor="#333333" BorderStyle="None" BorderWidth="1px" 
            OnPageIndexChanging="ctlBasicList_PageIndexChanging" PageSize="10"
            CellPadding="3" Width="1215px" style="text-align: center" >
            
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" BorderColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

            <Columns>
               <asp:BoundField HeaderText="등록번호" DataField="Num" />
                 


                <asp:HyperLinkField HeaderText ="제목"
                         DataNavigateUrlFields ="Num"
                         DataNavigateUrlFormatString="etc_Notice_View.aspx?Num={0}"
                         DataTextField="Title"
                         ItemStyle-Width ="500px" > 
                <ItemStyle Width="500px"></ItemStyle>
                </asp:HyperLinkField>
                         


                <asp:BoundField HeaderText="계정(운영자)" DataField="id" />
                <asp:BoundField HeaderText="작성일" DataField="PostDate" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField HeaderText="조회수" DataField="ReadCount" />

            </Columns>
                
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FDA671" Font-Bold="True" ForeColor="black" />
                    <PagerStyle BackColor="Gainsboro" ForeColor="black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView> 
        




            <span class="auto-style27">
        <asp:Label ID="lbl_cnt" runat="server" Text="Label" Visible="False"></asp:Label>
            </span> 
        




            <br />
            </span>
            <div id="banner" class="container">  



    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="공지하기" CssClass="button-style66" Visible="False" />
                </div>

    </div>

    

        <br />
        <br />
        <br />
        <br />
        <br />
    <br />

       



        <br />
    <br />
    &nbsp; 
        &nbsp;<br />
    <br />
    <br />
        
    </div>
</asp:Content>

