using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections;

public partial class View : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



    protected void Page_Load(object sender, EventArgs e)
    {

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (!Page.IsPostBack)
        {
            BindPages(1);

        }



        Panel_co_notice.Visible = false;



        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();



        }



        //넘겨져 온 쿼리 스트링 검사 
        if (String.IsNullOrEmpty(Request["seq"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();
        }




        //댓글 알림창 숨기기
        lblText.Visible = false;



        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!IsPostBack)
        {


            //넘겨져온 번호에 해당하는 글 출력
            Display();


            //seq 상세보기
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            cmd.CommandText = "update Debate_board set readCount = readCount + 1 where seq=@seq;";


            cmd.Parameters.Add("@seq", SqlDbType.Int);
            cmd.Parameters["@seq"].Value = Request.QueryString["seq"];




            //쿠키 확인 작업
            if (Request.Cookies["read"] == null || Request.Cookies["read"].Value == "n")
            {
                cmd.ExecuteNonQuery();//조회수 증가
                Response.Cookies["read"].Value = "y";
            }


            cmd.CommandText = "select * from Debate_board where seq = @seq";

            SqlDataReader reader = cmd.ExecuteReader();


            // 본문내용 출력
            if (reader.Read())
            {//출력


                TextBox1.Text = reader["Debate_id"].ToString();
                LabelName.Text = string.Format("{0}", reader["Debate_id"].ToString());
                LabelSubject.Text = reader["Title"].ToString();



                //글 내용
                string content = reader["Content"].ToString();
                content = content.Replace("<script>", "&ltscript&gt").Replace("</script>", "&lt/script>");                //<script> 무조건 적용안함
                TextBox_Content.Text = content;


                LabelSeq.Text = reader["seq"].ToString();
                LabelReadCount.Text = reader["ReadCount"].ToString();
                LabelRegDate.Text = reader["PostDate"].ToString();

                lbl_Term_start2.Text = reader["Term_start"].ToString();
                lbl_Term_end2.Text = reader["Term_end"].ToString();

            }



            reader.Close();

            con.Close();

        }


        TextBox1.Text = Page.User.Identity.Name;

    }// Page_Load




    //댓글열기
    protected void Button2_Click(object sender, EventArgs e)
    {

        Panel_comment.Visible = true;
        BindPages(Convert.ToInt32(lblPageTo.Text));

    }



    //댓글닫기
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel_comment.Visible = false;
    }



    //페이징 기능이 있는 댓글창
    private void BindPages(Int32 pageNo)
    {


        SqlCommand cmd2 = new SqlCommand("Paging_debate", con);
        cmd2.CommandType = CommandType.StoredProcedure;


        Int32 noOfRec, repCol;
        noOfRec = 10;  // 한 페이지 당 10개로 댓글 제한
        repCol = noOfRec;


        // 이 기능들은, 셀을 어떻게 배분하느냐를 결정 -> 한 줄당 셀개수를 지정 
        if (noOfRec <= 10)  // -> 
        {
            repCol = noOfRec;
        }



        DtlBooks.RepeatColumns = 1;
        // 원래 repCol <- 위에서 정의하다시피, repCol=noOfRec 이므로 20이 값인데.. 1로 바꿨다. 그래서 1줄당 1셀만 뜸


        cmd2.Parameters.Add("@pagenumber", SqlDbType.Int).Value = pageNo;
        cmd2.Parameters.Add("@pagesize", SqlDbType.Int).Value = noOfRec;   //위에서 미리 정의한대로 20개

        cmd2.Parameters.AddWithValue("@b_seq", LabelSeq.Text);



        SqlDataReader dr = cmd2.ExecuteReader();
        dr.Read();


        // 페이지 넘김 기능들
        Int32 tot = Convert.ToInt32(dr[0]);
        lblPageFrom.Text = pageNo.ToString();
        lblOf.Text = "of";
        Int32 a = Convert.ToInt32(tot / noOfRec);
        if (tot % noOfRec != 0)
        {
            a += 1;
        }

        lblPageTo.Text = a.ToString();


        if (dr.NextResult())
        {
            DtlBooks.DataSource = dr;
            DtlBooks.DataBind();
        }


        dr.Close();
        cmd2.Dispose();

        btnFirst.Enabled = true;
        btnPrev.Enabled = true;
        btnNext.Enabled = true;
        btnLast.Enabled = true;


        if (pageNo == 1)
        {
            btnFirst.Enabled = false;
            btnPrev.Enabled = false;
        }
        if (pageNo == Convert.ToInt32(lblPageTo.Text))
        {
            btnNext.Enabled = false;
            btnLast.Enabled = false;
        }


        Int32 i;
        ArrayList ar = new ArrayList();
        for (i = 1; i <= Convert.ToInt32(lblPageTo.Text); i++)
        {
            ar.Add(i.ToString());
            dtlpaging.RepeatDirection = RepeatDirection.Horizontal;   // 페이지 링크버튼
            dtlpaging.DataSource = ar;
            dtlpaging.DataBind();
        }

    }


    protected void btnFirst_Click(object sender, EventArgs e)
    {
        BindPages(1);
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        BindPages(Convert.ToInt32(lblPageFrom.Text) - 1);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        BindPages(Convert.ToInt32(lblPageFrom.Text) + 1);
    }
    protected void btnLast_Click(object sender, EventArgs e)
    {
        BindPages(Convert.ToInt32(lblPageTo.Text));
    }
    protected void dtlpaging_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPages(dtlpaging.SelectedIndex + 1);
    }
     

    //글 출력하기
    private void Display()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("View_DebateBoard", con);   //ViewBasic
        cmd.CommandType = CommandType.StoredProcedure;

        //파라미터 추가 : List.aspx에서 넘겨온 쿼리 스트링 값
        cmd.Parameters.AddWithValue("@seq", Request["seq"]);

        //상세보기 :DataReader 
        SqlDataReader dr = cmd.ExecuteReader();

        //바인딩 : 각각의 컨트롤
        while (dr.Read())
        {
            this.LabelSeq.Text = dr["seq"].ToString();


            this.LabelName.Text = dr["Debate_id"].ToString();
            this.LabelSubject.Text = dr["Title"].ToString();

            this.LabelRegDate.Text = dr["PostDate"].ToString();

            this.TextBox_Content.Text = dr["Content"].ToString();
            this.LabelReadCount.Text = dr["ReadCount"].ToString();

        }
        dr.Close();

        con.Close();
    }// 본문 바운드



    protected string GetnickName(object c_nickname)
    {
        string ss = c_nickname.ToString();
        return ss;
    }


    protected string GetContent(object c_content)
    {
        string ss = c_content.ToString();
        ss = ss.Replace("\n", "<br/>");
        return ss;
    }



    // bnt_modify 버튼. 수정하기
    protected void bnt_modify_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select Debate_id from Debate_board where seq = @seq";
        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];



        con.Open();

        string id = cmd.ExecuteScalar().ToString();
        string script = "";

        if (id == this.Page.User.Identity.Name)//글쓴이가 현재 로그인한 사람이냐??
        {
            Response.Redirect("/Book_Debate/Edit.aspx?seq=" + Request.QueryString["seq"]);
        }
        else
        {
            script = @"<script type='text/javascript'>

                                        alert('수정 권한이 없습니다.!!');

                                    </script>";
        }

        con.Close();


        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);

    }


    // bnt_delete 삭제버튼
    protected void bnt_delete_Click(object sender, EventArgs e)
    {
        
        //이 글의 작성자인지 확인하는 작업을 거친다.

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select Debate_id from Debate_board where seq=@seq";
        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];



        con.Open();

        string id = cmd.ExecuteScalar().ToString();
        string script = "";

        if (id == this.Page.User.Identity.Name) // 이 글의 작성자 == 현재 로그인한 아이디  =>맞다면?
        {
            Response.Redirect("/Book_Debate/Del.aspx?seq=" + Request.QueryString["seq"]);
        }
        else
        {
            
            script = @"<script type='text/javascript'>

                                         alert('삭제 권한이 없습니다.!!');


                                    </script>";

        }

        con.Close();


        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "del", script);

    }



    protected void bnt_list_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("/Book_Debate/List.aspx");

    }







    // 댓글 저장버튼
    protected void bnt_co_write_Click(object sender, EventArgs e)
    {

        // 댓글 저장버튼

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);


        //명령 
        string sql = "Insert into debate_paging(b_seq, c_nickname, c_content) Values (@b_seq, @c_nickname, @c_content)";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@b_seq", LabelSeq.Text);
        cmd.Parameters.AddWithValue("@c_nickname", TextBox1.Text);
        cmd.Parameters.AddWithValue("@c_content", TextBox3.Text);





        //실행
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();



        //DataList 새로고침
        DtlBooks.DataBind();
        TextBox3.Text = "";
        lblText.Visible = true;


        //댓글바인드
        BindPages(1);

        Panel_co_notice.Visible = true;
        
        lblText.Text = TextBox1.Text + "님의 댓글이 입력되었습니다." + " <br />" + TextBox3.Text + DateTime.Now.ToString("hh") + "시  " + DateTime.Now.ToString("mm") + "분  " + DateTime.Now.ToString("ss") + "초  ";
        //댓글이 달렸음을 알림. 댓글입력한 시간도 같이 출력




    }




    //댓글삭제
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //댓글삭제 기능
    }


    //데이터리스트에 아이템(셀)을 바운드(접근)가능한 조건
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            LinkButton btn = (LinkButton)e.Item.FindControl("LinkButton1");
            Label lbl = (Label)e.Item.FindControl("c_seq");


        }

    }


    protected void DtlBooks_DeleteCommand(object source, DataListCommandEventArgs e)
    {

        string ss = e.CommandArgument.ToString();
        //해당 아이디& 운영자인지 거르기


        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);


        //명령
        string sql = "select c_nickname from debate_paging where c_seq = @c_seq";  // 해당 사용자가 누군지 한번에 알아내기 가능
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@c_seq", ss);


        con.Open();



        string id = cmd.ExecuteScalar().ToString();


        if (id == this.Page.User.Identity.Name)  /// 현재 로그인 상태인 계정
        {


            string ss2 = e.CommandArgument.ToString();

            
            //명령
            string sql2 = "Delete from debate_paging where c_seq = @c_seq";
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            cmd2.Parameters.AddWithValue("@c_seq", ss2);


            //실행
            cmd2.ExecuteNonQuery();


            string script = null;

            script = @"<script type='text/javascript'>

                                        alert('댓글 삭제가 완료되었습니다.');

                                        history.go(-2);

                                    </script>";



            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "del", script);


            con.Close();


            // DataList 새로고침
            DtlBooks.DataBind();


            //댓글 데이타뷰 바운드
            BindPages(1);

        }
        else
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');</script>";
            Response.Write(script);
            Response.End();
        }


    }






}

