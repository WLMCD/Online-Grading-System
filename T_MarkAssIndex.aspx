<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_MarkAssIndex.aspx
*	Description:		The index page for marking assignment.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_MarkAssIndex.aspx.cs" Inherits="T_MarkAss" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
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
        <h1 class="text-center">Mark Assignment</h1>
        <p class="text-center">Please enter student ID and selete assignment ID for marking.</p>
   </div>
</div>

<form runat="server">
    <%--repeater for print data--%>
         &nbsp;&nbsp;
    <asp:Repeater runat="server" ID="MarkInformation">
        <HeaderTemplate>
            <table class="table table-striped">
            <tr><th>Student ID</th><th>Assignment ID</th><th>Mark Or Not</th></tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#Eval("StuID") %></td>
                <td><%#Eval("AssID") %></td>
                <td><%#Eval("MarkOrNot") %></td>
        </ItemTemplate>
         <FooterTemplate>
          </table>
        </FooterTemplate>
        </asp:Repeater>

    <%--textbox for entering student id and assignment id--%>
    <div class="form-group">
		<label for="name">Student ID</label>
		<asp:TextBox type="text" class="form-control" id="sid" 
			   placeholder="1xxxxxxx-xxxx-xxxx" runat="server" maxlength="20"/>
	</div>
    <div class="form-group">
		<label for="name">Assignment ID</label><br />
        		<asp:TextBox type="text" class="form-control" id="AID" runat="server" maxlength="20"/>
        </div>
    <%--submit button--%>
    &nbsp;&nbsp;
	<asp:Button runat="server" text="Submit" class="btn btn-primary btn-lg" OnClick="Submit_Click"></asp:Button>
    </form>
     </body>
</html>


