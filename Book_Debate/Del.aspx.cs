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

        if (!this.Page.User.Identity.IsAuthenticated)
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();
        }


        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";

    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        string script = null;

        script = @"<script type='text/javascript'>

                                        history.go(-2);

                                    </script>";



        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);
    }



    protected void Button4_Click(object sender, EventArgs e)
    {

        //삭제하기

        //1. 암호가 일치?
        //2. 삭제 or 취소
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select Debate_id from Debate_board where seq=@seq";

        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();
        string script = "";


        if (id == this.Page.User.Identity.Name)
        {

            //암호가 일치하기 때문에.. 게시물 Delete
            cmd.CommandText = @"delete from Debate_board

                                              where seq=@seq";

           

            cmd.ExecuteNonQuery();//delete
            


            script = @"<script type='text/javascript'>

                                        alert('삭제 완료!!');

                                        location.href='List.aspx';

                                    </script>";


            ///////////////////////////////////////////////////////////////////
            ///댓글 지우기 시작!
            

            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandText = "delete from debate_paging";


            cmd2.ExecuteNonQuery(); // 본문 글이 삭제될 때마다 댓글전부 삭제

        }

        else

        {

            script = @"<script type='text/javascript'>

                                        alert('삭제 권한이 없습니다.!!');

                                    </script>";

        }

       
        con.Close();


        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);



    }



}