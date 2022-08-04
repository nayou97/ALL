using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CSS_Default2 : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.User.Identity.IsAuthenticated) //로그인 되지 않은 상태
        { // LogINPanel판넬이 없어야 함


            PanelLogIN.Visible = false; //아이디가 있는 판넬
            PanelLogOUT.Visible = true; //로그인버튼이 있는 판넬임.


        }
        else  //로그인 되었을 때
        {
            PanelLogIN.Visible = true;
            PanelLogOUT.Visible = false; //로그인버튼이 있는 판넬임.

            Label3.Text = User.Identity.Name + "님 환영합니다.";
        }
         


       // lblYear.Text = DateTime.Now.ToString("yyyy"); //2019년
       // lblMonth.Text = DateTime.Now.ToString("MM");  //10월





    }
    






    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/LogIN/Logout.aspx");
    }


    protected void BTNLogIN_Click(object sender, EventArgs e)
    {
        // 로그인
        Response.Redirect("/Account/LogIN/Login.aspx");
    }


    protected void BNTMypage_Click(object sender, EventArgs e)
    {
        //BNTMypage
        Response.Redirect("/Account/MyPage.aspx");
    }




    protected void bnt_logohome1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }




    protected void bnt_logohome2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }



    ///

    protected void bnt_mypage_Click(object sender, EventArgs e)
    {
        //마이페이지로 이동
        Response.Redirect("/Account/MyPage.aspx");
    }



    protected void bnt_logout_Click(object sender, EventArgs e)
    {
        // 로그아웃페이지로 이동
         Response.Redirect("/Account/LogIN/Logout.aspx");




        /*

        string script = null;
        script = "<script type='text/javascript'>alert('로그 아웃 합니다.\\r\\n로그인화면으로 이동합니다.'); location.href='Login.aspx';</script>";
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);
        Response.Write("ddd");



        //로그아웃!!
        System.Web.Security.FormsAuthentication.SignOut();



        //쿠키 해제
        Response.Cookies["name"].Expires = DateTime.MinValue;
        Response.Cookies["email"].Expires = DateTime.MinValue;
        Response.Redirect("Login.aspx");

    */


    }




    protected void bnt_login_Click(object sender, EventArgs e)
    {
        // 로그인
        Response.Redirect("Login.aspx");
    }

    protected void bnt_join_Click(object sender, EventArgs e)
    {
        //가입하기
        Response.Redirect("/Account/mjoin.aspx");
    }




    protected void bnt_debate_Click(object sender, ImageClickEventArgs e)
    {
        //토론방
        Response.Redirect("/Book_Debate/List.aspx");
    }



    protected void bnt_change_write_Click(object sender, ImageClickEventArgs e)
    {
        //if글쓰기
        Response.Redirect("/Book_paint_Rewriting/Rewriting_list.aspx");
    }



    protected void bnt_fanart_Click(object sender, ImageClickEventArgs e)
    {
        //일러스트
        Response.Redirect("/Book_paint_Rewriting/etc_illustator_list.aspx");
    }



}