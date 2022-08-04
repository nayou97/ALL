using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;


public partial class _Book_Academy_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        //비회원이 해당 주소를 알아내서 직접 접속했을때..
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();
        }

         

        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";



        TextBoxName.Text = this.Page.User.Identity.Name.ToString();

        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["seq"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();

        }
        else
        {
            lbl_b_seq.Text = Request.QueryString["seq"];    // 답변을 달 질문 글 번호를 출력 
             DisplayData(); //장르 출력
        }



    }
     
    //장르 출력
    private void DisplayData()
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;


        cmd.CommandText = "select * from academy where seq = @seq";
     
        //파라미터 추가 : List.aspx에서 넘겨온 쿼리 스트링 값
        cmd.Parameters.AddWithValue("@seq", Request["seq"]);


        con.Open();



        //상세보기 :DataReader 
        SqlDataReader dr = cmd.ExecuteReader();

        //바인딩 : 각각의 컨트롤
        while (dr.Read())
        {
            
            this.TextBoxGenre.Text = dr["genre"].ToString();
          

        }

        dr.Close();
        con.Close();

         

    }


     



    protected void Button2_Click(object sender, EventArgs e)
    {
        //Write


        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into Academy2 (b_seq, name2, subject2, content2, genre2) " +
            "values (@b_seq, @name2, @subject2, @content2, @genre2)";



        //매개변수
        cmd.Parameters.Add("@b_seq", SqlDbType.Int);

        cmd.Parameters.Add("@genre2", SqlDbType.NVarChar, 20);

        cmd.Parameters.Add("@name2", SqlDbType.NVarChar, 20);

        cmd.Parameters.Add("@subject2", SqlDbType.NVarChar, 100);
         
        cmd.Parameters.Add("@content2", SqlDbType.NVarChar, 3000);



        //값
        cmd.Parameters["@b_seq"].Value = lbl_b_seq.Text;

        cmd.Parameters["@genre2"].Value = TextBoxGenre.Text;

        cmd.Parameters["@name2"].Value = TextBoxName.Text;

        cmd.Parameters["@subject2"].Value = TextBoxSubject.Text;
        
        cmd.Parameters["@content2"].Value = TextBoxContent.Text;


        con.Open();
        


        //여기서부턴 있는 그대로
        cmd.ExecuteNonQuery();

        con.Close();



        string script = @"<script type='text/javascript'>

                                              alert('글쓰기 완료!!');

                                              location.href = 'List.aspx';

                                          </script>";

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
        
    }
     
}