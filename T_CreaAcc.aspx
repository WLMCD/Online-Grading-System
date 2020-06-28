<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_CreaAcc.aspx
*	Description:		Page for creating account.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_CreaAcc.aspx.cs" Inherits="T_CreaAcc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/> 
	<title></title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            border-radius: 6px;
            width: 219px;
            height: 218px;
        }
        </style>
</head>
<body>
    <%--navigation bar--%>
    <nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">MUST --- Online Grading System</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="T_Home.aspx"><span class="glyphicon glyphicon-user"></span> Home</a></li>
          <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                       <span class="glyphicon glyphicon-cog"></span>  Account<b class="caret"></b> 
                    </a> 
                    <ul class="dropdown-menu"> 
                        <li><a href="T_CreaAcc.aspx">Create Account</a></li> 
                        <li><a href="T_ManaAcc.aspx">Manage Account</a></li> 
                        <li><a href="T_AdminAcc.aspx">Administrator Account</a></li> 
                    </ul> 
                </li>
           <li class="dropdown"> 
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                      <span class="glyphicon glyphicon-tasks"></span>  Assignment<b class="caret"></b> 
                    </a> 
                    <ul class="dropdown-menu"> 
                        <li><a href="T_CreaAss.aspx">Create Assignment</a></li> 
                        <li><a href="T_MarkAssIndex.aspx">Mark Assignment</a></li> 
                    </ul> 
                </li>
          <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login out</a></li>
        </ul>
      </div>
</nav>
     <div class="text-center">
         <img src="\school.png" class="auto-style1"/>
           </div>
        <div class="container">
            <div class="jumbotron">
                <h1 class="text-center">Student account creation</h1>
                <p class="text-center">Please enters the student information below：</p>
           </div>
        </div>

    <form id="form1" runat ="server">

        <%--For entering student id--%>
	<div class="form-group">
		<label for="name">Student ID</label>
		<asp:TextBox type="text" class="form-control" id="sid" 
			   placeholder="1xxxxxxx-xxxx-xxxx" runat="server" maxlength="20"/>
	</div>
        <%--For entering student name--%>
    <div class="form-group">
		<label for="name">Name</label>
		<asp:TextBox  type="text" class="form-control" id="name" 
			   placeholder="No more than 50 characters" runat="server" maxlength="50"/>
	</div>
        <%--For selecting gender--%>
    <label for="name">Gender</label>
	<div>
		 <asp:RadioButtonList   runat="server" id="gender" RepeatDirection="Vertical" RepeatLayout="Flow">
            <asp:ListItem Selected="True">Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
             </asp:RadioButtonList>
    </div>
        <%--For selecting grade--%>
        <label for="name">Grade</label>
        <div>
		 <asp:RadioButtonList   runat="server" id="grade" RepeatDirection="Vertical" RepeatLayout="Flow">
            <asp:ListItem Selected="True">Freshman</asp:ListItem>
            <asp:ListItem>Sophomore</asp:ListItem>
             <asp:ListItem>Junior</asp:ListItem>
             <asp:ListItem>Senior</asp:ListItem>
             </asp:RadioButtonList>
        </div>
        <%--For selecting academic unit--%>
        <div class="form-group">
		<label for="name">Academic Units</label><br />
        <asp:DropDownList id ="AU" runat="server">
            <asp:ListItem>Faculty of Information Technology</asp:ListItem>
            <asp:ListItem>School of Business</asp:ListItem>
            <asp:ListItem>Faculty of Law</asp:ListItem>
            <asp:ListItem>Faculty of Chinese Medicine</asp:ListItem>
            <asp:ListItem>Faculty of Hospitality and Tourism Management</asp:ListItem>
            <asp:ListItem>Faculty of Humanities and Arts</asp:ListItem>
            <asp:ListItem>Faculty of Health Sciences</asp:ListItem>
            <asp:ListItem>University International College</asp:ListItem>
            <asp:ListItem>School of Pharmacy</asp:ListItem>
            </asp:DropDownList>
        </div>
         <%--For entering E-mail--%>
        <div class="form-group">
		<label for="name">E-Mail</label>
		<asp:TextBox type="text" class="form-control" id="Mail" 
			   placeholder="No more than 50 characters" runat="server" maxlength="50"/>
	</div>
         <%--For entering phone number--%>
        <div class="form-group">
		<label for="name">Phone Number</label>
		<asp:TextBox type="text" class="form-control" id="PNum" 
			   placeholder="No more than 20 characters" runat="server" maxlength="20"/>
	</div>

    <%--submit and reset button--%>
        &nbsp;&nbsp;&nbsp;
	<asp:Button runat="server" text="Submit" class="btn btn-primary btn-lg" OnClick="Submit_Click"></asp:Button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" text="Reset" class="btn btn-primary btn-lg" OnClick="Reset_Click"></asp:Button>
</form>
</body>
</html>
