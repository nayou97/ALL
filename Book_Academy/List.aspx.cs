using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Data;

public partial class Book_Academy_List : System.Web.UI.Page
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

            HyperLink subject = e.Row.Cells[1].Controls[0] as HyperLink;



            if (subject.Text.Length > 20)

            {

                subject.Text = subject.Text.Substring(0, 20) + "...";

            }





            //2. 글쓴지 일정시간이내면.. new 표시
            // 30분 이내로 써진 글에는 new버튼이 뜬다

            DataRowView row = e.Row.DataItem as DataRowView;
            DateTime regDate = (DateTime)row["regDate"];



            TimeSpan gap = DateTime.Now - regDate;



            if (gap.TotalMinutes <= 30)

            {

                //30이내에 쓴글 

                LiteralControl img = new LiteralControl("<img src='/Images/NEW버튼.png' alt='새글' style='margin-left:5px;width:25px;height:15px;' />");

                e.Row.Cells[1].Controls.Add(img);

                e.Row.Cells[1].Controls.AddAt(0, img);

            }



             

        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        //글쓰기 
        Response.Redirect("/Book_Academy/Add.aspx");
    }



}