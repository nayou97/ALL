using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



    public partial class Book_etc_FreeStore_ANA : System.Web.UI.Page
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




            //글번호 자동 카운트
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            //id 입력하기
            cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);  
            lbl_submit.Text = "동의하셨습니다.";


        txtID.Text = this.Page.User.Identity.Name;



        }





        private void ClearControls()
        {
            txtBookName1.Text = string.Empty;
            txtAuthor1.Text = string.Empty;
            txtPublisher1.Text = string.Empty;
            txtBookName1.Focus();
        }

     


    //신청서 저장하기
        protected void btnSave_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Insert_ANA", con);   //WriteBasic
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {

            
                cmd.Parameters.AddWithValue("@UserID", txtID.Text.Trim());
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtphone1.Text.Trim());
                cmd.Parameters.AddWithValue("@PostNum", txtPostNum.Text.Trim());
                cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text.Trim());
                cmd.Parameters.AddWithValue("@Address2", txtAddress2.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());



                cmd.Parameters.AddWithValue("@BookTitle1", txtBookName1.Text.Trim()); 


            cmd.Parameters.AddWithValue("@Author1", txtAuthor1.Text.Trim()); 


            cmd.Parameters.AddWithValue("@Publisher1", txtPublisher1.Text.Trim()); 

            
                cmd.Parameters.AddWithValue("@PostWay", rdPostWay.SelectedValue.ToString());  // 배송 방식
                cmd.Parameters.AddWithValue("@WarningText", txtWarningText.Text.Trim());


                cmd.Parameters.AddWithValue("@YesOrNo", rdYesNo.SelectedValue.ToString());  // 동의 - 예 아니오




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

                                              alert('안 됩니다!!\n\n잘못된 부분이 있는지 확인해보세요');

                                          </script>";

                this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
            }


        }
     


        // 만약,  no를 선택한 채, 버튼을 누르면
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

        protected void btn_step1_Click(object sender, EventArgs e)
        {
            Panel_step1.Visible = false;
            Panel_step2.Visible = true;
            Panel_step3.Visible = false;
        }

        protected void btn_step2_Click(object sender, EventArgs e)
        {
            Panel_step1.Visible = false;
            Panel_step2.Visible = false;
            Panel_step3.Visible = true;

            btnSave.Visible = true; //신청서 제출하기 버튼. 3단계로 넘기면 보이게 된다.
        }




        protected void btn_list_Click(object sender, EventArgs e)
        {

            string script = "";
            script = "<script type='text/javascript'>" +
                "alert('페이지로 \\r\\n게시판으로 이동합니다.'); " +
                "location.href='/Account/LogIN/Home.aspx';" +
                "</script>";


            Response.Redirect("/Book_FreeStore/FreeStore.aspx");
        }




        protected void btn_backstep2_Click(object sender, EventArgs e)
        {
            Panel_step1.Visible = true;
            Panel_step2.Visible = false;
            Panel_step3.Visible = false;
        }



        protected void btn_backstep3_Click(object sender, EventArgs e)
        {
            Panel_step1.Visible = false;
            Panel_step2.Visible = true;
            Panel_step3.Visible = false;
        }





    protected void btnReset2_Click(object sender, EventArgs e)
    {
        //2단계 리셋


        txtBookName1.Text = string.Empty;
        txtAuthor1.Text = string.Empty;
        txtPublisher1.Text = string.Empty;
         


        txtPostWay.Text = string.Empty;
        txtWarningText.Text = string.Empty; 


        txtBookName1.Focus();




    }
     

}
