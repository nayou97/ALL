using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Home.aspx';</script>";

            Response.Write(script);

            Response.End();

        }else
        {
            Label3.Visible = true;
            Label3.Text = User.Identity.Name + "님 환영합니다.";

        }
    }





    protected void Button1_Click(object sender, EventArgs e)
    {

        //로그아웃

        System.Web.Security.FormsAuthentication.SignOut();



        //쿠키 해제

        Response.Cookies["name"].Expires = DateTime.MinValue;

        Response.Cookies["email"].Expires = DateTime.MinValue;



        string script = null;



        script = "<script type='text/javascript'>alert('로그아웃이 완료되었습니다.\\r\\n로그인화면으로 이동합니다.'); location.href='Login.aspx';</script>";


        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);




    }



    protected void bnt_logohome2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Account/LogIN/Home.aspx");
    }

    protected void bnt_mypage_Click(object sender, EventArgs e)
    {
        //마이페이지
        Response.Redirect("/Account/MyPage.aspx");
    }

    protected void bnt_logout_Click(object sender, EventArgs e)
    {
        //로그아웃 페이지로 이동
        Response.Redirect("/Account/LogIN/Logout.aspx");
    }


}