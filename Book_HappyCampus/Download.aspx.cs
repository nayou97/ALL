using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Text;

using System.Data;

using System.Data.SqlClient;

using System.Configuration;
using System.IO;

public partial class Book_HappyCampus_Download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;




        cmd.CommandText = "update happy set downloadCount = downloadCount + 1 where seq = @seq;";


        

        cmd.Parameters.Add("@seq", SqlDbType.Int);
        cmd.Parameters["@seq"].Value = Request.QueryString["seq"];





         





        con.Open();





         
        cmd.ExecuteNonQuery();

        con.Close();



        Response.Clear();//임시 페이지의 내용을 모두 지워라



        //Download.aspx?file=help.gif

        //Download.aspx?file=board.rar

        string file = Request.QueryString["file"];



        //Application/UnKnown : MIME(알수없는 형식)

        Response.ContentType = "Application/UnKnown";



        //다운로드 안치고 인식됨

        //Response.ContentType = "Image/GIF";

        Response.AddHeader("Content-Disposition", "Attachment;filename=" + HttpUtility.UrlEncode(file, Encoding.UTF8).Replace("+", "%20"));



        //해당 파일을 임시 페이지(출력 스트림)에 직접 쓴다.

        Response.WriteFile("/files/" + file); //  D:\All\Book_HappyCampus\files

        Response.End();


    }
}