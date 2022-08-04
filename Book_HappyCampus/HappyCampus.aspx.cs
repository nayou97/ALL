using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Data;

public partial class Book_HappyCampus_HappyCampus : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)

        {

            //조회수 증가용 쿠키 할당 쿠키가 n일경우 무조건 카운트 증가 준비 완료~

            Response.Cookies["read"].Value = "n";

        }


        lbl_cnt.Text = GridView1.Rows.Count.ToString();

        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }
    }
     

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)

    {

        if (e.Row.RowType == DataControlRowType.DataRow)

        {

            
            //1. 제목이 길면.. 자르기

            HyperLink subject = e.Row.Cells[1].Controls[0] as HyperLink;



            if (subject.Text.Length > 20)

            {

                subject.Text = subject.Text.Substring(0, 20) + "...";

            }

             


            //2. 글쓴지 일정시간이 지나면 New.gif 표시가 사라진다
            // 30분 이내에 쓴글


            //현재 바인딩되거나 바인딩된 데이터에 접근하는 방법
            DataRowView row = e.Row.DataItem as DataRowView;
            DateTime regDate = (DateTime)row["regDate"];



            //현재시간에서 글쓴시간 빼기

            TimeSpan gap = DateTime.Now - regDate;



            if (gap.TotalMinutes <= 30)//타입을 맞추기위해 스트링 형태를 컨트롤 형태로 변환하기 위해 사용한다.

            {
                //30분 이내에 쓴글

                LiteralControl img = new LiteralControl("<img src='/Images/NEW버튼.png' alt='새글' style='margin-left:5px;width:25px;height:15px;' />");

                e.Row.Cells[1].Controls.Add(img);

                e.Row.Cells[1].Controls.AddAt(0, img);

            }


            //3. 첨부파일 존재하면 이미지 추가하기

            if (row["fileName"].ToString() != "")

            {

                LiteralControl img = new LiteralControl(string.Format("<img src='/Images/folder-908888_1280.png' alt='{0}' title='{0}' style='margin-left:5px;width:20px;height:20px;' />", "다운로드:" + row["downloadCount"] + "회"));



                e.Row.Cells[1].Controls.Add(img);

            }

        }





    }
     

    //자료 나눠주기
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Happy_upload.aspx");
    }


    protected void bnt_mypage_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Book_HappyCampus/HappyCampus_history.aspx");

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    { 
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        Session["page"] = GridView1.PageIndex;
         
    }
}