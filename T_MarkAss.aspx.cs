/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_MarkAss.aspx.cs
*	Description:		The cs file for marking assignment.

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
    public string Sid;
    public int aid;
    public string question;
    public string weight;
    public string answer;
    public double realScore;
    protected void Page_Load(object sender, EventArgs e)
    {
        aid = Int32.Parse(Request.Cookies["Aid"].Value);// get ansignment id from cookie
        Sid = Request.Cookies["Sid"].Value;// get student id from cookie
    }

    /*get each question according to question number*/
    protected void get_Ass(int qNum)
    {
        string que = "";
        string wei = "";
        string an = "";
        switch (qNum)
        {
            case 1:
                que = "Question1";
                wei = "Weight1";
                an = "A1";
                break;
            case 2:
                que = "Question2";
                wei = "Weight2";
                an = "A2";
                break;
            case 3:
                que = "Question3";
                wei = "Weight3";
                an = "A3";
                break;
            case 4:
                que = "Question4";
                wei = "Weight4";
                an = "A4";
                break;
            case 5:
                que = "Question5";
                wei = "Weight5";
                an = "A5";
                break;
        }
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand q = new SqlCommand("SELECT	" + que + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + Sid + "') AS QID JOIN   Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);
        SqlCommand w = new SqlCommand("SELECT	" + wei + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + Sid + "') AS QID JOIN    Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);
        SqlCommand a = new SqlCommand("SELECT	" + an + " FROM Answer WHERE StuID = '" + Sid + "' AND AssID = " + aid);

        q.Connection = con;
        w.Connection = con;
        a.Connection = con;

        try
        {
            con.Open();
            question = q.ExecuteScalar().ToString();
            weight = w.ExecuteScalar().ToString();
            answer = a.ExecuteScalar().ToString();
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
        SqlCommand cmt = new SqlCommand("INSERT Comment VALUES(\'" + Sid + "\', " + aid + ", \'" + c1.Text.ToString() + "\', \'" + c2.Text.ToString() + "\', \'" + c3.Text.ToString() + "\', \'" + c4.Text.ToString() + "\', \'" + c5.Text.ToString() + "\' );");
        SqlCommand sco = new SqlCommand("INSERT Score VALUES(\'" + Sid + "\', " + aid + ", " + Double.Parse(s1.Text.ToString()) + ", " + Double.Parse(s2.Text.ToString()) + ", " + Double.Parse(s3.Text.ToString()) + ", " + Double.Parse(s4.Text.ToString()) + ", " + Double.Parse(s5.Text.ToString()) + ", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)");
        SqlCommand mark = new SqlCommand("UPDATE Answer SET MarkOrNot = 'Y' WHERE StuID = '" + Sid + "' AND AssID = " + aid);

        cmt.Connection = con;
        sco.Connection = con;
        mark.Connection = con;

        try
        {
            con.Open();
            cmt.ExecuteNonQuery();
            sco.ExecuteNonQuery();
            mark.ExecuteNonQuery();
            con.Close();
            inseScore();
            Response.Write("<script>javascript:alert('Successful!');</script>");
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
        }
    }

    /*refresh page to get next assignment*/
    protected void Next_Click(object sender, EventArgs e)
    {
        Response.Redirect("T_MarkAssIndex.aspx", false);
    }

    /*get sum of real score*/
    protected double get_realScoreSum(int qNum)
    {
        double realScoreSum = 0;
        string wei = "";
        string sc = "";
        switch (qNum)
        {
            case 1:
                wei = "Weight1";
                sc = "Score1";
                break;
            case 2:
                wei = "Weight2";
                sc = "Score2";
                break;
            case 3:
                wei = "Weight3";
                sc = "Score3";
                break;
            case 4:
                wei = "Weight4";
                sc = "Score4";
                break;
            case 5:
                wei = "Weight5";
                sc = "Score5";
                break;
        }
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand w = new SqlCommand("SELECT	" + wei + " FROM(SELECT AssID FROM    StuInfor JOIN    StuAss ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = '" + Sid + "') AS QID JOIN    Assignment ON    QID.AssID = Assignment.AssID AND Assignment.AssID = " + aid);
        SqlCommand s = new SqlCommand("SELECT	" + sc + " FROM Score WHERE StuID = '" + Sid + "' AND AssID = " + aid);

        w.Connection = con;
        s.Connection = con;

        try
        {
            con.Open();
            realScore = Double.Parse(w.ExecuteScalar().ToString()) * Double.Parse(s.ExecuteScalar().ToString());
            realScoreSum += realScore;
            SqlCommand rScore = new SqlCommand("UPDATE Score SET Real" + sc + " = " + realScore + " WHERE StuID = '" + Sid + "' AND AssID = " + aid);
            rScore.Connection = con;
            rScore.ExecuteNonQuery();
            con.Close();
            return realScoreSum;
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            con.Close();
            return realScoreSum;
        }
    }

    /*get sum of weight*/
    protected double get_weightSum(int qNum)
    {
        double weightSum = 0;
        string wei = "";
        switch (qNum)
        {
            case 1:
                wei = "Weight1";
                break;
            case 2:
                wei = "Weight2";
                break;
            case 3:
                wei = "Weight3";
                break;
            case 4:
                wei = "Weight4";
                break;
            case 5:
                wei = "Weight5";
                break;
        }
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand w = new SqlCommand("SELECT	" + wei + " FROM Assignment WHERE AssID = " + aid);

        w.Connection = con;

        try
        {
            con.Open();
            weightSum += Double.Parse(w.ExecuteScalar().ToString());
            con.Close();
            return weightSum;
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            con.Close();
            return weightSum;
        }
    }

    /*insert GPA*/
    protected void inseScore()
    {
        double realSum = 0.0;
        double weightSum = 0.0;
        double GPA = 0.0;
        int QNum = 1;
        while(QNum <= 5)
        {
            realSum += get_realScoreSum(QNum);
            weightSum += get_weightSum(QNum);
            QNum++;
        }
        GPA = realSum / weightSum;
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");
        SqlCommand inSum = new SqlCommand("UPDATE Score SET GPA = " + GPA + " WHERE StuID = '" + Sid + "' AND AssID = " + aid);
   
        inSum.Connection = con;
        try
        {
            con.Open();
            inSum.ExecuteNonQuery();
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

    protected void initialize()
    {
        c1.Text = "";
        c2.Text = "";
        c3.Text = "";
        c4.Text = "";
        c5.Text = "";
        s1.Text = "";
        s2.Text = "";
        s3.Text = "";
        s4.Text = "";
        s5.Text = "";
    }
}