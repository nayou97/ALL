<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Basic_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <link href="../CSS/6/default_6.css" rel="stylesheet" type="text/css" /> 
    <style type="text/css">


                    
        .auto-style25 {
            border-style: groove;
width: 1296px;
            text-align: center;
            margin: 0px auto;
            background-color: white;
            border-color:inherit;
            border-width:2px;
        }
        
        
                
        .auto-style27 {
            width: 150px;
            height: 37px;
        }
        
                

        .auto-style27 {
            text-decoration: none;
        }
        
            
        

        .auto-style40 {
            width: 138px;
            text-align: left;
        }
        
    


        .auto-style41 {
            text-align: justify;
            margin-right: 30px;
            margin-left: 30px;
        }
        
    


        .auto-style42 {
            color: #D6CEAA;
        }
        
    


        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
 
    <div style="width:1300px; margin-left:550px; background-color:white;">





    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/독후감쓰기_메뉴.jpg" />







    <div class="auto-style25">

        <br />
        <div id="page" class="auto-style41">

        <span>


     
            <span class="auto-style27">
        <fieldset>
                    <legend class="auto-style40">&nbsp; ※ 알림 사항</legend>

     
                    <br />

                    &nbsp;*&nbsp; <strong>
                    <asp:Label ID="lbl_ID" runat="server" CssClass="auto-style42" Text="Label"></asp:Label>
                    </strong>님 어서오세요.<br />
                    <br />
&nbsp;*&nbsp; 회원님이 기록하신 독후감은 이 곳에 저장됩니다.<br />

                    <br />
                    </fieldset><br />
        <asp:Button ID="btnWrite" runat="server" Text="글쓰기" onclick="btnWrite_Click" CssClass="button-style44" />
            
            <br />
            <br />
            <br />
            </span>


     
            </span>
                <div class="auto-style8">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                    OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
                    DataKeyNames="Num" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1203px" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Num" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="Num" />
                        <asp:HyperLinkField DataNavigateUrlFields="Num" DataNavigateUrlFormatString="View.aspx?Num={0}" DataTextField="Title" HeaderText="독후감 제목" SortExpression="Num" />
                        <asp:BoundField DataField="BookName" HeaderText="책 제목" SortExpression="BookName" />
                        <asp:BoundField DataField="Genre" HeaderText="분야/장르" SortExpression="Genre" />
                        <asp:BoundField DataField="PostDate" HeaderText="작성일" SortExpression="PostDate" />
                        <asp:BoundField DataField="Author" HeaderText="책 작가명" SortExpression="Author" />
                        <asp:BoundField DataField="ReviewStar" HeaderText="별점" SortExpression="ReviewStar" />
                    </Columns>
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
                </div>
        <br />

    </div><br />

        </div>
        <br />
        
            
</div>
</asp:Content>

