using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Basic_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["Num"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();
        } 




        //비회원이 해당 주소를 알아내서 직접 접속했을때..

        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }



        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";



    }




    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //취소버튼 클릭시 뒤로(상세 보기 페이지로 이동)
        Response.Redirect("View.aspx?Num=" + Request["Num"]);
    }





    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //삭제하기

        //1. 암호가 일치?

        //2. 삭제 or 취소

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);



        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;

        cmd.CommandText = "select count(*) from BookWrite where Num = @Num";

        cmd.Parameters.Add("@Num", SqlDbType.Int);
        cmd.Parameters["@Num"].Value = Request.QueryString["Num"];
         

        con.Open();

        int result = (int)cmd.ExecuteScalar();





        string script = "";



        if (result == 1)

        {

            //암호가 일치하기 때문에.. 게시물 Delete

            cmd.CommandText = @"delete from BookWrite

                                              where Num = @Num";



            cmd.ExecuteNonQuery();//delete



            script = @"<script type='text/javascript'>

                                        alert('삭제 완료!!');

                                        location.href='List.aspx';

                                    </script>";

        }

        else

        {

            script = @"<script type='text/javascript'>

                                        alert('암호가 일치하지 않습니다!!');

                                    </script>";

        }



        con.Close();



        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);

    }
}
