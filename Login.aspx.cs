/*
* CS108 Advanced Database Systems
* Project : Online Grading System
* File:					Login.aspx.cs
* Description:		The cs file for log page.
*
* Designer:		LIU MINGCHEN
* ID:					17098537-I011-0055
* E-mail:			504393241@qq.com
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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Log_Click(object sender, EventArgs e)
    {
        /*connect to database*/
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        /*sql command*/
        SqlCommand paswd = new SqlCommand("SELECT PassWd FROM Account WHERE ID = '" + uid.Text.ToString() + "'");
        SqlCommand iden = new SqlCommand("SELECT Iden FROM Account WHERE Passwd = '" + pw.Text.ToString() + "'");

        /*connect command to database */
        paswd.Connection = con;
        iden.Connection = con;

        /*add user id to cookie*/
        HttpCookie objCookie = new HttpCookie("id", uid.Text.ToString());
        Response.Cookies.Add(objCookie);

        /*if wrong, go catch and prompt*/
        try
        {
            con.Open();// open connection
            string passwd = paswd.ExecuteScalar().ToString();// get password from database
            if (passwd == pw.Text.ToString())//compare
            {
                string ident= iden.ExecuteScalar().ToString();// get identity from database
                 /*jump according to identity*/
                if ( ident == "T")
                    Response.Redirect("T_Home.aspx", false);
                else
                    Response.Redirect("S_Home.aspx", false);
            }
            else
                    Response.Write("<script>javascript:alert(\"User ID or password is wrong\");</script>");//wrong

            /*reset textbox*/
            uid.Text = "";
            pw.Text = "";
            con.Close();// close connection
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            /* textbox are unfilled */
            if (err == "未将对象引用设置到对象的实例。")
                err = "User ID or password is wrong";
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");//prompt wrong

            /*reset textbox*/
            uid.Text = "";
            pw.Text = "";
            con.Close();
        }
    }
}