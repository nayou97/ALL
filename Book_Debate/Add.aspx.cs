using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;
public partial class Add : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        //비회원이 해당 주소를 알아내서 직접 접속했을때..
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();
        }


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



    protected void Button1_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("List.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //Write


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "insert into Debate_board(Debate_id, Title, Content, Term_start, Term_end) values (@Debate_id, @Title, @Content, @Term_start, @Term_end)";


        //매개변수
        cmd.Parameters.Add("@Debate_id", SqlDbType.VarChar, 50);
        cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 150);
        cmd.Parameters.Add("@Content", SqlDbType.NVarChar, 3000);
        cmd.Parameters.Add("@Term_start", SqlDbType.VarChar, 30);
        cmd.Parameters.Add("@Term_end", SqlDbType.VarChar, 30);


        //값
        cmd.Parameters["@Debate_id"].Value = this.Page.User.Identity.Name.ToString();
        cmd.Parameters["@Title"].Value = TextBoxSubject.Text;
        cmd.Parameters["@content"].Value = TextBoxContent.Text; 
        cmd.Parameters["@Term_start"].Value = txtDOB_start.Text;
        cmd.Parameters["@Term_end"].Value = txtDOB_end.Text;



        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();


        string script = @"<script type='text/javascript'>

                                              alert('글쓰기 완료!!');

                                              location.href = '/Book_Debate/List.aspx';

                                          </script>";

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);

    }

      
}