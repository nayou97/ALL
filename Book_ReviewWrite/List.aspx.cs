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
using System.Collections;

public partial class Basic_List : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ToString());  


    protected void Page_Load(object sender, EventArgs e)
    {


        lbl_ID.Text = this.Page.User.Identity.Name;


        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!this.Page.User.Identity.IsAuthenticated)
        {
            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();
        }


        if (!Page.IsPostBack)
        {
            //그리드뷰 컨트롤에 데이터 출력
            DisplayData();
        }


    }



    protected string GetTitle(object Title)
    {
        string ss = Title.ToString();
        ss = "" + ss;
        return ss;
    }


    protected string GetBookName(object BookName)
    {
        string ss = BookName.ToString();
        ss = "" + ss;
        return ss;
    }
    
    
        private void DisplayData()
        {

        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        try
        {
            SqlCommand cmd = new SqlCommand("List_BookWrite", con); 
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name); 

            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind(); //DataList 새로고침

        }
        catch (Exception ex)
        {
        }

    }




    protected void btnWrite_Click(object sender, EventArgs e)
    {
        Response.Redirect("Write.aspx");
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        Session["page"] = GridView1.PageIndex;


        DisplayData();
    }
}
