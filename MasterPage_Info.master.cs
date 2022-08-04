using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_debate : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.User.Identity.IsAuthenticated) //사용자가 인증되지 않았다면???   =   로그인이 안된 상태라면?
        {

            PanelLogIN.Visible = false; //아이디가 있는 판넬
            PanelLogOUT.Visible = true; //로그인버튼이 있는 판넬임.
        }
        else
        {
            PanelLogIN.Visible = true;
            PanelLogOUT.Visible = false; //로그인버튼이 있는 판넬임.
        }
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
        //로그아웃페이지로 이동
        Response.Redirect("/Account/LogIN/Logout.aspx");
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
     


    /// /////////////////////////////////////////////////////////////////////////////////////
 

    protected void bnt_LOGINN_Click(object sender, EventArgs e)
    {

        // Login 로그인
        Response.Redirect("/Account/LogIN/Login.aspx");


    }



    protected void bnt_JOINN_Click(object sender, EventArgs e)
    {

        // 가입하기
        Response.Redirect("/Account/mjoin.aspx");

    }



}
