<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="HappyCampus_history.aspx.cs" Inherits="Book_HappyCampus_HappyCampus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
            
        .auto-style27 {
            font-size: large;
        }
        
        .auto-style28 {
            font-size: xx-large;
        }
        
            


        .auto-style29 {
            margin-bottom: 0px;
        }
        
        .auto-style30 {
            font-size: 10pt;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="width:1300px; margin-left:550px;  background-color:white; ">
    




    <asp:Image ID="Image3" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/자료나눔_메뉴.jpg" CssClass="auto-style29" />
        <span class="auto-style27">
        <div id="page" class="container">
            <span>
            <br />


     
        <asp:Label ID="lbl_ID" runat="server" CssClass="auto-style28" Text="lbl_ID"></asp:Label>


     
            <span class="auto-style27">
        님 어서오세요.<asp:Label ID="lbl_cnt" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            </span>
            </span></div>
            </span>
        <div id="banner" class="container">  



            <span class="auto-style27">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [happy] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_ID" Name="id" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False"  
            OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"

             CellPadding="4" ForeColor="#333333" GridLines="None"
            DataSourceID="SqlDataSource1" Width="1232px"  Height="50px" CssClass="auto-style30">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="seq" />
                <asp:BoundField DataField="id" HeaderText="작성자" SortExpression="id" />
                <asp:HyperLinkField DataNavigateUrlFields="seq" DataNavigateUrlFormatString="Happy_view.aspx?seq={0}" DataTextField="subject" HeaderText="제목" SortExpression="subject" />
                <asp:BoundField DataField="regdate" HeaderText="작성일" SortExpression="regdate" />
                <asp:BoundField DataField="fileName" HeaderText="파일명" SortExpression="fileName" />
                <asp:BoundField DataField="filePath" HeaderText="파일 위치" SortExpression="filePath" />
            </Columns>
            
                <EmptyDataTemplate>현재 등록된 게시물이 없습니다.</EmptyDataTemplate>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="black" />
                    <PagerStyle BackColor="Gainsboro" ForeColor="black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            </span>
     


            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="button-style44" OnClick="Button2_Click" Text="메인으로" />
           


            </div>

        <br />
    <br />
     
        
    </div>
       <br />
    <br />
    </asp:Content>

