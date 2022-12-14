using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;

public partial class Del : System.Web.UI.Page
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



        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["seq"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();

        }
        else
        {
            lblNum.Text = Request.QueryString["seq"];

        }




    }



     
     
    protected void Button2_Click(object sender, EventArgs e)
    {
        //삭제하기

        //1. 암호가 일치?

        //2. 삭제 or 취소

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;

        cmd.CommandText = "select count(*) from Academy where seq=@seq";

        cmd.Parameters.Add("@seq", SqlDbType.Int);

        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];




        con.Open();

        int result = (int)cmd.ExecuteScalar();





        string script = "";



        if (result == 1)

        {

            //암호가 일치하기 때문에.. 게시물 Delete

            cmd.CommandText = @"delete from Academy

                                              where seq=@seq";



            cmd.ExecuteNonQuery();//delete



            script = @"<script type='text/javascript'>

                                        alert('삭제 완료!!');

                                        location.href='List.aspx';

                                    </script>";

        }

        else

        {

            script = @"<script type='text/javascript'>

                                        alert('암호가 일치하지 않습니다!!');

                                    </script>";

        }



        con.Close();



        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //리스트로 돌아가기
        
        Response.Redirect("/Book_Academy/View.aspx?seq=" + Request.QueryString["seq"]);


    }
}