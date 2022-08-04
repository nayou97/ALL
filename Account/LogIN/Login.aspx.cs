using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using  System.Web.UI.WebControls;



using  System.Data;

using  System.Data.SqlClient;

using System.Configuration;

using System.Web.Security;



public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        //로그인상태라면 여길 못 들어오게
        if (this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('이미 로그인 된 계정입니다.');location.href='/Account/LogIN/Home.aspx';</script>";

            Response.Write(script);

            Response.End();

        }

    }



    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
         
        //메인화면
        Response.Redirect("/Account/Home.aspx");


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        // 로그인

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        //ASPNETConnectionString
        //server=localhost\SQLExpress;database=ASPNET;User ID=na11;Password=1234

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from Member where id = @id and pwd = @pwd";


        cmd.Parameters.Add("@id", SqlDbType.VarChar, 20);
        cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 20);

        cmd.Parameters["@id"].Value = TextBoxID.Text;
        cmd.Parameters["@pwd"].Value = TextBoxPwd.Text;


        con.Open();


        string script = "";


        SqlDataReader reader = cmd.ExecuteReader();


        if (reader.Read())
        {
            //인증
            FormsAuthentication.SetAuthCookie(TextBoxID.Text, false);


            //추가 정보 기억
            Response.Cookies["name"].Value = reader["name"].ToString();


            script = "<script type='text/javascript'>alert('로그인 성공!!\\r\\n메인화면으로 이동합니다.'); location.href='/Account/LogIN/Home.aspx';</script>";




        }
        else
        {
            script = "<script type='text/javascript'>alert('아이디와 비밀번호가 맞는지 확인해주세요.');</script>";
        }




        reader.Close();

        con.Close();





        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "login", script);


    }

    protected void bnt_mjoin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/mjoin.aspx");
    }


    protected void bnt_logohome2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");

    }
}