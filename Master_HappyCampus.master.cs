using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_HappyCampus_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.User.Identity.IsAuthenticated) // 로그인이 안된 상태라면?
        {

            PanelLogIN0.Visible = false; //아이디가 있는 판넬
            PanelLogOUT.Visible = true; //로그인버튼이 있는 판넬.
        }
        else
        {
            PanelLogIN0.Visible = true;
            PanelLogOUT.Visible = false; //로그인버튼이 있는 판넬.
        }
    }



    //홈으로
    protected void bnt_logohome1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }

     
     
    //마이페이지로 이동
    protected void bnt_mypage_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/MyPage.aspx");
    }



    //로그아웃페이지로 이동
    protected void bnt_logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/LogIN/Logout.aspx");
    }




    // 로그인
    protected void bnt_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    //가입하기
    protected void bnt_join_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Account/mjoin.aspx");
    }


    //토론방으로
    protected void bnt_debate_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Book_Debate/List.aspx");
    }
}
