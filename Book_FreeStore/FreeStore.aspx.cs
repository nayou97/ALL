using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_etc_FreeStore : System.Web.UI.Page
{


    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ToString());  //web.config 파일에 있는거


    protected void Page_Load(object sender, EventArgs e)
    {

        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }

        //운영자 화면
        if (this.Page.User.Identity.Name == "id11")
        {

            bnt_admin.Visible = true;

        }



    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        //운영자 화면
        if (this.Page.User.Identity.Name == "id11")
        {
            Response.Redirect("FreeStore_admin.aspx");
        }
        else
        {
            string script = @"<script type='text/javascript'>

                                              alert('운영자만 접근 가능합니다!!');

                                              location.href = '/Book_FreeStore/FreeStore.aspx';

                                          </script>";

            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
        }

    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        //아나
        // 아껴주고 나눠주고 -> 회원이 담당자에게 자신의 책을 주고 싶다고 신청서 내기
        Response.Redirect("FreeStore_ANA.aspx");
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        //바다
        Response.Redirect("FreeStore_BADA.aspx");
    }



    protected void bnt_mypage_Click(object sender, EventArgs e)
    {
            Response.Redirect("/Book_FreeStore/FreeStore_mypage.aspx");
        
    }

     


}