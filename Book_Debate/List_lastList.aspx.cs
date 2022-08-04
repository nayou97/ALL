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

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Home.aspx';</script>";

            Response.Write(script);

            Response.End();

        }



    }


    


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)

    {

        if (e.Row.RowType == DataControlRowType.DataRow)

        {

            /*
             * 
            //1. 제목이 길면.. 자르기
            //e.Row <- 한행(GridViewRow) x 5개


             HyperLink title2 = e.Row.Cells[1].Controls[0] as HyperLink;
            


            //여기서 title 은, 리스트 그리드뷰에 있는 거


            if (title2.Text.Length > 20)
            {
                title2.Text = title2.Text.Substring(0, 20) + "...";
            }
            
    */



            //2. 글쓴지 일정시간이내면.. new.gif 표시
            // 30분이내

            //Response.Write(e.Row.Cells[3].Text + "<br />");
            


            //현재 바인딩되거나 바인딩된 데이터에 접근하는 방법

            //A. 출력된 결과값에 접근하는 방법(Cells을 사용)

            //Response.Write(e.Row.Cells[2].Text);



            //B. (출력과 상관없이)바인딩되는 원본에 접근하는 방법

            // 조건 : 데이터원본에는 있어야함(select의 대상)
            //데이터원본(seq, subject, name, regDate, readCount, email)

          //  DataRowView row = e.Row.DataItem as DataRowView;

            //Response.Write(row["email"].ToString());
            //Response.Write(row["PostDate"].ToString());

         //   DateTime PostDate2 = (DateTime)row["PostDate2"];
            //PostDate는 변수이름
            //괄호안의 것은 디자인창에 있는 DataField와 SortExpression임


       //     TimeSpan gap = DateTime.Now - PostDate2;


            /*
            if (gap.TotalMinutes <= 30)

            {

                //30이내에 쓴글

                //e.Row.Cells[1]

                LiteralControl img = new LiteralControl("<img src='/Images/tip_new_orange.gif' alt='새글' style='margin-left:5px;' />");

                e.Row.Cells[1].Controls.Add(img);

                e.Row.Cells[1].Controls.AddAt(0, img);

            }
            */
        }

    }




    //글쓰기 = 운영자만 가능
    protected void Button2_Click(object sender, EventArgs e)
    {
        
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




    protected void bnt_Gomain_Click(object sender, EventArgs e)
    {

        Response.Redirect("/Book_Debate/List.aspx");


    }



}