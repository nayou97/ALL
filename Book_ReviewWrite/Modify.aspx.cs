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

public partial class Basic_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["Num"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();
   
        }
        else
        {
            //반드시 수정페이지는 처음 로드시에만 이전 데이터 읽어오자 
            if (!Page.IsPostBack)
            {
                DisplayData();
            }
        }

        //비회원이 해당 주소를 알아내서 직접 접속했을때..
        if (!this.Page.User.Identity.IsAuthenticated)
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();

        }


        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";

    }



    private void DisplayData()
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        con.Open();

        SqlCommand cmd = new SqlCommand("View_BookWrite", con);
        cmd.CommandType = CommandType.StoredProcedure;



        //id값
        cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


        //파라미터 추가 : List.aspx에서 넘겨온 쿼리 스트링 값
        cmd.Parameters.AddWithValue("@Num", Request["Num"]);
        

        //상세보기 :DataReader 
        SqlDataReader dr = cmd.ExecuteReader();

        //바인딩 : 각각의 컨트롤
        while (dr.Read())
        {

            this.lblNum.Text = dr["Num"].ToString();
            this.txtTitle.Text = dr["Title"].ToString();
            this.txtBookName.Text = dr["BookName"].ToString();
            this.ddlGenre.SelectedValue = dr["Genre"].ToString();
            this.txtAuthor.Text = dr["Author"].ToString();
            this.txtContent.Text = dr["Content"].ToString();
            this.ddlReviewStar.SelectedValue = dr["ReviewStar"].ToString();
            
        }

        dr.Close();
        con.Close();        
        
    }



    //수정
    protected void btnWrite_Click(object sender, EventArgs e)
    {
        //Write.aspx 페이지와 동일한 패턴 
        if (IsPasswordCorrect())
        {
            

            SqlConnection objcon = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
            SqlCommand objCmd = new SqlCommand("Modify_BookWrite", objcon);   //ModifyBasic
            objCmd.CommandType = CommandType.StoredProcedure;

            objCmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            objCmd.Parameters.AddWithValue("@BookName", txtBookName.Text);
            objCmd.Parameters.AddWithValue("@Genre", ddlGenre.SelectedValue);
            objCmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
            
            objCmd.Parameters.AddWithValue("@Content", txtContent.Text);
            objCmd.Parameters.AddWithValue("@ReviewStar", ddlReviewStar.SelectedValue);

            objCmd.Parameters.AddWithValue("@Num", lblNum.Text); 
            objCmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);

             
            objcon.Open();
            objCmd.ExecuteNonQuery();
            objcon.Close();


            string script = @"<script type='text/javascript'>

                                              alert('독후감을 수정하셨습니다.');

                                              location.href = '/Book_ReviewWrite/List.aspx';

                                          </script>";

            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "modify", script);

             

        }
        else
        {

            string script = @"<script type='text/javascript'>

                                              alert('비밀번호가 틀립니다. \n 독후감을 수정하실 수 없습니다.');

                                          </script>";

            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "modify_error", script);

        }


    }




    private bool IsPasswordCorrect()
    {
        bool result = false;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * From BookWrite Where Num = @Num And id = @id", con);



        cmd.Parameters.AddWithValue("@Num", Request["Num"]);
        cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read()) //데이터가 읽혀진다면, 번호와 암호가 맞음 
        {
            result = true; //

        }
        return result;

    }


    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Book_ReviewWrite/View.aspx?Num=" + Request.QueryString["Num"]);
    }


}
