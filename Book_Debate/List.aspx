<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Members.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/6/default_6.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
        .auto-style25 {
            text-align: center;
            margin: 0px auto;
            background-color: #FFFFFF;
        }
        
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


        #banner
        {
            padding: 30px 0px;
        }
        
        
        
        .button-style {
    
            display: inline-block;
    
            margin-top: 20px;
    
            padding: 10px 20px;
    
            background: #99CCBB;
    
            border-radius: 5px;
    
            box-shadow: 0px 0px 0px 5px rgba(255,255,255,0.1);
    
            border: 1px solid #8EBEAE;
    
            line-height: normal;
    
            text-align: center;
    
            text-decoration: none;
    
            text-transform: uppercase;
    
            text-shadow: 0px 1px 0px rgba(0,0,0,.2);
    
            font-size: 1em;
    
            font-weight: 400;
    
            color: #FFF !important;


        }


                 
        .auto-style42 {
            font-size: small;
            padding-left:20px;
        }


        .auto-style43 {
            width: 100%;
        }


        .auto-style44 {
            text-align: center;
            height: 46px;
            background-color: #B4E2EA;
            color: #FFFFFF;
        }
         
         

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="width:1300px; margin-left:550px; background-color:white; ">

    

    <asp:Image ID="Image2" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/토론방_메뉴.jpg" />

    

        <br />

        <br />



      
        <fieldset class="auto-style42">
                    <legend class="auto-style42">※&nbsp; 알림 사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </legend>

                    <br />

                    *&nbsp; 매주마다 새로운 토론 주제가 나옵니다.<br />
                    *&nbsp; 주제 선정은 해당
                    <span>
                    담당자님이 매주 정해주십니다.<br />
                    *&nbsp; 주제에 관한 토론만 가능하며, 토론내용에 대해서는 운영자는 일제 관여하지 않습니다.<br />
                    *&nbsp; 잘못된 주제에 대해서 혹은 비방/비하성 댓글의 경우, 알림 없이 운영자가 삭제 조치 하겠습니다.<br />
                    *&nbsp; 여러분이 토론하신 내용은 매 주 갱신될 때마다 전부 삭제됩니다.</span><br />
                    <br />
                    </fieldset><br />
                <br />
     
        
             <asp:Button ID="Button2" runat="server" CssClass="button-style33" Text="글쓰기" OnClick="Button2_Click" Visible="False" />


            <br />
        <br />

         


     
            <br />
                <div id="page" class="container">
                     


                    <br />
                    <table class="auto-style43">
                        <tr>
                            <td class="auto-style44"><strong>진행중인 주제</strong></td>
                        </tr>
                        <tr>
                            <td> 


            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ForeColor="#333333" GridLines="None"

             AutoGenerateColumns="False" CssClass="auto-style25" DataKeyNames="seq"

             DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound"

             Width="1094px" CellPadding="4" > 

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

             <Columns>

                    <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False"

                           ReadOnly="True" SortExpression="seq">

                    <ItemStyle HorizontalAlign="Center" Width="50px" />

                    </asp:BoundField>

                    <asp:HyperLinkField DataNavigateUrlFields="seq"

                           DataNavigateUrlFormatString="View.aspx?seq={0}" DataTextField="title"

                           HeaderText="제목">

                    <ItemStyle Width="340px" />

                    </asp:HyperLinkField>

                    <asp:BoundField DataField="Debate_id" HeaderText="작성자" SortExpression="Debate_id">

                    <ItemStyle HorizontalAlign="Center" Width="80px" />

                    </asp:BoundField>

                    <asp:BoundField DataField="PostDate" DataFormatString="{0:yyyy-MM-dd}"

                           HeaderText="작성일" SortExpression="PostDate">

                    <ItemStyle HorizontalAlign="Center" Width="80px" />

                    </asp:BoundField>

                    <asp:BoundField DataField="readCount" HeaderText="조회"

                           SortExpression="readCount">

                    <ItemStyle HorizontalAlign="Center" Width="50px" />

                    </asp:BoundField>

             </Columns>







                <EditRowStyle BackColor="#999999" />







                <EmptyDataTemplate>
                    <strong>
                    <br />
                    현재 진행 중인 토론이 없습니다.<br />
                    <br />
                    </strong>
                </EmptyDataTemplate>






                
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

       </asp:GridView>
     

            </span>

                            </td>
                        </tr>
                        </table>


       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [Debate_board] ORDER BY [seq] DESC"></asp:SqlDataSource>

    </div>
    <br />
    <br />
     
        
    </div>

</asp:Content>

