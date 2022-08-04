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





    protected void bnt_logohome1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }




    protected void bnt_logohome2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }





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




    protected void bnt_essay_Click(object sender, ImageClickEventArgs e)
    {

        //독후감쓰기
        Response.Redirect("/Book_ReviewWrite/List.aspx");

    }


    protected void bnt_academy_Click(object sender, ImageClickEventArgs e)
    {
        //논술방
        Response.Redirect("/Book_Academy/List.aspx");

    }



    protected void bnt_share_Click(object sender, ImageClickEventArgs e)
    {

        //자료실
        Response.Redirect("/Book_HappyCampus/HappyCampus.aspx");

    }


}
