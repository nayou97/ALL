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
public partial class Basic_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //넘겨져 온 쿼리 스트링 검사 
        if (String.IsNullOrEmpty(Request["Num"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();
        }
        else
        {
            if (!Page.IsPostBack)
            {
                //넘겨져온 번호에 해당하는 글 출력
                Display();
            }
        }

        if (!this.Page.User.Identity.IsAuthenticated)

        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/LogIN/Login.aspx';</script>";

            Response.Write(script);

            Response.End();

        }

        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";

    }



    private void Display()
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        con.Open();


        SqlCommand cmd = new SqlCommand("View_BookWrite", con);  //ViewBasic
        cmd.CommandType = CommandType.StoredProcedure;
        

        //파라미터 추가 : List.aspx에서 넘겨온 쿼리 스트링 값
        cmd.Parameters.AddWithValue("@Num", Request["Num"]);
        cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


        //상세보기 :DataReader 
        SqlDataReader dr = cmd.ExecuteReader();
        


        //바인딩 : 각각의 컨트롤
        while (dr.Read())
        {

            this.lbID.Text = dr["id"].ToString();
            this.lblNum.Text = dr["Num"].ToString();

            this.lblTitle.Text = dr["Title"].ToString();

            this.lblBookName.Text = dr["BookName"].ToString();
            this.lblGenre.Text = dr["Genre"].ToString();

            this.lblPostDate.Text = dr["PostDate"].ToString();


            this.lblAuthor.Text = dr["Author"].ToString();
            this.lblReviewStar.Text = dr["ReviewStar"].ToString();
            

            //글내용
            string content = dr["content"].ToString();
            this.TextBox_Content.Text = content;



        }


        dr.Close();

        con.Close();  
        
              
    }



    protected void btnModifty_Click(object sender, EventArgs e)
    {
        //수정 페이지로 현재 글의 번호 값 넘김 
        string strUrl = String.Empty;
        strUrl = "./Modify.aspx?Num=" + Request["Num"];
        Response.Redirect(strUrl);
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //삭제된 페이지로 현재 글의 번호 값 넘김 
        Response.Redirect(String.Format("Delete.aspx?Num={0}", Request["Num"]));
    }


    protected void btnList_Click(object sender, EventArgs e)
    {
        //리스트 페이지로 이동 
        Response.Redirect("./List.aspx");

    }


}
