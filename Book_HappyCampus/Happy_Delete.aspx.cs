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

public partial class Book_HappyCampus_Happy_del : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["seq"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();
        }
        else
        {
            //레이블에 넘겨져 온 번호 값 출력 
            this.lblNum.Text = Request["seq"];
        }

        //비회원이 해당 주소를 알아내서 직접 접속했을때.
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }


        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


    }



    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //삭제하기

        //1. 암호가 일치?

        //2. 삭제 or 취소

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;

        cmd.CommandText = "select count(*) from happy where seq=@seq";


        cmd.Parameters.Add("@seq", SqlDbType.Int);


        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];




        con.Open();

        int result = (int)cmd.ExecuteScalar();





        string script = "";



        if (result == 1)

        {

            //암호가 일치하기 때문에.. 게시물 Delete

            cmd.CommandText = @"delete from happy

                                              where seq=@seq";



            cmd.ExecuteNonQuery();//delete



            script = @"<script type='text/javascript'>

                                        alert('삭제 완료!!');

                                        location.href='/Book_HappyCampus/HappyCampus.aspx';

                                    </script>";

        }

        else

        {

            script = @"<script type='text/javascript'>

                                        alert('암호가 일치하지 않습니다!!');

                                    </script>";

        }



        con.Close();



        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "del", script);

    }



    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //취소버튼 클릭시 뒤로(상세 보기 페이지로 이동)
        Response.Redirect("Happy_view.aspx?seq=" + Request["seq"]);


    }



}