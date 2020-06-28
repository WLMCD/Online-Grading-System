/*
* CS108 Advanced Database Systems
* Project : Online Grading System
* File:					S_DoAss.aspx.cs
* Description:		The cs file for doing assignment.
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

public partial class S_DoAss : System.Web.UI.Page
{
    public string uid;//student id
    public int aid;// assignment id
    public string question;
    public string weight;
    protected void Page_Load(object sender, EventArgs e)
    {
        aid = 1;//initialize
        uid = Request.Cookies["id"].Value;//get student id
        /*all assignment have done*/
        if(notValid())
            Response.Redirect("S_DoAssDone.aspx", false);
    }

    protected bool notValid()
    {
        /*connect to database*/
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        /*sql command*/
        SqlCommand valid = new SqlCommand("SELECT	Done FROM StuAss WHERE StuID = '" + uid + "' AND AssID = " + aid);
        SqlCommand validMax = new SqlCommand("SELECT MAX(AssID) FROM Assignment");

        /*connect command to database */
        valid.Connection = con;
        validMax.Connection = con;
        con.Open();

        /*get assignment id that not have done*/
        while (aid <= Int32.Parse(validMax.ExecuteScalar().ToString()) && valid.ExecuteScalar().ToString() == "Y")
        {
            aid++;
            valid = new SqlCommand("SELECT	 Done FROM StuAss WHERE StuID = '" + uid + "' AND AssID = " + aid.ToString());
            valid.Connection = con;
        }
        
        /*all assignment have done*/
        if (aid > Int32.Parse(validMax.ExecuteScalar().ToString()))
        {
            con.Close();
            return true;
        }
        /*have assignment to do*/
        con.Close();
        return false;
    }

    /*get question from database*/
    protected void get_Ass(int qNum)
    {
        string que = "";
        string wei = "";
        switch (qNum)
        {
            case 1:que = "Question1";
                wei = "Weight1";
                break;
            case 2:
                que = "Question2";
                wei = "Weight2";
                break;
            case 3:
                que = "Question3";
                wei = "Weight3";
                break;
            case 4:
                que = "Question4";
                wei = "Weight4";
                break;
            case 5:
                que = "Question5";
                wei = "Weight5";
                break;
        }
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand q = new SqlCommand("SELECT	" + que + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + uid + "') AS QID JOIN   Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);
        SqlCommand w = new SqlCommand("SELECT	" + wei + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + uid + "') AS QID JOIN    Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);

        q.Connection = con;
        w.Connection = con;

        try
        {
            con.Open();
            question = q.ExecuteScalar().ToString();
            weight = w.ExecuteScalar().ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");
        SqlCommand ans = new SqlCommand("INSERT Answer VALUES(\'" + uid + "', '" + aid + "', '" + a1.Text.ToString() + "', '" + a2.Text.ToString() + "', '" + a3.Text.ToString() + "', '" + a4.Text.ToString() + "', '" + a5.Text.ToString() + "', 'N');");
        SqlCommand done = new SqlCommand("UPDATE StuAss SET Done = 'Y' WHERE StuID = '" + uid + "' AND AssID = " + aid);

        ans.Connection = con;
        done.Connection = con;
        try
        {
            con.Open();
            ans.ExecuteNonQuery();
            done.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>javascript:alert('Successful!');</script>");
            reset();
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            reset();
        }
    }

    protected void reset()
    {
        a1.Text = "";
        a2.Text = "";
        a3.Text = "";
        a4.Text = "";
        a5.Text = "";
    }
}