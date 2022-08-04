using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Import the namespace
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;




public partial class Book_etc_Book_etc_Meeting : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ToString()); 

    protected void Page_Load(object sender, EventArgs e)
    {

        Label myLbl = (Label)Master.FindControl("Label3"); 
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        //비회원이 해당 주소를 알아내서 직접 접속했을때..
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }


        if (!Page.IsPostBack)
        {
            DisplayData();
        }



        lbl_cnt.Text = ctlBasicList.Rows.Count.ToString();



        //운영자도 보게하기
        if (this.Page.User.Identity.Name == "id11")  // 글작성자 = 지금 로그인중인아이디
        {

            //판넬도 가리자
            Button1.Visible = true;

        }


    }




    protected void ctlBasicList_RowDataBound(object sender, GridViewRowEventArgs e)

    {

        if (e.Row.RowType == DataControlRowType.DataRow)

        {

            //1. 제목이 길면.. 자르기

            //e.Row <- 한행(GridViewRow) x 5개

            HyperLink Title = e.Row.Cells[1].Controls[0] as HyperLink;



            if (Title.Text.Length > 20)

            {

                Title.Text = Title.Text.Substring(0, 20) + "...";

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



    private void DisplayData()
    {
        //연결
        string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString; 
        SqlConnection con = new SqlConnection(conStr);

        try
        {
            SqlCommand cmd = new SqlCommand("List_Notice", con);  
            cmd.CommandType = CommandType.StoredProcedure;

            

            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ctlBasicList.DataSource = dt;
                ctlBasicList.DataBind();
            }
             
        }
        catch (Exception ex)
        {
        }


         

    }
     

    protected void Button1_Click(object sender, EventArgs e)
    {
        //글쓰기 = 운영자만 가능
        try
        {

            if (this.Page.User.Identity.Name == "id11")  //운영자 아이디
            {
                 
                Response.Redirect("/Book_etc/etc_Notice_Write.aspx");
            }
            else // 나머지 일반인들
            {
                 
                string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Book_etc/etc_Notice.aspx';</script>";
                Response.Write(script);
                Response.End();

            }


        }
        catch (Exception ex) //결과
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! Error occured : " + ex.Message.ToString() + "');", true);

        }

    }

    protected void ctlBasicList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    { 
        ctlBasicList.PageIndex = e.NewPageIndex;
        ctlBasicList.DataBind();
        Session["page"] = ctlBasicList.PageIndex;


        DisplayData();
    }
}