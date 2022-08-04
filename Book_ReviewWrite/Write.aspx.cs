using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Basic_Write : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        //txtTitle 텍스트박스에 포커스 
        Page.SetFocus("txtTitle");


        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();

        }

        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";





        //글번호 자동 카운트
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;




        //id가 뭔지 입력하기
        cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


    }


    //저장버튼
    protected void btnWrite_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Write_BookWrite", con);
        cmd.CommandType = CommandType.StoredProcedure;



        try
        {


            cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);

            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@BookName", txtBookName.Text);

            cmd.Parameters.AddWithValue("@Genre", ddlGenre.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);

            cmd.Parameters.AddWithValue("@ReviewStar", ddlReviewStar.SelectedValue); 
            cmd.Parameters.AddWithValue("@Content", txtContent.Text);
            


            con.Open();
            cmd.ExecuteNonQuery(); //실행
            con.Close();


        string script = @"<script type='text/javascript'>

                                              alert('글쓰기 완료!!');

                                              location.href = '/Book_ReviewWrite/List.aspx';

                                          </script>";

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
    

        }
        catch (Exception ex)
        {
            
            string script = @"<script type='text/javascript'>

                                              alert('독후감을 작성할 수 없습니다!');

                                          </script>";

            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
        }




    }
    protected void btnList_Click(object sender, EventArgs e)
    {
        //리스트 페이지로 이동 
        Response.Redirect("/Book_ReviewWrite/List.aspx");
    }



}
