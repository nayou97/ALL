using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_etc_FreeStore_BADA : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);


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

        lbl_submit.Text = "동의하셨습니다.";
        btnSave.Visible = true;

        if (!IsPostBack)
        {
            BindData();
        }

        txtID.Text = this.Page.User.Identity.Name;

    }



    //유저가 고르는 리스트
    protected void BindData()
    {
        
            DataSet ds = new DataSet();

            con.Open();
         
        string cmdstr = "select num, BookTitle1,  Publisher1,  Author1 from ana";

        SqlCommand cmd = new SqlCommand(cmdstr, con);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            adp.Fill(ds);

        gridBADA.DataSource = ds.Tables[0];

        gridBADA.DataBind();
        

    }



    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {

        string data = "";
        foreach (GridViewRow row in gridBADA.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkSelect") as CheckBox);
                if (chkRow.Checked)
                {

                    string num = row.Cells[1].Text;

                    string BookTitle1 = row.Cells[2].Text;

                    string Publisher1 = row.Cells[3].Text;

                    string Author1 = row.Cells[4].Text;
                     

                    //텍스트박스로....
                    txtnum.Text = num;

                    txtBookTitle1.Text = BookTitle1;
                    txtPublisher1.Text = Publisher1;
                    txtAuthor1.Text = Author1;


                }
            }
        }
        

        

    }
    


    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "insert into bada(bada_num, BookTitle1, Author1, Publisher1, UserID, UserName, Phone,PostNum,Address1,Address2,email,PostWay,WarningText,YesOrNo) values (@bada_num, @BookTitle1, @Author1, @Publisher1, @UserID,  @UserName,  @Phone, @PostNum, @Address1, @Address2, @email, @PostWay, @WarningText, @YesOrNo)";



        try
        {

            cmd.Parameters.AddWithValue("@bada_num", txtnum.Text.Trim()); //기부등록번호 ANA.sql의 num이자 BADA의 bada_num
            cmd.Parameters.AddWithValue("@BookTitle1", txtBookTitle1.Text.Trim());
            cmd.Parameters.AddWithValue("@Author1", txtAuthor1.Text.Trim());
            cmd.Parameters.AddWithValue("@Publisher1", txtPublisher1.Text.Trim());


            cmd.Parameters.AddWithValue("@UserID", txtID.Text.Trim());
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtphone1.Text.Trim());
            cmd.Parameters.AddWithValue("@PostNum", txtPostNum.Text.Trim());
            cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text.Trim());
            cmd.Parameters.AddWithValue("@Address2", txtAddress2.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());


            cmd.Parameters.AddWithValue("@PostWay", txtPostWay.Text.Trim());  // 배송 방식 
            cmd.Parameters.AddWithValue("@WarningText", txtWarningText.Text.Trim());  // 배송 방식
            cmd.Parameters.AddWithValue("@YesOrNo", rdYesNo.SelectedValue.Trim());  // 동의 - 예 아니오



            

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            string script = @"<script type='text/javascript'>

                                              alert('글쓰기 완료!!');

                                              location.href = '/Book_FreeStore/FreeStore.aspx';

                                          </script>";

            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);

        }
        catch (Exception)
        {


            string script = @"<script type='text/javascript'>

                                              alert('안 됩니다!!\n 잘못된 부분이 없는지 다시 한 번 살펴보세요.');

                                          </script>";

            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
        }

    }





    protected void btnReset_Click(object sender, EventArgs e)
    {

        txtUserName.Text = string.Empty;
        txtphone1.Text = string.Empty;
        txtPostNum.Text = string.Empty;
        txtAddress1.Text = string.Empty;
        txtAddress2.Text = string.Empty;
        txtEmail.Text = string.Empty; 


        txtUserName.Focus();

    }




    //ana리스트 텍스트박스 초기화
    protected void btnReset_ana_Click(object sender, EventArgs e)
    {

        txtnum.Text = string.Empty;

        txtBookTitle1.Text = string.Empty; 

        txtAuthor1.Text = string.Empty; 


        txtPublisher1.Text = string.Empty; 

        

        lblInfo.Text = "";

    }


     


    //목록으로
    protected void Button1_Click(object sender, EventArgs e)
    {


        Response.Redirect("/Book_FreeStore/FreeStore.aspx");
    }



    protected void bnt_next1_Click(object sender, EventArgs e)
    {
        Panel_step1.Visible = false;
        Panel_step2.Visible = true;
        Panel_step3.Visible = false;
    }

    protected void bnt_next2_Click(object sender, EventArgs e)
    {

        Panel_step1.Visible = false;
        Panel_step2.Visible = false;
        Panel_step3.Visible = true;
    }

    protected void bnt_list1_Click(object sender, EventArgs e)
    {

        string script = "";
        script = "<script type='text/javascript'>" +
            "alert('페이지로 \\r\\n게시판으로 이동합니다.'); " +
            "location.href='/Account/LogIN/Home.aspx';" +
            "</script>";

        Response.Redirect("/Book_FreeStore/FreeStore.aspx");
    }


    protected void bnt_back2_Click(object sender, EventArgs e)
    {
        Panel_step1.Visible = true;
        Panel_step2.Visible = false;
        Panel_step3.Visible = false;
    }





    protected void rdYesNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdYesNo.SelectedValue == "no")
        {
            //정말 비동의하시겠습니까? 그러면 작성을 완료하실 수 없습니다. 리스트로 이동하시겠습니까? =>예 누르면, 리스트로, 아니면 창닫기
            lbl_submit.Text = "정말 비동의하시겠습니까? 그러면 작성을 완료하실 수 없습니다.";

            btnSave.Visible = false;
        }
        else  //  no라고 했다가 다시 yes로 할 경우
        {

            btnSave.Visible = true;
            lbl_submit.Text = "동의하셨습니다.";
        }

    }

     




    protected void rdPostWay_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtPostWay.Text = rdPostWay.SelectedValue.Trim();
    }



    protected void bnt_back3_Click(object sender, EventArgs e)
    {
        Panel_step1.Visible = false;
        Panel_step2.Visible = true;
        Panel_step3.Visible = false;
    }


     
    protected void gridBADA_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridBADA.PageIndex = e.NewPageIndex;
        gridBADA.DataBind();
        Session["page"] = gridBADA.PageIndex;
        BindData();
    }
}