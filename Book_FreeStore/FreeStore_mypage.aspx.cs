using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_FreeStore_FreeStore_mypage : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        //인증
        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";



        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Home.aspx';</script>";

            Response.Write(script);

            Response.End();

        }



        lbl_pageuser.Text = this.Page.User.Identity.Name;
         


    }






    //목록으로
    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("/Book_FreeStore/FreeStore.aspx");

    }







}