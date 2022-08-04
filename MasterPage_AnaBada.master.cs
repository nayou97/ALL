using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_freestore : System.Web.UI.MasterPage
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





    protected void bnt_ana_Click(object sender, EventArgs e)
    {
        //아나
        Response.Redirect("/Book_FreeStore/FreeStore_ANA.aspx");
    }



    protected void bnt_bada_Click(object sender, EventArgs e)
    {
        //바다
        Response.Redirect("/Book_FreeStore/FreeStore_BADA.aspx");
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




    protected void bntAna_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Book_FreeStore/FreeStore_ANA.aspx");
    }



    protected void bntBada_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Book_FreeStore/FreeStore_BADA.aspx");
    }




    protected void bnt_QA_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Book_FreeStore/FreeStore_QA.aspx");
    }



    protected void bntMy_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Book_FreeStore/FreeStore_mypage.aspx");
    }



}
