/*
* CS108 Advanced Database Systems
* Project : Online Grading System
* File:					S_Acc.aspx.cs
* Description:		The cs file for editing account page.
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

public partial class S_Acc : System.Web.UI.Page
{
    /*student id and information for displaying*/
    public string uid;//student id
    public string sName;//student name
    public string Ge;//gender
    public string Gr;//grade
    public string Aca;//academic unit  
    public string Em;//email
    public string pN;//phone number
    public string pw;//password
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.Cookies["id"].Value;//get student id
        /*set original information at the first time*/
        if (!IsPostBack)
            setOrigInfor();
        sid.Text = uid;
    }

    /*function for set input module same as data in database*/
    protected void setOrigInfor()
    {
        /*initial select value*/
        gender.SelectedIndex = 0;
        grade.SelectedIndex = 0;
        AU.SelectedIndex = 0;

        /*connect to database*/
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        /*sql command*/
        SqlCommand StuName = new SqlCommand("SELECT StuName FROM StuInfor WHERE StuID = '" + uid + "'");
        SqlCommand Gender = new SqlCommand("SELECT Gender FROM StuInfor WHERE StuID = '" + uid + "'");
        SqlCommand Grade = new SqlCommand("SELECT Grade FROM StuInfor WHERE StuID = '" + uid + "'");
        SqlCommand Academic = new SqlCommand("SELECT Academic FROM StuInfor WHERE StuID = '" + uid + "'");
        SqlCommand Email = new SqlCommand("SELECT Email FROM StuInfor WHERE StuID = '" + uid + "'");
        SqlCommand PhoneNum = new SqlCommand("SELECT PhoneNum FROM StuInfor WHERE StuID = '" + uid + "'");
        SqlCommand Passwd = new SqlCommand("SELECT Passwd FROM StuInfor WHERE StuID = '" + uid + "'");

        /*connect command to database */
        StuName.Connection = con;
        Gender.Connection = con;
        Grade.Connection = con;
        Academic.Connection = con;
        Email.Connection = con;
        PhoneNum.Connection = con;
        Passwd.Connection = con;

        try
        {
            con.Open();
            /*set all input module same as data in database*/
            sid.Text = uid;
            sName = StuName.ExecuteScalar().ToString();
            name.Text = sName;
            Ge = Gender.ExecuteScalar().ToString();
            while (Ge != gender.SelectedValue)
                gender.SelectedIndex++;
            Gr = Grade.ExecuteScalar().ToString();
            while (Gr != grade.SelectedValue)
                grade.SelectedIndex++;
            Aca = Academic.ExecuteScalar().ToString();
            while (Aca != AU.SelectedValue)
                AU.SelectedIndex++;
            Em = Email.ExecuteScalar().ToString();
            Mail.Text = Em;
            pN = PhoneNum.ExecuteScalar().ToString();
            PNum.Text = pN;
            pw = Passwd.ExecuteScalar().ToString();
            psd.Text = pw;
            con.Close();
        }
        /*print any wrong*/
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            con.Close();
        }
    }

    /*reset*/
    protected void Reset_Click(object sender, EventArgs e)
    {
        setOrigInfor();
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        /*connect to database*/
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        /*sql command*/
        SqlCommand updInfor = new SqlCommand("UPDATE StuInfor SET StuName = \'" + name.Text.ToString() + "\', Gender = \'" + gender.SelectedValue + "\', Grade = \'" + grade.SelectedValue + "\', Academic = \'" + AU.SelectedValue + "\', Email = \'" + Mail.Text.ToString() + "\', PhoneNum = '" + PNum.Text.ToString() + "\', PassWd = '" + psd.Text.ToString() + "' WHERE StuID = '" + uid + "'");
        SqlCommand updAcc = new SqlCommand("UPDATE Account SET PassWd = '" + psd.Text.ToString() + "' WHERE ID = '" + uid + "'");

        /*connect command to database */
        updInfor.Connection = con;
        updAcc.Connection = con;

        try
        {
            con.Open();
            /*execute command*/
            updInfor.ExecuteNonQuery();
            updAcc.ExecuteNonQuery();

            con.Close();
            Response.Write("<script>javascript:alert('Successful!');</script>");
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
        }
    }
}