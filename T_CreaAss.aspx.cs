/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_CreaAss.aspx.cs
*	Description:		The cs file for creating assignment.

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

public partial class T_CreaAss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = Request.Cookies["id"].Value;
    }

    /*insert data to assignment table*/
    protected void insertQuestion(string q1, double w1, string q2, double w2, string q3, double w3,
                                                                   string q4, double w4, string q5, double w5)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand com = new SqlCommand("INSERT Assignment VALUES(\'" + q1 + "\', \'" + w1 + "\', \'" + q2 + "\', \'" + w2 + "\', \'" + q3 + "\', \'" + w3 + "\', \'" + q4 + "\', \'" + w4 + "\', \'" + q5 + "\', \'" + w5 + "\');");
        SqlCommand StuAss = new SqlCommand("DELETE FROM StuAss WHERE Done = 'N' INSERT StuAss SELECT  StuID, AssID, 'N' FROM    StuInfor CROSS JOIN  Assignment GROUP BY StuID, AssID EXCEPT SELECT  StuID, AssID, 'N' FROM    StuAss WHERE   Done = 'Y' ");
        com.Connection = con;
        StuAss.Connection = con;
        try
        {
            con.Open();
            com.ExecuteNonQuery();
            StuAss.ExecuteNonQuery();
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

    /*reset textbox*/
    protected void reset()
    {
        q1.Text = "";
        q2.Text = "";
        q3.Text = "";
        q4.Text = "";
        q5.Text = "";
        w1.Text = "";
        w2.Text = "";
        w3.Text = "";
        w4.Text = "";
        w5.Text = "";
    }
        protected void Submit_Click(object sender, EventArgs e)
    {
        string Q1 = q1.Text.ToString();
        string Q2 = q2.Text.ToString();
        string Q3 = q3.Text.ToString();
        string Q4 = q4.Text.ToString();
        string Q5 = q5.Text.ToString();
        int tmp;// temprate integer variable
        /*if any textbox are empty*/
        if (q1.Text == "" || q2.Text == "" || q3.Text == "" || q4.Text == "" || q5.Text == "" ||
            w1.Text == "" || w2.Text == "" || w3.Text == "" || w4.Text == "" || w5.Text == "")
        {
            Response.Write("<script>javascript:alert(\"Some question or weight have not enter! Please check and enter again!\");</script>");
            return;
        }
        /*if weight are not digit*/
        if (!int.TryParse(w1.Text, out tmp) || !int.TryParse(w2.Text, out tmp) || !int.TryParse(w3.Text, out tmp) || !int.TryParse(w4.Text, out tmp) || !int.TryParse(w5.Text, out tmp))
        {
            Response.Write("<script>javascript:alert(\"Weight must be number, please check and enter again!\");</script>");
            return;
        }
        double W1 = Double.Parse(w1.Text);
        double W2 = Double.Parse(w2.Text);
        double W3 = Double.Parse(w3.Text);
        double W4 = Double.Parse(w4.Text);
        double W5 = Double.Parse(w5.Text);

        /*call function to insert table*/
        insertQuestion(Q1, W1, Q2, W2, Q3, W3, Q4, W4, Q5, W5);
    }

    /*reset*/
    protected void Reset_Click(object sender, EventArgs e)
    {
        reset();
    }
}