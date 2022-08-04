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


    } 

     


    protected void Button2_Click(object sender, EventArgs e)
    {
        //Write


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into Academy (name, subject, Genre, content) " +
            "values (@name, @subject, @Genre, @content)";



        //매개변수
        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 20);

        cmd.Parameters.Add("@subject", SqlDbType.NVarChar, 100);

        cmd.Parameters.Add("@Genre", SqlDbType.VarChar, 50);

        cmd.Parameters.Add("@content", SqlDbType.NVarChar, 3000);


        //값

        cmd.Parameters["@name"].Value = this.Page.User.Identity.Name;

        cmd.Parameters["@subject"].Value = TextBoxSubject.Text;

        cmd.Parameters["@Genre"].Value = TextBoxGenre.Text;

        cmd.Parameters["@content"].Value = TextBoxContent.Text;


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



    // 장르 바뀔때마다
    protected void rd_genre_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBoxGenre.Text = rd_genre.SelectedValue.Trim();
    }
}