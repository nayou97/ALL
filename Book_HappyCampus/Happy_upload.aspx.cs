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

public partial class Book_HappyCampus_Happy_upload : System.Web.UI.Page
{



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


         

    }



    protected void btn_write_Click(object sender, EventArgs e)
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;



        //1. 파일업로드
        string filename = "";   //FileUpload1.FileName;

        string filePath = string.Empty;
        string ImgPath = string.Empty;  // PhotoPath
        string DbImgPath = string.Empty;



        if (FileUpload1.HasFile)

        {
            filePath = @"D:\All\files\";   //D:\All\Book_HappyCampus\files
            filePath += FileUpload1.FileName;
            FileUpload1.SaveAs(filePath);


            filename = Path.GetFileName(FileUpload1.FileName);

            FileUpload1.PostedFile.SaveAs(Server.MapPath("/files/") + filename); 

            cmd.Parameters.AddWithValue("@ImageName", filename);
            cmd.Parameters.AddWithValue("@PhotoPath", filePath);



        }
        else
        {
            cmd.Parameters.AddWithValue("@PhotoPath", string.Empty);

        }



        //2. 글쓰기(insert)



        //Write 
        cmd.CommandText = "INSERT INTO happy (id, subject, content, pwd, filename, filePath) VALUES (@id, @subject, @content, @pwd, @filename, @filePath)";
        



        //매개변수

        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 20);


        cmd.Parameters.Add("@subject", SqlDbType.NVarChar, 100);

        cmd.Parameters.Add("@content", SqlDbType.NVarChar, 3000);


        cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 20);


        cmd.Parameters.Add("@filename", SqlDbType.VarChar, 100);
        cmd.Parameters.Add("@filePath", SqlDbType.VarChar, 100);



        //값

        cmd.Parameters["@id"].Value = this.Page.User.Identity.Name;


        cmd.Parameters["@subject"].Value = TextBoxSubject.Text;

        cmd.Parameters["@content"].Value = TextBoxContent.Text;


        cmd.Parameters["@pwd"].Value = TextBoxPwd.Text;


        cmd.Parameters["@filename"].Value = filename;
        cmd.Parameters["@filePath"].Value = filePath;






        con.Open();





        //여기서부터 세이빙테이블로 갈 것들

        SqlCommand cmd2 = new SqlCommand();

        cmd2.Connection = con;



        cmd2.CommandText = "INSERT INTO happy_saving (id, subject, content, pwd, filename, filePath) VALUES (@id, @subject, @content, @pwd, @filename, @filePath)";







        cmd.ExecuteNonQuery(); 

        con.Close();



        string script = @"<script type='text/javascript'>

                                              alert('글쓰기 완료!!');

                                              location.href = 'HappyCampus.aspx';

                                          </script>";



        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);

    }



    protected void btn_list_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("HappyCampus.aspx");
    }



}