using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;



using System.Data;

using System.Data.SqlClient;

using System.Configuration;

public partial class Book_Academy_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!this.Page.User.Identity.IsAuthenticated)
        {

            string script = "<script type='text/javascript'>alert('권한이 없습니다.');location.href='/Account/LogIN/Login.aspx';</script>";
            Response.Write(script);
            Response.End();

        }


        Label myLbl = (Label)Master.FindControl("Label3");
        myLbl.Text = User.Identity.Name + "님 환영합니다.";


        if (!IsPostBack)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update Notice set readCount = readCount + 1 where Num = @Num;";


            cmd.Parameters.Add("@Num", SqlDbType.Int);
            cmd.Parameters["@Num"].Value = Request.QueryString["Num"];


            con.Open();



            //쿠키 확인 작업
            if (Request.Cookies["read"] == null || Request.Cookies["read"].Value == "n")
            {
                cmd.ExecuteNonQuery();//조회수 증가
                Response.Cookies["read"].Value = "y";
            }


            cmd.CommandText = "select * from Notice where Num = @Num";

            SqlDataReader reader = cmd.ExecuteReader();


            if (reader.Read())
            {//출력

                 
                LabelID.Text = string.Format("{0}", reader["id"].ToString());
                LabelTitle.Text = reader["Title"].ToString();


                //글내용
                string content = reader["content"].ToString(); 
                TextBox_Content.Text = content;

                LabelNum.Text = reader["Num"].ToString();
                LabelReadCount.Text = reader["readCount"].ToString();
                LabelPostDate.Text = reader["PostDate"].ToString();

                 
            }

            reader.Close();

            con.Close();

        }

    }





    protected void bnt_list_Click(object sender, EventArgs e)
    {
        //List
        Response.Redirect("/Book_etc/etc_Notice.aspx");
    }



    protected void bnt_modify_Click(object sender, EventArgs e)
    {
        //수정 

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select id from Notice where Num = @Num";
        cmd.Parameters.Add("@Num", SqlDbType.Int);
        cmd.Parameters["@Num"].Value = Request.QueryString["Num"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();


        if (id == this.Page.User.Identity.Name)
        {
            Response.Redirect("/Book_etc/etc_Notice_Edit.aspx?Num=" + Request.QueryString["Num"]);
        }
        else
        {
             

            string script = null;

            script = @"<script type='text/javascript'>

                                        alert('권한이 없습니다.');

                                        history.go(-1);

                                    </script>";



            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "modify", script);


        }


    }




    protected void bnt_del_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "select id from Notice where Num = @Num";
        cmd.Parameters.Add("@Num", SqlDbType.Int);
        cmd.Parameters["@Num"].Value = Request.QueryString["Num"];

        con.Open();

        string id = cmd.ExecuteScalar().ToString();


        // 북토론/에디트.aspx.cs 동일한 패턴 
        if (id == this.Page.User.Identity.Name)
        {
            Response.Redirect("/Book_etc/etc_Notice_Del.aspx?Num=" + Request.QueryString["Num"]);
        }
        else
        {
             

            string script = null;

            script = @"<script type='text/javascript'>

                                        alert('권한이 없습니다.');

                                        history.go(-1);

                                    </script>";



            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "del", script);





        }


    }




}