/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_AdminAcc.aspx.cs
*	Description:		The cs file for editing password of teacher account.

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

public partial class T_AdminAcc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=(local); Data source=DESKTOP-GMMSBAD\\YANG; Initial Catalog=OnlineGrade; Integrated Security=True");

        SqlCommand com = new SqlCommand("UPDATE Account SET PassWd = '"+ inpasswd.Text.ToString() + "' WHERE ID = 'admin'");
        com.Connection = con;

        try
        {
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            jumpLog();    /*return log page*/
        }
        catch (Exception ex)
        {
            string err = ex.Message;
            Server.ClearError();
            Response.Write("<script>javascript:alert(\"Error: " + err + "\");</script>");
            inpasswd.Text = "";
        }
    }

    /*return log page*/
    protected void jumpLog()
    {
        Response.Redirect("Login.aspx", false);
    }
}