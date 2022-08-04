using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;

public partial class Book_Academy_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //비회원이 해당 주소를 알아내서 직접 접속했을때..
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();

        }

        
        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        


        //내용을 바인딩
        if (!IsPostBack)
        {

            //해당 아이디& 운영자인지 거르기
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            
             cmd.CommandText = "select name from Academy where seq = @seq"; //이 글의 작성자
            cmd.Parameters.Add("@seq", SqlDbType.Int);
            cmd.Parameters["@seq"].Value = Request.QueryString["seq"];  //list.aspx의 seq값을 받아서 글내용출력


            con.Open();



            
            //글쓴이만 글내용 보게 하기
            string id = cmd.ExecuteScalar().ToString();   //글작성자의 아이디
            if (id == this.Page.User.Identity.Name)  // 글작성자 = 지금 로그인중인아이디
            {
                
                Panel_view.Visible = true;
                Panel_answer.Visible = true;


                bnt_modify.Visible = true;
                bnt_del.Visible = true;
                bnt_reply.Visible = false;

                Panel_warning.Visible = false;

            }
            else if (this.Page.User.Identity.Name == "id11") //운영자도 보게하기
            {

                Panel_view.Visible = true;
                Panel_answer.Visible = true;


                bnt_modify.Visible = false;
                bnt_del.Visible = false;
                bnt_reply.Visible = true;


                bnt_reply.Visible = true;
                Panel_answer_bnt.Visible = true;
                Panel_warning.Visible = false;
            }
            else  //운영자와 글쓴이 빼고 모두
            {

                Panel_view.Visible = false;
                Panel_answer.Visible = false;

                Panel_view.Visible = false;
                Panel_answer.Visible = false;

                bnt_reply.Visible = false;
                Panel_answer_bnt.Visible = false;

                bnt_modify.Visible = false;
                bnt_del.Visible = false;
                bnt_reply.Visible = false;

                Panel_warning.Visible = true;
            }
             

            /////////////////////////////////////////////////////////////////////////////////////////////////////
            
            cmd.CommandText = "select count(*) from Academy2 where b_seq=@b_seq";    



            cmd.Parameters.Add("@b_seq", SqlDbType.Int); 
            cmd.Parameters["@b_seq"].Value = Request.QueryString["seq"];

             
            int result = (int)cmd.ExecuteScalar();

           // string script = "";

            if (result == 1)
            {

                // 데이터가 존재한다!!! 그러므로....
                Panel_answer.Visible = true;  //판넬을 보여준다.
                bnt_reply.Visible = false;  // 답변하기 버튼을 삭제
                Panel_answer_error.Visible = false;  //답변달렸음을 안내하는 창 끄기 

                bnt_reply.Visible = false;
            }
            else
            {
                Panel_answer.Visible = false;
                bnt_reply.Visible = true;  // 답변하기 버튼을 보여준다
                Panel_answer_error.Visible = true;

                bnt_reply.Visible = true;
            }



            //////////////////////////내용 바인드


            cmd.CommandText = "update Academy set readCount = readCount + 1 where seq=@seq;";


                //쿠키 확인 작업
                if (Request.Cookies["read"] == null || Request.Cookies["read"].Value == "n")
                {

                    cmd.ExecuteNonQuery();//조회수 증가
                    Response.Cookies["read"].Value = "y";

                }

                ////////////////////////////////////////////////////////////////////////////////////////////////////////

                cmd.CommandText = "select * from Academy where seq=@seq";



                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {

                //출력
                LabelName.Text = string.Format("{0}", reader["name"].ToString());

                LabelSubject.Text = reader["subject"].ToString();
                    LabelGenre.Text = reader["Genre"].ToString();  //논술 분야/분류


                    //글내용
                    string content = reader["content"].ToString();
                txt_Content.Text = content;

                    LabelSeq.Text = reader["seq"].ToString();
                    LabelReadCount.Text = reader["readCount"].ToString();
                    LabelRegDate.Text = reader["regDate"].ToString();

            }



            reader.Close();

            con.Close();
            

            //답변바인드
            databian();



        }

    }

    
    //답변 바인드
    private void databian()
    {

        //b_seq랑(아카데미2)  seq(아카데미1)이랑 값이 같음
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();  
        cmd.Connection = con;

        con.Open();
        

        cmd.CommandText = "select * from academy2 where b_seq = @b_seq;";  // 답변글 바인드하는 seq2

        
        // 질문글번호 seq == 답변글번호 b_seq는 같다
        cmd.Parameters.AddWithValue("@b_seq", Request["seq"]); 


        //상세보기 :DataReader 
        SqlDataReader dr = cmd.ExecuteReader();


        //바인딩 : 각각의 컨트롤
        while (dr.Read())
        {


            //답변 라벨들
            lbl_seq2.Text = dr["seq2"].ToString();  // 답변자 등록번호
            lbl_b_seq.Text = dr["b_seq"].ToString();  // 답변자 등록번호
            lbl_answer.Text = dr["name2"].ToString();  // 답변자
            lbl_anRegdate.Text = dr["regdate2"].ToString();
            lbl_Title.Text = dr["subject2"].ToString();
            lbl_Genre.Text = dr["genre2"].ToString();


            //글내용
            string content2 = dr["content2"].ToString();
            txt_anContent.Text = content2;


        }


        dr.Close();


        con.Close();



    }

    


    protected void Button1_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("List.aspx");
    }


    //수정
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select name from Academy where seq = @seq";
        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();

        
        if (id == this.Page.User.Identity.Name)
        {
            Response.Redirect("Edit.aspx?seq=" + Request.QueryString["seq"]);
        }
        else
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Book_Academy/List.aspx';</script>";
            Response.Write(script);
            Response.End();
        }

    }


    //삭제
    protected void Button3_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select name from Academy where seq = @seq";
        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();

        
        if (id == this.Page.User.Identity.Name)
        {
            Response.Redirect("Del.aspx?seq=" + Request.QueryString["seq"]);
        }
        else
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Book_Academy/List.aspx';</script>";
            Response.Write(script);
            Response.End();
        }


        

    }



    protected void Button4_Click(object sender, EventArgs e)
    {

        //답변하기

        if(this.Page.User.Identity.Name == "id11")
        {


            Response.Redirect("/Book_Academy/Add2.aspx?seq=" + Request.QueryString["seq"]);


        }
        else
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');history.go(-1);</script>";
            Response.Write(script);
            Response.End();
        }



    }



    //답변 수정하기
    protected void bnt_answer_modify_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Book_Academy/Edit2.aspx?b_seq=" + Request.QueryString["seq"]);
        

    }





}