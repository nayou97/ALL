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


        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }


        Label myLbl = (Label)Master.FindControl("Label3");  
        myLbl.Text = User.Identity.Name + "님 환영합니다.";

         


        if (!IsPostBack)

        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;

            cmd.CommandText = "select * from Debate_board where seq=@seq";



            cmd.Parameters.Add("@seq", SqlDbType.Int);

            cmd.Parameters["@seq"].Value = Request.QueryString["seq"];



            con.Open();



            SqlDataReader reader = cmd.ExecuteReader();



            if (reader.Read())

            {

                //출력

                TextBoxSubject.Text = reader["Title"].ToString();

                //글내용

                TextBoxContent.Text = reader["Content"].ToString();

                

            }



            reader.Close();

            con.Close();

        }
    }


    
    
    //글쓰기
    protected void bnt_submit_Click(object sender, EventArgs e)
    {

        //수정하기

        //1. 암호가 일치?

        //2. 수정 or 취소

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;

        cmd.CommandText = "select Debate_id from Debate_board where seq=@seq";



        cmd.Parameters.Add("@seq", SqlDbType.Int);



        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];





        con.Open();

        string id = cmd.ExecuteScalar().ToString();



        string script = "";



        //글쓴이가 현재 로그인한 사람이냐??

        if (id == this.Page.User.Identity.Name)

        {

            //암호가 일치하기 때문에.. 게시물 Update

            cmd.CommandText = @"update Debate_board set

                                                     Title=@Title,

                                                     Content=@Content,

                                                    Term_start =@Term_start,

                                                    Term_end =@Term_end,

                                                     PostDate=GetDate()

                                              where seq=@seq";


            //매개변수

            cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 150);

            cmd.Parameters.Add("@Content", SqlDbType.NVarChar, 3000);

            cmd.Parameters.Add("@Term_start", SqlDbType.NVarChar, 30);

            cmd.Parameters.Add("@Term_end", SqlDbType.NVarChar, 30);


            //값



            cmd.Parameters["@Title"].Value = TextBoxSubject.Text;

            cmd.Parameters["@Content"].Value = TextBoxContent.Text;

            cmd.Parameters["@Term_start"].Value = txtDOB_start.Text;

            cmd.Parameters["@Term_end"].Value = txtDOB_end.Text;


            cmd.ExecuteNonQuery();//update



            script = @"<script type='text/javascript'>

                                        alert('수정 완료!!');

                                        location.href='List.aspx';

                                    </script>";

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





    protected void cdrCalendar_start_SelectionChanged(object sender, EventArgs e)
    {

        DateTime dt = cdrCalendar_start.SelectedDate;
        txtDOB_start.Text = dt.ToString("yyyy/MM/dd");

    }



    protected void cdrCalendar_end_SelectionChanged(object sender, EventArgs e)
    {
        
        DateTime dt = cdrCalendar_end.SelectedDate;
        txtDOB_end.Text = dt.ToString("yyyy/MM/dd");

    }

} 