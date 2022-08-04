<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Members.master" AutoEventWireup="true" CodeFile="List_lastList.aspx.cs" Inherits="List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/6/default_6.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
        .auto-style27 {
            font-size: large;
        }
         

         
        .auto-style42 {
            font-size: small;
            padding-left:20px;
        }


        .auto-style39 {
            width: 100%;
            height: 169px;
        }
        
    
            
        .auto-style59 {
            background-color: #B4E2EA;
            height: 50px;
        }
        .auto-style60 {
            height: 50px;
        }
                
    
        .auto-style41 {
            height: 38px;
        }
        
    
        .auto-style61 {
            font-size: small;
            padding-left: 20px;
            height: 50px;
        }


                 

         
        .auto-style51 {
            height: 836px;
            width: 1176px;
        }
        
         

        
        

        .auto-style52 {}
        
         

        
        

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="width:1300px; margin-left:550px; background-color:white; ">

    

    <asp:Image ID="Image2" runat="server" Height="150px" Width="1300px" ImageUrl="~/CSS_pic/토론방_메뉴.jpg" />

    

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
            
            
     
    
    

    
                    <asp:Button ID="bnt_Gomain" runat="server" CssClass="button-style33" OnClick="bnt_Gomain_Click" Text="메인으로" />
                    <br />
        <br />
            
            
     
    
    

    
        <asp:Panel ID="Panel_view" runat="server" Height="890px" BorderStyle="Solid" BorderWidth="2px" BorderColor="Gainsboro" Width="1280px"> 
            <div class="auto-style51" style="margin:20px; border-style:solid; border-width:1px; padding:10px; padding-left:30px; padding-right:30px; margin-right:20px;">
                 
                <br />
                <div id="page" class="container">
                    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" style="text-align: justify; font-size: small;" Width="1168px">
                        <EmptyDataTemplate>
                            <br />
                            * 기부하신 데이터가 없습니다!
                            <br />
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <table border="0" class="auto-style39">
                                <tr>
                                    <td class="auto-style59" colspan="2" style="border-bottom:solid;"><span><strong>&nbsp;&nbsp;
                                        <asp:Label ID="lbl_Title2" runat="server" Text='<%# Eval("Title2") %>'></asp:Label>
                                        </strong></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style61" colspan="2" style="border-bottom:solid;"><strong><span>⊙ 등록번호
                                        <asp:Label ID="lbl_seq2" runat="server" Text='<%# Eval("seq2") %>'></asp:Label>
                                        &nbsp;</span></strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style42" style="border-bottom:solid;"><strong>⊙ 작성자</strong>&nbsp; <span>
                                        <asp:Label ID="lbl_Debate_id2" runat="server" CssClass="auto-style52" Text='<%# Eval("Debate_id2") %>'></asp:Label>
                                        </span></td>
                                    <td class="auto-style60" style="border-bottom:solid;"><strong>⊙ </strong><span><strong>주제 상정일</strong></span>&nbsp;<span><asp:Label ID="lbl_PostDate2" runat="server" Text='<%# Eval("PostDate2") %>'></asp:Label>
                                        </span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style42" style="border-bottom:solid;"><span><strong>⊙ 토론 시작일&nbsp; </strong>
                                        <asp:Label ID="lbl_Term_start2" runat="server" Text='<%# Eval("Term_start2") %>'></asp:Label>
                                        </span></td>
                                    <td class="auto-style60" style="border-bottom:solid;"><span><strong>⊙ 토론 종료일&nbsp; </strong>
                                        <asp:Label ID="lbl_Term_end2" runat="server" Text='<%# Eval("Term_end2") %>'></asp:Label>
                                        </span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style41" colspan="2" style="border-bottom:solid; padding:5px;"><span>
                                        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" CssClass="auto-style52" Height="300px" ReadOnly="True" Text='<%# Bind("Content2") %>' TextMode="MultiLine" Width="1150px"></asp:TextBox>
                                        </span></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [Debate_board2]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </asp:Panel>


     
    
    
    
     
    
    

        <br />
        <br />
        <br />

        
    </div>
    

</asp:Content>

