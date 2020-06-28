<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_CreaAss.aspx
*	Description:		Page for creating assignment.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_CreaAss.aspx.cs" Inherits="T_CreaAss" %>

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
          <a class="navbar-brand">MUST --- Online Grading System</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="T_Home.aspx"><span class="glyphicon glyphicon-user"></span> Home</a></li>
          <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                       <span class="glyphicon glyphicon-cog"></span>  Account<b class="caret"></b> 
                    </a> 
                    <ul class="dropdown-menu"> 
                        <li><a href="T_creaAcc.aspx">Create Account</a></li> 
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
                    <h1 class="text-center">Assignment creation</h1>
                    <p class="text-center">Please enters the questions and weight below：</p>
               </div>
            </div>
    <form  runat ="server" role="form">
            <%--entering question and weight--%>
        <div class="panel panel-primary">
	        <div class="panel-heading">
		        <h3 class="panel-title">Question 1</h3>
	        </div>
	    <div class="form-group"> <br />
        <asp:textbox runat="server" MaxLength="500" TextMode="MultiLine" id="q1" class="form-control" rows="10"></asp:textbox><br />
            <label for="lastname" class="col-sm-2 control-label">Weight</label>
          <asp:TextBox runat="server" MaxLength="3" type="text" class="form-control" id="w1" placeholder="Please input Weight"/>
      </div>
  </div>
        <div class="panel panel-success">
	        <div class="panel-heading">
		        <h3 class="panel-title">Question 2</h3>
	        </div>
	        <div class="form-group"> <br />
             <asp:textbox runat="server" MaxLength="500" TextMode="MultiLine"  id="q2" class="form-control" rows="10"></asp:textbox><br />
                <label for="lastname" class="col-sm-2 control-label">Weight</label>
              <asp:TextBox runat="server" MaxLength="3" type="text" class="form-control" id="w2" placeholder="Please input Weight"/>
          </div>
        </div>
        <div class="panel panel-info">
	        <div class="panel-heading">
		        <h3 class="panel-title">Question 3</h3>
	        </div>
	        <div class="form-group"> <br />
            <asp:textbox runat="server" MaxLength="500" TextMode="MultiLine" id="q3" class="form-control" rows="10"></asp:textbox><br />
                <label for="lastname" class="col-sm-2 control-label">Weight</label>
              <asp:TextBox runat="server" MaxLength="3" type="text" class="form-control" id="w3" placeholder="Please input Weight"/>
          </div>
        </div>
        <div class="panel panel-warning">
	        <div class="panel-heading">
		        <h3 class="panel-title">Question 4</h3>
	        </div>
	        <div class="form-group"> <br />
            <asp:textbox runat="server" MaxLength="500" TextMode="MultiLine" id="q4" class="form-control" rows="10"></asp:textbox><br />
                <label for="lastname" class="col-sm-2 control-label">Weight</label>
              <asp:TextBox runat="server" MaxLength="3" type="text" class="form-control" id="w4" placeholder="Please input Weight"/>
          </div>
        </div>
        <div class="panel panel-danger">
	        <div class="panel-heading">
		        <h3 class="panel-title">Question 5</h3>
	        </div>
	        <div class="form-group"> <br />
            <asp:textbox runat="server" MaxLength="500" TextMode="MultiLine" id="q5" class="form-control" rows="10"></asp:textbox><br />
                <label for="lastname" class="col-sm-2 control-label">Weight</label>
              <asp:TextBox runat="server" MaxLength="3" type="text" class="form-control" id="w5" placeholder="Please input Weight"/>
          </div>
        </div>
                &nbsp;&nbsp;&nbsp;
		        <asp:Button runat="server" text="Submit" class="btn btn-primary btn-lg" OnClick="Submit_Click"></asp:Button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button runat="server" text="Reset" class="btn btn-primary btn-lg" OnClick="Reset_Click"></asp:Button>
</form>
</body>
</html>
