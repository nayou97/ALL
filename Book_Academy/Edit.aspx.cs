using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;

public partial class Edit : System.Web.UI.Page
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



        lbl_b_seq.Text = Request.QueryString["seq"];



        if (!IsPostBack)

        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;

            cmd.CommandText = "select * from Academy where seq=@seq";



            cmd.Parameters.Add("@seq", SqlDbType.Int);

            cmd.Parameters["@seq"].Value = Request.QueryString["seq"];



            con.Open();



            SqlDataReader reader = cmd.ExecuteReader();



            if (reader.Read())

            {

                //출력


                TextBoxSubject.Text = reader["subject"].ToString(); //제목

                TextBoxGenre_be.Text = reader["Genre"].ToString(); //장르

                TextBoxContent.Text = reader["content"].ToString();  //글내용


            }



            reader.Close();

            con.Close();

        }
    }




     


    protected void Button2_Click(object sender, EventArgs e)
    {
        //수정하기

        //1. 암호가 일치?

        //2. 수정 or 취소

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

            //암호가 일치하기 때문에.. 게시물 Update

            cmd.CommandText = @"update Academy set

                                                     name=@name,

                                                     genre=@genre,

                                                     subject=@subject,

                                                     content=@content,

                                                     regDate=getdate()

                                              where seq=@seq";



            //매개변수

            cmd.Parameters.Add("@name", SqlDbType.NVarChar, 20);

            cmd.Parameters.Add("@genre", SqlDbType.VarChar, 20);

            cmd.Parameters.Add("@subject", SqlDbType.NVarChar, 100);

            cmd.Parameters.Add("@content", SqlDbType.NVarChar, 3000);



            //값

            cmd.Parameters["@name"].Value = this.User.Identity.Name;

            cmd.Parameters["@genre"].Value = TextBoxGenre_af.Text;

            cmd.Parameters["@subject"].Value = TextBoxSubject.Text;

            cmd.Parameters["@content"].Value = TextBoxContent.Text;



            cmd.ExecuteNonQuery();//update



            script = @"<script type='text/javascript'>

                                        alert('수정 완료!!');

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




    //장르를 바꾸고 싶다.
    protected void rd_genre_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBoxGenre_af.Text = rd_genre.SelectedValue.Trim();
    }



}