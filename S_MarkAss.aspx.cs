/*
* CS108 Advanced Database Systems
* Project : Online Grading System
* File:					S_MarkAss.aspx.cs
* Description:		The cs file for viewing assignment detail score.
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

public partial class S_MarkAss : System.Web.UI.Page
{
    public string uid;//student id
    public int aid;// assignment id
    public string question;
    public string weight;
    public string answer;
    public string comment;
    public double score;
    public double GPA;
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.Cookies["id"].Value;// get student id
        aid = Int32.Parse(Request.Cookies["AID"].Value);// get assignment id
    }

    /*get question according to question number*/
    protected void get_Ass(int qNum)
    {
        string que = "";
        string wei = "";
        string an = "";
        string cm = "";
        string sc = "";
        switch (qNum)
        {
            case 1:
                que = "Question1";
                wei = "Weight1";
                an = "A1";
                cm = "Comment1";
                sc = "RealScore1";
                break;
            case 2:
                que = "Question2";
                wei = "Weight2";
                an = "A2";
                cm = "Comment2";
                sc = "RealScore2";
                break;
            case 3:
                que = "Question3";
                wei = "Weight3";
                an = "A3";
                cm = "Comment3";
                sc = "RealScore3";
                break;
            case 4:
                que = "Question4";
                wei = "Weight4";
                an = "A4";
                cm = "Comment4";
                sc = "RealScore4";
                break;
            case 5:
                que = "Question5";
                wei = "Weight5";
                an = "A5";
                cm = "Comment5";
                sc = "RealScore5";
                break;
        }
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand q = new SqlCommand("SELECT	" + que + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + uid + "') AS QID JOIN   Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);
        SqlCommand w = new SqlCommand("SELECT	" + wei + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + uid + "') AS QID JOIN    Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);
        SqlCommand a = new SqlCommand("SELECT	" + an + " FROM Answer WHERE StuID = '" + uid + "' AND AssID = " + aid);
        SqlCommand c = new SqlCommand("SELECT	" + cm + " FROM Comment WHERE StuID = '" + uid + "' AND AssID = " + aid);
        SqlCommand s = new SqlCommand("SELECT	" + sc + " FROM Score WHERE StuID = '" + uid + "' AND AssID = " + aid);
        SqlCommand t = new SqlCommand("SELECT	GPA FROM Score WHERE StuID = '" + uid + "' AND AssID = " + aid);

        q.Connection = con;
        w.Connection = con;
        a.Connection = con;
        c.Connection = con;
        s.Connection = con;
        t.Connection = con;
        try
        {
            con.Open();
            question = q.ExecuteScalar().ToString();
            weight = w.ExecuteScalar().ToString();
            answer = a.ExecuteScalar().ToString();
            comment = c.ExecuteScalar().ToString();
            score = Double.Parse(s.ExecuteScalar().ToString());
            GPA = Double.Parse(t.ExecuteScalar().ToString());
            con.Close();
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            con.Close();
        }
    }

    /*back to last page*/
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("S_Mark.aspx", false);
    }
}