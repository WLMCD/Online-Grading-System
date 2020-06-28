<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_ManaAcc.aspx
*	Description:		Page for managing account.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_ManaAcc.aspx.cs" Inherits="T_ManaAcc" %>

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
        <h1 class="text-center">Account management</h1>
        <p class="text-center"><strong>For deleting student account:</strong><br />
            &nbsp;&nbsp;&nbsp;Enter student ID and click 'Delete' button, then click 'Refresh' button to refresh information table.<br />
            &nbsp;&nbsp;&nbsp;Make sure to deleting account, the operation cannot be revoked.<br />
            &nbsp;&nbsp;&nbsp;<strong>For editing student account:</strong><br />
            &nbsp;&nbsp;&nbsp;Enter student ID and click 'Edit' button.<br />
        </p>
   </div>
</div>
     <form runat="server">

         <%--Refresh button to refresh student information in page--%>
         &nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" text="Refresh" class="btn btn-success" ></asp:Button>
         <br />
         <br />
         <%--Repeater for print information--%>
    <asp:Repeater runat="server" ID="StuInformation">
        <HeaderTemplate>
            <table class="table table-striped">
            <tr><th>Student ID</th><th>Student Name</th><th>Gender</th><th>Grade</th>
                <th>Academic Unit</th><th>E-mail</th><th>Phone Number</th><th>Password</th></tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#Eval("StuID") %></td>
                <td><%#Eval("StuName") %></td>
                <td><%#Eval("Gender") %></td>
                <td><%#Eval("Grade") %></td>
                <td><%#Eval("Academic") %></td>
                <td><%#Eval("Email") %></td>
                <td><%#Eval("PhoneNum") %></td>
                <td><%#Eval("Passwd") %></td>
        </ItemTemplate>
         <FooterTemplate>
          </table>
        </FooterTemplate>
        </asp:Repeater>
       
         <%--entering student id--%>
        <div class="form-group">
            <br />
		<label for="name">For editing or deleting student account, enter Student ID below</label>
		<asp:TextBox type="text" class="form-control" id="sid" 
			   placeholder="1xxxxxxx-xxxx-xxxx" runat="server" maxlength="18"/>
	    </div>
        
         <%--Delete or edit button--%>
        &nbsp;&nbsp;&nbsp;
        <asp:Button class="btn btn-primary btn-lg" text="Delete" runat="server" OnClick="Delete_Click"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" text="Edit" class="btn btn-primary btn-lg" OnClick="Edit_Click"></asp:Button>
        </form>

    
</body>
</html>
