using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;

using System.IO;
using System.Net;




public partial class Book_HappyCampus_Happy_sell : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }


        if (!IsPostBack)

        {
             
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;

            cmd.CommandText = "UPDATE happy SET readCount = readCount + 1 WHERE seq=@seq;";



            //같은 번호이기 때문에 파라메터 하나만 던져도 가능하다.

            cmd.Parameters.Add("@seq", SqlDbType.Int);

            cmd.Parameters["@seq"].Value = Request.QueryString["seq"];



            con.Open();



            if (Request.Cookies["read"] == null || Request.Cookies["read"].Value == "n")

            {

                //조회수 증가

                cmd.ExecuteNonQuery();

                Response.Cookies["read"].Value = "y";

            }





            cmd.CommandText = "select * from happy where seq=@seq";





            //결과값으로 처리용도지만 ExecuteNonQuery 용도로도 사용할수는 있다.

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())

            {

                //출력

                LabelName.Text = string.Format("{0}", reader["id"].ToString());


                LabelTitle.Text = reader["subject"].ToString();



                 

                //글 내용

                string content = reader["content"].ToString();
                TextBox_Content.Text = content;


                LabelSeq.Text = reader["seq"].ToString();
                LabelReadCount.Text = reader["readCount"].ToString();
                LabelDate.Text = reader["regDate"].ToString();
                 


            }



            //첨부파일 처리

            if (reader["fileName"].ToString() != "")
            {

                LabelFile.Text = string.Format("<a href='Download.aspx?seq={2}&file={0}'>{0}</a> [다운로드횟수:{1}회]", reader["fileName"].ToString(), reader["downloadCount"].ToString(), Request.QueryString["seq"], Request.QueryString["id"], Request.QueryString["subject"], Request.QueryString["filename"], Request.QueryString["filePath"]);

            }



            else

            {

                LabelFile.Text = "첨부파일 없음";

            }



            reader.Close();

            con.Close();

        }


    }
    



    protected void btn_list_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("HappyCampus.aspx");
    }



    protected void bnt_del_Click(object sender, EventArgs e)
    {
        //삭제 Del.aspx?seq=5


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select id from Happy where seq = @seq";
        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();


        // 북토론/에디트.aspx.cs 동일한 패턴 
        if (id == this.Page.User.Identity.Name)
        {
            Response.Redirect("Happy_Delete.aspx?seq=" + Request.QueryString["seq"]);
        }
        else
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');history.go(-1);</script>";
            Response.Write(script);
            Response.End();
        }



    }



    protected void bnt_modify_Click(object sender, EventArgs e)
    {
        //수정


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select id from Happy where seq = @seq";
        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();


        // 북토론/에디트.aspx.cs 동일한 패턴 
        if (id == this.Page.User.Identity.Name)
        {
            Response.Redirect("Happy_Edit.aspx?seq=" + Request.QueryString["seq"]);
        }
        else
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');history.go(-1);</script>";
            Response.Write(script);
            Response.End();
        }


    }



}