using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;


public partial class _Book_Academy_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();
        }


        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";
         

    } 
     
    

    protected void bnt_Write_Click(object sender, EventArgs e)
    {
        //Write

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into Notice(id, Title, Content) values (@id, @Title, @Content)";



        //매개변수
        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 20);
        cmd.Parameters.Add("@Title", SqlDbType.VarChar, 50);
        cmd.Parameters.Add("@content", SqlDbType.NVarChar, 3000);
        


        //값
        cmd.Parameters["@id"].Value = this.Page.User.Identity.Name.ToString();
        cmd.Parameters["@Title"].Value = TextBoxTitle.Text;
        cmd.Parameters["@content"].Value = TextBoxContent.Text;
         

        con.Open();


        cmd.ExecuteNonQuery();

        con.Close();



        string script = @"<script type='text/javascript'>

                                              alert('공지 완료!!');

                                              location.href = '/Book_etc/etc_Notice.aspx';

                                          </script>";

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "add", script);
    }



    protected void bnt_back_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("/Book_etc/etc_Notice.aspx");
    }


}