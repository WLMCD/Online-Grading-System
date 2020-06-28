/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_ManaAcc.aspx.cs
*	Description:		The cs file for managing account.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class T_ManaAcc : System.Web.UI.Page
{
    public string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.Cookies["id"].Value;// get student id from cookie

        /*bind data to repeater*/
        StuInformation.DataSource = get_datatable("SELECT * FROM StuInfor");
        StuInformation.DataBind();
    }

    /*get data table according to sql*/
    public DataTable get_datatable(string sql)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");
        con.Open();
        DataTable temp_tb = new DataTable();
        SqlDataAdapter DadaAda = new SqlDataAdapter(sql, con);
        DadaAda.Fill(temp_tb);
        con.Close();
        con.Dispose();

        return temp_tb;
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand D_StuInfor = new SqlCommand("DELETE FROM StuInfor WHERE StuID = '" + sid.Text.ToString() + "'");
        SqlCommand D_Account = new SqlCommand("DELETE FROM Account WHERE ID = '" + sid.Text.ToString() + "'");
        SqlCommand D_StuQues = new SqlCommand("DELETE FROM StuAss WHERE StuID = '" + sid.Text.ToString() + "'");
        SqlCommand D_Score = new SqlCommand("DELETE FROM Score WHERE StuID = '" + sid.Text.ToString() + "'");
        SqlCommand D_Answer = new SqlCommand("DELETE FROM Answer WHERE StuID = '" + sid.Text.ToString() + "'");
        SqlCommand D_Comment = new SqlCommand("DELETE FROM Comment WHERE StuID = '" + sid.Text.ToString() + "'");


        D_StuInfor.Connection = con;
        D_Account.Connection = con;
        D_StuQues.Connection = con;
        D_Score.Connection = con;
        D_Answer.Connection = con;
        D_Comment.Connection = con;
        try
        {
            con.Open();
            D_Answer.ExecuteNonQuery();
            D_Score.ExecuteNonQuery();
            D_StuQues.ExecuteNonQuery();
            D_Account.ExecuteNonQuery();
            D_Comment.ExecuteNonQuery();
            /* StuInfor delete at last because foreign key*/
            int data = D_StuInfor.ExecuteNonQuery();

            con.Close();

            /* nothing deleted */
            if ( data == 0 )
                Response.Write("<script>javascript:alert(\"Nothing is deleted.Please make sure the Student ID is right.\");</script>");
            /* deleted */
            else
                Response.Write("<script>javascript:alert(\"Successful!\");</script>");
                
            sid.Text = "";
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            sid.Text = "";
        }
    }

    protected void Edit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand check = new SqlCommand("SELECT * FROM StuInfor WHERE StuID = '" + sid.Text.ToString() + "'");
        check.Connection = con;

        /* add student id to cookie */
        HttpCookie objCookie = new HttpCookie("SID", sid.Text.ToString());
        Response.Cookies.Add(objCookie);

        try
        {
            con.Open();
            check.ExecuteScalar().ToString();
            con.Close();
            Response.Redirect("T_EditAcc.aspx", false);
            sid.Text = "";
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            /* textbox is empty */
            if (err == "未将对象引用设置到对象的实例。")
                err = "ID not exists! Please make sure the Student ID is right!";
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            sid.Text = "";
        }
    }
}
