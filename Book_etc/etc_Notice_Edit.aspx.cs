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
        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["num"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();

        }
        else
        {
            
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
         


        if (!IsPostBack)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from Notice where Num = @Num";

            cmd.Parameters.Add("@Num", SqlDbType.Int);
            cmd.Parameters["@Num"].Value = Request.QueryString["Num"];


            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                //출력 
                TextBoxTitle.Text = reader["Title"].ToString();

                //글내용
                TextBoxContent.Text = reader["content"].ToString();

            }



            reader.Close();

            con.Close();

        }
    }

    

    protected void bnt_back_Click(object sender, EventArgs e)
    {
        //목록으로
        Response.Redirect("/Book_etc/etc_Notice_View.aspx?Num=" + Request.QueryString["Num"]);

    }



    protected void bnt_Write_Click(object sender, EventArgs e)
    {
        //수정하기


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(*) from Notice where Num = @Num";



        cmd.Parameters.Add("@Num", SqlDbType.Int); 
        cmd.Parameters["@Num"].Value = Request.QueryString["Num"]; 



        con.Open();

        int result = (int)cmd.ExecuteScalar();





        string script = "";



        if (result == 1)

        {

            //암호가 일치하기 때문에.. 게시물 Update

            cmd.CommandText = @"update Notice set
                                                     Title = @Title,

                                                     Content = @Content,

                                                     PostDate = GetDate()

                                              where Num = @Num";



            //매개변수

            cmd.Parameters.Add("@id", SqlDbType.NVarChar, 20);

            cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 100);

            cmd.Parameters.Add("@content", SqlDbType.NVarChar, 3000);
             



            //값

            cmd.Parameters["@id"].Value = this.Page.User.Identity.Name.ToString();

            cmd.Parameters["@Title"].Value = TextBoxTitle.Text;

            cmd.Parameters["@content"].Value = TextBoxContent.Text;
             


            cmd.ExecuteNonQuery();//update



            script = @"<script type='text/javascript'>

                                        alert('수정 완료!!');

                                        location.href='/Book_etc/etc_Notice.aspx';

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



}