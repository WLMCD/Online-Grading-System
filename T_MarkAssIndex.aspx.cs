/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_MarkAssIndex.aspx.cs
*	Description:		The cs file for marking assignment index page.

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

public partial class T_MarkAss : System.Web.UI.Page
{
    public int aid;// answer id
    public string Sid;// student id
    public string question;
    public string weight;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*bind data to repeater*/
        MarkInformation.DataSource = get_datatable("SELECT * FROM Answer");
        MarkInformation.DataBind();

        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand valid = new SqlCommand("SELECT	StuID FROM Answer WHERE MarkOrNot = 'N'");
        valid.Connection = con;
        con.Open();

        /*if all assignment have been marked*/
        if (valid.ExecuteScalar()== null)
            Response.Redirect("T_MarkDone.aspx", false);
        con.Close();
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
    protected void Submit_Click(object sender, EventArgs e)
    {
        /*add student id to cookie*/
        HttpCookie objCookie1 = new HttpCookie("Sid", sid.Text.ToString());
        Response.Cookies.Add(objCookie1);

        /*add assignment id to cookie*/
        HttpCookie objCookie2 = new HttpCookie("Aid", AID.Text.ToString());
        Response.Cookies.Add(objCookie2);

        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");
        SqlCommand com = new SqlCommand("SELECT MarkOrNot FROM Answer WHERE StuID = '" + sid.Text.ToString() + "' AND AssID = " + AID.Text.ToString());
        com.Connection = con;

        try
        {
            con.Open();
            if(com.ExecuteScalar().ToString() == "Y" )
                Response.Write("<script>javascript:alert('This Assignment have been marked! Please enter again!');</script>");
            else
                Response.Redirect("T_MarkAss.aspx", false);
            con.Close();
            initialize();
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            /*textbox is empty*/
            if (err == "“=”附近有语法错误。" || err == "未将对象引用设置到对象的实例。")
                err = "Student ID or assignment ID is wrong";
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            initialize();
        }
    }

    protected void initialize()
    {
        sid.Text = "";
        AID.Text = "";
    }
}
