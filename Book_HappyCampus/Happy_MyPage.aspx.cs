using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Import the namespace
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions; //이거 잘 기억해두자, 새로운 using이다.




public partial class Book_HappyCampus_Happy_MyPage : System.Web.UI.Page
{

    //Create sqlconnection
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ToString());  //web.config 파일에 있는거



    protected void Page_Load(object sender, EventArgs e)
    {

        //그리드뷰에서 해당 회원의 것만 출력 ㄱㄱ

        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!Page.IsPostBack)
        {
            //현재 내가 올린 내역
            DisplayData(); 
            //그동안 올린 내역 모두
            Display();
        }

        lblID.Text = this.Page.User.Identity.Name;

        lblUpLoadcnt.Text = GridView1.Rows.Count.ToString();
        lblSavingCnt.Text = Grid_saving.Rows.Count.ToString(); 

    }



    // 내가 올린 내역
    private void DisplayData()
    {

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;//데이터베이스 서버 이름은 마스터
        SqlConnection con = new SqlConnection(conStr);

        try
        {
            SqlCommand cmd = new SqlCommand("List_happy", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();


        }

        catch (Exception ex)
        {
        }


    }


    // 내가 올린 모든 내역
    private void Display()
    {

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;//데이터베이스 서버 이름은 마스터
        SqlConnection con = new SqlConnection(conStr);

        try
        {
            SqlCommand cmd = new SqlCommand("List_happy_saving", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

            Grid_saving.DataSource = dt;
            Grid_saving.DataBind();//DataList 새로고침

        }
        catch (Exception ex)
        {
        }

    }


    
     


}