/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_EditAcc.aspx.cs
*	Description:		The cs file for editing account.

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

public partial class T_EditAcc : System.Web.UI.Page
{
    public string SID;// student id
    public string sName;// student name
    public string Ge;// gender
    public string Gr;// grade
    public string Aca;// academic unit
    public string Em;// email
    public string pN;// phone number
    public string pw;// password
    protected void Page_Load(object sender, EventArgs e)
    {
        SID = Request.Cookies["SID"].Value; // get student id from cookie
        if(!IsPostBack)
            setOrigInfor();
        sid.Text = SID;
    }

    protected void setOrigInfor()
    {
        /*initialize*/
        gender.SelectedIndex = 0;
        grade.SelectedIndex = 0;
        AU.SelectedIndex = 0;
        /*connect*/
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand StuName = new SqlCommand("SELECT StuName FROM StuInfor WHERE StuID = '" + SID + "'");
        SqlCommand Gender = new SqlCommand("SELECT Gender FROM StuInfor WHERE StuID = '" + SID + "'");
        SqlCommand Grade = new SqlCommand("SELECT Grade FROM StuInfor WHERE StuID = '" + SID + "'");
        SqlCommand Academic = new SqlCommand("SELECT Academic FROM StuInfor WHERE StuID = '" + SID + "'");
        SqlCommand Email = new SqlCommand("SELECT Email FROM StuInfor WHERE StuID = '" + SID + "'");
        SqlCommand PhoneNum = new SqlCommand("SELECT PhoneNum FROM StuInfor WHERE StuID = '" + SID + "'");
        SqlCommand Passwd = new SqlCommand("SELECT Passwd FROM StuInfor WHERE StuID = '" + SID + "'");

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
            sid.Text = SID;
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
            Em =Email.ExecuteScalar().ToString();
            Mail.Text = Em;
            pN = PhoneNum.ExecuteScalar().ToString();
            PNum.Text = pN;
            pw = Passwd.ExecuteScalar().ToString();
            psd.Text = pw;
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
    protected void Reset_Click(object sender, EventArgs e)
    {
        setOrigInfor();
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand updInfor = new SqlCommand("UPDATE StuInfor SET StuName = \'" + name.Text.ToString() + "\', Gender = \'" + gender.SelectedValue + "\', Grade = \'" + grade.SelectedValue + "\', Academic = \'" + AU.SelectedValue + "\', Email = \'" + Mail.Text.ToString() + "\', PhoneNum = '" + PNum.Text.ToString() + "\', PassWd = '" + psd.Text.ToString() + "' WHERE StuID = '" + SID + "'");
        SqlCommand updAcc = new SqlCommand("UPDATE Account SET PassWd = '" + psd.Text.ToString() + "' WHERE ID = '" + SID + "'");

        updInfor.Connection = con;
        updAcc.Connection = con;

        try
        {
            con.Open();
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

    /*back to last page */
    protected void Other_Click(object sender, EventArgs e)
    {
        Response.Redirect("T_ManaAcc.aspx", false);
    }
}