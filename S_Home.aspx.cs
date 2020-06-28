/*
* CS108 Advanced Database Systems
* Project : Online Grading System
* File:					S_Home.aspx.cs
* Description:		The cs file for student home page.
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

public partial class S_Home : System.Web.UI.Page
{
    public string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = Request.Cookies["id"].Value;//get student id
    }
}