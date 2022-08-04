<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_SmartEdu.master" AutoEventWireup="true" CodeFile="~/Book_HappyCampus/HappyCampus.aspx.cs" Inherits="Book_HappyCampus_HappyCampus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
            
        .auto-style27 {
            font-size: large;
        }
        
            


        .auto-style29 {
            margin-bottom: 0px;
        }
        
        
                    
        .auto-style25 {
            border-style: groove;
width: 1296px;
            text-align: center;
            margin: 0px auto;
            background-color: white;
            border-color:inherit;
            border-width:2px;
        }
        
        
                
        
        .auto-style41 {
            text-align: justify;
            margin-right: 30px;
            margin-left: 30px;
        }
        
    


        .auto-style40 {
            width: 138px;
            text-align: left;
        }
        
    


        .auto-style42 {
            font-size: 10pt;
        }
        
    


        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="width:1300px; margin-left:550px; background-color:white; ">
    




    <asp:Image ID="Image3" runat="server" Height="140px" Width="1296px" ImageUrl="~/CSS_pic/자료나눔_메뉴.jpg" CssClass="auto-style29" />
        <br />







    <div class="auto-style25">

        <br />
        <div id="page" class="auto-style41">

        <span>


     
            <span class="auto-style27">
        <fieldset class="auto-style42">
                    <legend class="auto-style40">&nbsp; ※ 알림 사항</legend>

     
                    <br />

                    &nbsp; *&nbsp; 
                    독후감을 쓰거나, 에세이, 보고서에 관련된 자료를 업로드하고 다운로드하는 곳입니다.
            <asp:Label ID="lbl_cnt" runat="server" Text="Label" Visible="False"></asp:Label>
            <br /> &nbsp; *&nbsp; 여러분의 학습에 도움이 되길 바랍니다.<br />

                    <br />
                    </fieldset><br />
            </span>


     
            </span>
            
        <br />
                <div class="auto-style8" style="text-align: justify">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
             AutoGenerateColumns="False" DataKeyNames="seq" DataSourceID="SqlDataSource1"
                CellPadding="1" ForeColor="#333333" GridLines="None"
             onrowdatabound="GridView1_RowDataBound"  Width="1232px"  Height="50px">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>

                    <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False"

                           ReadOnly="True" SortExpression="seq">

                    <ItemStyle HorizontalAlign="Center" Width="50px" />

                    </asp:BoundField>

                    <asp:HyperLinkField DataNavigateUrlFields="seq"

                           DataNavigateUrlFormatString="Happy_view.aspx?seq={0}" DataTextField="subject"

                           HeaderText="제목">

                    <ItemStyle Width="330px" />

                    </asp:HyperLinkField>

                    <asp:BoundField DataField="id" HeaderText="이름" SortExpression="id">

                    <ItemStyle HorizontalAlign="Center" Width="80px" />

                    </asp:BoundField>

                    <asp:BoundField DataField="regDate" DataFormatString="{0:yyyy-MM-dd}"

                           HeaderText="날짜" SortExpression="regDate">

                    <ItemStyle HorizontalAlign="Center" Width="80px" />

                    </asp:BoundField>

                    <asp:BoundField DataField="readCount" HeaderText="읽음"

                           SortExpression="readCount">

                    <ItemStyle HorizontalAlign="Center" Width="50px" />

                    </asp:BoundField>

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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"

             ConnectionString="<%$ ConnectionStrings:conStr %>"

             SelectCommand="SELECT [seq], [id], [subject], [readCount], [regDate], [fileName], [downloadCount] FROM [happy] ORDER BY [regDate] DESC">

       </asp:SqlDataSource>

                    <br />
                    <br />
                    <br />
            <asp:Button ID="Button2" runat="server" CssClass="button-style44" OnClick="Button2_Click" Text="자료 나눠주기" />
           
                </div>
        <br />



    </div><br />

        </div>
        <br />







        <br />







    <div class="auto-style25">

        <br />



            내 현황 보러가기 (업로드한 파일 내역 목록)<br __designer:mapid="36c" />
            <br __designer:mapid="36d" />
            <asp:Button ID="bnt_mypage" runat="server" CssClass="button-style44" OnClick="bnt_mypage_Click" Text="내 정보 보기" />



            <br />



            <br />

        </div>
        <br />
        <br />
        <br />
        <br />
    <br />
    <br />
    <br />
     
        
    </div>
       <br />
    <br />

    <br />
    <br />
    <br />
    <br />
        <br />
        <br />
    <br />
    <br />
    <br />
    <br />
    </asp:Content>

