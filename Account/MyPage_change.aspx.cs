using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

 
public partial class MyPage :  System.Web.UI.Page
{

    //연결
    string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;//데이터베이스 서버 이름은 마스터

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        // 막대형 그래프
        if (!IsPostBack)
        {
            BindUserID(); //드롭다운리스트에 내용을 바인딩
            SetInfo();   //정보를 새로 정한다
        }


        //인증
        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";



        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Home.aspx';</script>";

            Response.Write(script);

            Response.End();
             
        }
          

         

    }








    //텍스트박스들에 데이터를 뜨게 한다.
    private void BindUserID()
    {

        // 연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);


        // 명령 
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "Select id from Member where id = @id";
        cmd.Parameters.AddWithValue("@id", this.User.Identity.Name);



        //실행
        con.Open();


        SqlDataReader reader = cmd.ExecuteReader(); // 읽어옴.
         
        IDLabel.Text = this.User.Identity.Name;


        con.Close();

    }



    //아이디(조건)에 맞게 멤버정보들을 골라낸다
    private void SetInfo()
    {
        // 연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);


        // 명령
        string sql = "Select * from Member where id = @id";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@id", IDLabel.Text);


        //실행
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();


        if (rd.Read())
        {

            IDLabel.Text = rd["id"].ToString();
            PWDtextbox.Text = rd["pwd"].ToString();

            NameTextBox.Text = rd["name"].ToString();

            //핸드폰
            PhoneTextBox1.Text = rd["Phone"].ToString();


        }
        rd.Close();
        con.Close();

    }





    //회원정보 수정 버튼
    protected void Button7_Click(object sender, EventArgs e)
    {

         
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        //명령
        string sql = @"Update Member Set pwd = @pwd, name = @name, Phone = @Phone Where id = @id";
        SqlCommand cmd = new SqlCommand(sql, con);



        //매개변수 
        cmd.Parameters.AddWithValue("@pwd", PWDtextbox.Text);
        cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
        cmd.Parameters.AddWithValue("@Phone", PhoneTextBox1.Text);
        cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);



        //실행

        con.Open();
          
        cmd.ExecuteNonQuery();

        con.Close();



        string script = @"<script type='text/javascript'>

                                              alert('회원정보 수정 완료!!');

                                              location.href = '/Account/LogIN/Home.aspx';

                                          </script>";

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);


    }



    private void ClearData()
    {
        IDLabel.Text = "";
        PWDtextbox.Text = "";
        NameTextBox.Text = "";
        PhoneTextBox1.Text = "";
    }




    protected void bnt_Cancel_Click(object sender, EventArgs e)
    {

        Response.Redirect("/Account/MyPage.aspx");


    }




}