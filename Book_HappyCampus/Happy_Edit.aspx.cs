using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Data;

using System.Data.SqlClient;

using System.Configuration;

using System.IO;

public partial class Book_HappyCampus_Happy_Edit : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


        //넘겨져 온 번호 값 검사 
        if (String.IsNullOrEmpty(Request["seq"]))
        {
            Response.Write("잘못된 요청입니다");
            Response.End();

        }
        else
        {
            DisplayData();
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

    private void DisplayData()
    {//VIew.aspx


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        
        SqlCommand cmd = new SqlCommand("View_happy", con);   //ViewBasic
        cmd.CommandType = CommandType.StoredProcedure;



        //id값
        cmd.Parameters.AddWithValue("@id", this.Page.User.Identity.Name);


        //파라미터 추가 : List.aspx에서 넘겨온 쿼리 스트링 값
        cmd.Parameters.AddWithValue("@seq", Request["seq"]); 



        con.Open();
        //상세보기 :DataReader 
        SqlDataReader dr = cmd.ExecuteReader();

        //바인딩 : 각각의 컨트롤
        while (dr.Read())
        {

            this.lblNum.Text = dr["seq"].ToString();
             

            //첨부파일 처리
             
            if (dr["fileName"].ToString() != "")

            {

                txtFileName.Text = dr["fileName"].ToString();
                txtFilePath.Text = dr["filePath"].ToString(); 

            }  

            else

            {

                txtFileName.Text = "첨부파일 없음";
                txtFilePath.Text = "첨부파일 없음";
            }
            

        }

        dr.Close();
        con.Close();

    }

     



    protected void btn_list_Click(object sender, EventArgs e)
    {


        string script = null;

        script = @"<script type='text/javascript'>

                                        history.go(-2);

                                    </script>";



        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "edit", script);
    }




    //수정하기
    protected void bnt_modify_Click(object sender, EventArgs e)
    {


        //1. 암호가 일치.
        //2. 수정 or 취소
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;



        // 업로드.cs에서 복사
        //1. 파일업로드
        string filename = "";   //FileUpload1.FileName;

        string filePath = string.Empty;
        string ImgPath = string.Empty;  // PhotoPath
        string DbImgPath = string.Empty;



        if (FileUpload1.HasFile) 
        {
            
            filePath = @"D:\All\files\";   //  D:\All\Book_HappyCampus\files
            filePath += FileUpload1.FileName;
            

            FileUpload1.SaveAs(filePath);


            filename = Path.GetFileName(FileUpload1.FileName);
            
            FileUpload1.PostedFile.SaveAs(Server.MapPath("/files/") + filename);   
            // D:\All\Book_HappyCampus\files\파일명.파일확장자  <= 실제로 파일을 업로드할 때, 이 폴더에 있는 파일을 올려야함
            // sql상으로는 D:\All\files\제25회_스마트IT과 졸업작품집.pdf 으로 표시 됨.


            cmd.Parameters.AddWithValue("@ImageName", filename);
            cmd.Parameters.AddWithValue("@PhotoPath", filePath);



        }
        else
        {
            cmd.Parameters.AddWithValue("@PhotoPath", string.Empty);

        }





        cmd.CommandText = "select count(*) from happy where seq = @seq and pwd = @pwd";



        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 20);


        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];
        cmd.Parameters["@pwd"].Value = txtPwd.Text;


        con.Open();




        int result = (int)cmd.ExecuteScalar();

        string script = "";


        if (result == 1)
        {

            //암호가 일치하기 때문에.. 게시물 Update


            cmd.CommandText = @"update happy set

                                                     id = @id,

                                                     subject = @subject,

                                                     content = @content,

                                                     regdate = getdate(),

                                                     fileName = @fileName,

                                                     filePath = @filePath

                                              where seq = @seq";



            //매개변수
            cmd.Parameters.Add("@id", SqlDbType.NVarChar, 20);
            cmd.Parameters.Add("@subject", SqlDbType.NVarChar, 100);
            cmd.Parameters.Add("@content", SqlDbType.NVarChar, 3000);
            cmd.Parameters.Add("@filename", SqlDbType.VarChar, 100);
            cmd.Parameters.Add("@filePath", SqlDbType.VarChar, 100);




            //값
            cmd.Parameters["@id"].Value = this.Page.User.Identity.Name;
            cmd.Parameters["@subject"].Value = txtSubject.Text;
            cmd.Parameters["@content"].Value = txtContent.Text;
            cmd.Parameters["@filename"].Value = filename;
            cmd.Parameters["@filePath"].Value = filePath;


            cmd.ExecuteNonQuery();//update



            script = @"<script type='text/javascript'>

                                        alert('수정 완료!!');

                                        location.href='HappyCampus.aspx';

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