using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;  //외부파일을 불러들이고, 읽을 때 사용하는 기능을 가진 FileInfo 클래스 등을 호출함
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;



//https://achiz.tistory.com/43 에서 참고



public partial class join : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {



        //로그인상태라면 여길 못 들어오게
        if (this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('이미 로그인 된 계정입니다. \\r\\n회원가입 절차를 진행하시려면 먼저 계정을 로그아웃한 뒤 진행하세요.');location.href='/Account/LogIN/Home.aspx';</script>";

            Response.Write(script);

            Response.End();

        }


        if (!IsPostBack)
        {
            TextBoxID.Text = Request.QueryString["id"];
            Page.Validate();
            CheckUserIdExists();
        }


    }



    // 입력
    protected void GoJoin_Click(object sender, EventArgs e)
    {
        
        //등록합니다 버튼
        if (IsMemberExists())
        {
            Label1.Text = "이미 사용중인 아이디입니다.</ br> 다른아이디를 사용해 주세요.";
        }
        else
        {
            AddMember();
        }

    }//링크버튼 완료 - 회원가입 완료



    private bool IsMemberExists()
    {
        bool result = true;
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string sql = "Select * from Member where id = @id";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@id", TextBoxID.Text);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            result = true; //같은 아이디가 이미 존재한다.
        }
        else
        {
            result = false;
        }

        rd.Close();
        con.Close();
        return result;
    }


    //회원가입하기 버튼 속성에 포함된 함수를 정의함.
    private void AddMember()
    {
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string sql = @"insert into Member values(@id, @pwd, @name, @Phone)";
        SqlCommand cmd = new SqlCommand(sql, con);

       

        //매개변수
        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 20);
        cmd.Parameters.Add("@pwd", SqlDbType.NVarChar, 20);
        cmd.Parameters.Add("@name", SqlDbType.Char, 20);
        cmd.Parameters.Add("@Phone", SqlDbType.VarChar, 20);



        //값
        cmd.Parameters["@id"].Value = TextBoxID.Text;
        cmd.Parameters["@pwd"].Value = TextBoxPwd.Text;
        cmd.Parameters["@name"].Value = TextBoxName.Text;
        cmd.Parameters["@Phone"].Value = TextBoxPhone1.Text;



        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        if (a > 0)
        {
            FormsAuthentication.SetAuthCookie(TextBoxID.Text, false);  // 인증쿠키 생성 : 로그인이 되었음을 확인


            //Home페이지로 이동함
            string str = @"<script type='text/javascript'>

                                              alert('트리부키에 가입되셨습니다!');

                                              location.href = '/Account/LogIN/Home.aspx';

                                          </script>";


            Response.Write(str);

        }
        else
        {
            // Label2.Text = "회원가입에 실패했습니다.";

            string str = @"<script type='text/javascript'>

                                              alert('회원가입에 실패했습니다.');

                                          </script>";


            Response.Write(str);

        }



    }

     
    


    //중복확인
    protected void btnID_Click(object sender, EventArgs e)
    {
        CheckUserIdExists();
        Label1.Visible = true;
    }



    private void CheckUserIdExists()
    {
            string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            string sql = "select * from Member where id = @id";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", TextBoxID.Text);

            con.Open();
            if (cmd.ExecuteScalar() == null)
            {
                Label1.Text = "신청하신 아이디는 사용가능합니다";
               // Button2.Visible = true;
            }
            else
            {
                Label1.Text = "사용 중인 계정입니다.";
               // Button2.Visible = false;
            }
            con.Close();
    }




    protected void bnt_logohome2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }
}
