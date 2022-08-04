using System;
using System.Linq;

using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls; 



public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.Page.User.Identity.IsAuthenticated) //사용자가 인증되지 않았다면???   =   로그인이 안된 상태라면?
        {

            PanelLogIN0.Visible = false; //아이디가 있는 판넬
            PanelLogOUT.Visible = true; //로그인버튼이 있는 판넬임.
        }
        else
        {
            PanelLogIN0.Visible = true;
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

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
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




    /// ///////////////////
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


    protected void bnt_notice_Click(object sender, ImageClickEventArgs e)
    {
        //공지사항
        Response.Redirect("/Book_etc/etc_Notice.aspx");
    }

    /*
    protected void bnt_rank_Click(object sender, ImageClickEventArgs e)
    {
        //랭크
        Response.Redirect("/Book_etc/Book_etc_Ranking.aspx");
    }
    */




}
