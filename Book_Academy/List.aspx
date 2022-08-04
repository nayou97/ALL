<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Book_Academy_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
           
                    
        .auto-style25 {
            border-style: groove;
            width: 1266px;
            text-align: justify;
            margin: 0px auto;
            padding:20px;
            background-color: white;
            border-color:inherit;
            border-width:2px;
        }
        
         
        .auto-style27 {
            font-size: large;
        }
        
        .auto-style28 {
            text-align: center;
            margin: 0px auto;
            background-color: white;
            font-size: 10pt;
        }
        
            


        .auto-style38 {
            width: 1185px;
            margin: 0px auto;
            text-align: right;
        }
                
    


        .auto-style40 {
            width: 138px;
        }
        
    

        

        .auto-style41 {
            text-align: justify;
            margin-right: 30px;
            margin-left: 30px;
        }
        
        .auto-style42 {
            display: inline-block;
            padding: 10px 20px;
            background: #D6CEAA;
            border-radius: 5px;
            box-shadow: 0px 0px 0px 5px rgba(255,255,255,0.1);
            border: 1px solid #706C53;
            line-height: normal;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            text-shadow: 0px 1px 0px rgba(0,0,0,.2);
            font-size: 10pt;
            font-weight: 400;
            color: #FFF;
            font-weight: bold;
        }
        
    


        .auto-style43 {
            font-size: 10pt;
        }
        .auto-style44 {
            text-align: center;
            width: 1203px;
        }
        
    


        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="width:1300px; margin-left:550px; background-color:white;  ">





    <asp:Image ID="Image2" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/1대1논술교실_메뉴.jpg" />

        <span>


     
            <span class="auto-style27">
        <br />







    <div class="auto-style25">

        <div id="page" class="auto-style41">

        <fieldset class="auto-style43">
                    <legend class="auto-style40">&nbsp; ※ 알림 사항</legend>

     
                    <br />

                    &nbsp; *&nbsp; 글 작성자 혹은 담당자가 아니면 글 내용을 조회할 수 없습니다.<br __designer:mapid="106" /> &nbsp; *&nbsp; 답변은 논술선생님만 작성 가능합니다.<br />
                    <br />
                    </fieldset></span><br />
            <span class="auto-style27">
            <br />
                <div class="auto-style44">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"

        AllowPaging="True"

             CssClass="auto-style28"

             DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound"

             Width="1199px" Height="25px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">



             <HeaderStyle BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" BorderColor="White" BackColor="BurlyWood" />




       
             <Columns>

                    <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False"

                           ReadOnly="True" SortExpression="seq">

                    </asp:BoundField>

                    <asp:HyperLinkField DataNavigateUrlFields="seq" DataNavigateUrlFormatString="View.aspx?seq={0}" DataTextField="subject" HeaderText="제목" SortExpression="subject" />




                    <asp:BoundField DataField="genre"

                           HeaderText="분야" SortExpression="genre">

                    </asp:BoundField>



                 <asp:BoundField DataField="name" HeaderText="작성자" SortExpression="name">

                    </asp:BoundField>




                    <asp:BoundField DataField="regdate" HeaderText="작성일"

                           SortExpression="regdate">

                    </asp:BoundField>

             </Columns>


            <FooterStyle BackColor="Gainsboro" ForeColor="Black" />
            <HeaderStyle BackColor="Gainsboro" ForeColor="Black" />
            <PagerStyle BackColor="Gainsboro" ForeColor="black" HorizontalAlign="center" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />

       </asp:GridView>


     
                </div>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server"

             ConnectionString="<%$ ConnectionStrings:conStr %>"

             SelectCommand="SELECT [seq], [subject], [name], [genre], [regdate] FROM [Academy] ORDER BY [seq] desc">

       </asp:SqlDataSource>

            <div id="banner" class="auto-style38">  



            <asp:Button ID="Button1" runat="server" CssClass="auto-style42" OnClick="Button1_Click" Text="글 작성하기" />

            </div>
        <br />

    </div>

        <br />

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
            </span>


     
            </span>
    <br />
     
        
    </div>
    <br />
    </asp:Content>

