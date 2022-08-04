using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_FreeStore_FreeStore_admin : System.Web.UI.Page
{

    //연결
    string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;//데이터베이스 서버 이름은 마스터
    

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

         

    }

     
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Book_FreeStore/FreeStore.aspx");

    }
}