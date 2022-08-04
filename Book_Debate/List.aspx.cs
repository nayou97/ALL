using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //인증
        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";



        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }


         

        //운영자도 보게하기
        if (this.Page.User.Identity.Name == "id11")  // 글 작성자 = 지금 로그인중인아이디
        {

            //판넬 가리기
            Button2.Visible = true;

        }



        if (!IsPostBack)

        {

            //조회수 증가용 쿠키 할당

            Response.Cookies["read"].Value = "n";

        }





    }


    


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)

    {

        if (e.Row.RowType == DataControlRowType.DataRow)

        {

            //1. 제목이 길면.. 자르기
            //e.Row <- 한행(GridViewRow) x 5개

            
            HyperLink title = e.Row.Cells[1].Controls[0] as HyperLink;
            //여기서 title 은, 리스트 그리드뷰에 있는 거


            if (title.Text.Length > 20)
            {
                title.Text = title.Text.Substring(0, 20) + "...";
            }
            


            //2. 글쓴지 일정시간이내면.. new.gif 표시
            // 30분이내

            DataRowView row = e.Row.DataItem as DataRowView;

            DateTime PostDate = (DateTime)row["PostDate"];
            

            TimeSpan gap = DateTime.Now - PostDate;



            if (gap.TotalMinutes <= 30)

            {

                //30이내에 쓴글


                LiteralControl img = new LiteralControl("<img src='/Images/NEW버튼.png' alt='새글' style='margin-left:5px;width:25px;height:15px;' />");

                e.Row.Cells[1].Controls.Add(img);

                e.Row.Cells[1].Controls.AddAt(0, img);

            }

        }

    }


    


    protected void Button2_Click(object sender, EventArgs e)
    {
        
        //글쓰기 = 운영자만 가능
        try
        {

            if (this.Page.User.Identity.Name == "id11")  //운영자 아이디
            {

                Response.Redirect("/Book_Debate/Add.aspx");
            }
            else // 나머지 일반인들
            {

                string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Book_Debate/list.aspx';</script>";
                Response.Write(script);
                Response.End();

            }


        }
        catch (Exception ex) //결과
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! Error occured : " + ex.Message.ToString() + "');", true);

        }

    }





    protected void bnt_lastlist_Click(object sender, EventArgs e)
    {

        Response.Redirect("/Book_Debate/List_lastList.aspx");


    }



}