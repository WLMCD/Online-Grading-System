/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_CreaAcc.aspx.cs
*	Description:		The cs file for creating account.

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

public partial class T_CreaAcc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = Request.Cookies["id"].Value;
    }

    /*insert data to StuInfor table*/
    protected void insertStuInfor(string sid, string sName, string Gder,
        string Grade, string Academic, string Email, string pNum)
    {
        /*connect to database*/
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        /*sql command*/
        SqlCommand com = new SqlCommand("INSERT StuInfor VALUES(\'" + sid + "\', \'" + sName + "\', \'" + Gder + "\', \'" + Grade + "\', \'" + Academic + "\', \'" + Email + "\', '" + pNum + "\', 123456);");
        SqlCommand accpaswd = new SqlCommand("INSERT Account VALUES(\'" + sid + "\', \'S\', \'123456\');");
        SqlCommand StuAss = new SqlCommand("DELETE FROM StuAss WHERE Done = 'N' INSERT StuAss SELECT  StuID, AssID, 'N' FROM    StuInfor CROSS JOIN  Assignment GROUP BY StuID, AssID EXCEPT SELECT  StuID, AssID, 'N' FROM    StuAss WHERE   Done = 'Y' ");

        /*connect command to database */
        com.Connection = con;
        accpaswd.Connection = con;
        StuAss.Connection = con;
        try
        {
            con.Open();
            com.ExecuteNonQuery();
            accpaswd.ExecuteNonQuery();
            StuAss.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>javascript:alert('Successful!');</script>");
            reset();
        }
        catch(Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            reset();
        }
    }

    /*reset input module*/
    protected void reset()
    {
        sid.Text = "";
        name.Text = "";
        gender.SelectedIndex = 0;
        grade.SelectedIndex = 0;
        AU.SelectedIndex = 0;
        Mail.Text = "";
        PNum.Text = "";
    }

        
    protected void Submit_Click(object sender, EventArgs e)
    {
        /*student id is empty*/
        if (sid.Text.ToString() == "")
        {
            Response.Write("<script>javascript:alert(\"Student ID can not be empty! Please check and enter again!\");</script>");
            return;
        }
        /*assignment id is empty*/
        else if (name.Text.ToString() == "")
        {
            Response.Write("<script>javascript:alert(\"Student name can not be empty! Please check and enter again!\");</script>");
            return;
        }
        /*get all data*/
        string Sid = sid.Text.ToString();
        string sName = name.Text.ToString();
        string Gder = gender.SelectedValue;
        string Grade = grade.SelectedValue;
        string Academic = AU.SelectedValue;
        string Email = Mail.Text.ToString();
        string pNum = PNum.Text.ToString();
        /*call insertStuInfor function to insert table*/
        insertStuInfor(Sid, sName, Gder, Grade, Academic, Email, pNum);
    }

    
    protected void Reset_Click(object sender, EventArgs e)
    {
        reset();
    }
}