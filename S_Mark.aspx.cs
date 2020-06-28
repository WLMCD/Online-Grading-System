/*
* CS108 Advanced Database Systems
* Project : Online Grading System
* File:					S_Mark.aspx.cs
* Description:		The cs file for displaying marked assignment score.
*
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
public partial class S_Mark : System.Web.UI.Page
{
    public string uid;
    public double average = 0.0;
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.Cookies["id"].Value;//get student ID

        /*bind data source to repeater*/
        markInformation.DataSource = get_datatable("SELECT * FROM Score WHERE StuID = '" + uid + "'");
        markInformation.DataBind();
        /*calculate average mark*/
        avgMark();
    }

    /*get data table from sql*/
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

    /*calculate average mark*/
    protected void avgMark()
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");
        SqlCommand avg = new SqlCommand("SELECT AVG(GPA) FROM Score WHERE StuID = '" + uid + "'");

        avg.Connection = con;
        try
        {
            con.Open();
            average = Double.Parse(avg.ExecuteScalar().ToString());// get average score
            con.Close();
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            if (err != "输入字符串的格式不正确。")
                Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            con.Close();
        }
    }

    /*check assignment id and whether marked*/
    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");
        SqlCommand check = new SqlCommand("SELECT MarkOrNot FROM Answer WHERE StuID = '" + uid + "' AND AssID = " + aid.Text.ToString());
        check.Connection = con;
        try
        {
            con.Open();
            /*haven't been mark*/
            if (check.ExecuteScalar().ToString() != "Y")
                Response.Write("<script>javascript:alert(\" This Assignment have not marked! Please enter again!\");</script>");
            else
            {
                /*add assignment ID to cookie for later use*/
                HttpCookie objCookie = new HttpCookie("AID", aid.Text.ToString());
                Response.Cookies.Add(objCookie);
                Response.Redirect("S_MarkAss.aspx", false);
            }
            con.Close();
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            /*the input box is empty*/
            if (err == "未将对象引用设置到对象的实例。")
                err = "Assignment ID is wrong. Please enter again!";
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            con.Close();
        }
    }
}