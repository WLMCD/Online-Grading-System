<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					S_Mark.aspx
*	Description:		Page for displaying marked assignment score.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_Mark.aspx.cs" Inherits="S_Mark" %>

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
          <li><a href="S_Home.aspx"><span class="glyphicon glyphicon-user"></span> Home</a></li>
          <li><a href="S_Acc.aspx"><span class="glyphicon glyphicon-cog"></span>  Account</a></li>
           <li class="dropdown"> 
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                      <span class="glyphicon glyphicon-tasks"></span>  Assignment<b class="caret"></b> 
                    </a> 
                    <ul class="dropdown-menu"> 
                        <li><a href="S_DoAss.aspx">Do Assignment</a></li> 
                        <li><a href="S_Mark.aspx">Assignment Mark</a></li> 
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
        <h1 class="text-center">Assignment mark</h1>
        <p class="text-center"> Your assignment mark are shown below.<br />For assignment detail, enter assignment ID and click 'Inquiry' button. </p>
   </div>
</div>
    
    <form runat="server">
        <%--print score--%>
        <asp:Repeater runat="server" ID="markInformation">
        <HeaderTemplate>
            <table class="table table-striped">
            <tr><th>Assignment ID</th><th>Q1 Score</th><th>Q2 Score</th><th>Q3 Score</th>
                <th>Q4 Score</th><th>Q5 Score</th><th>GPA</th></tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#Eval("AssID") %></td>
                <td><%#Eval("RealScore1") %></td>
                <td><%#Eval("RealScore2") %></td>
                <td><%#Eval("RealScore3") %></td>
                <td><%#Eval("RealScore4") %></td>
                <td><%#Eval("RealScore5") %></td>
                <td><%#Eval("GPA") %></td>
        </ItemTemplate>
         <FooterTemplate>
          </table>
        </FooterTemplate>
        </asp:Repeater>

            <%--print average score--%>
        <div class="panel panel-primary">
	        <div class="panel-heading">
		        <h3 class="panel-title">Average Score</h3>
	        </div>
            <div><strong><%=average %></strong>
            </div>
        </div>

            <%--for entering assignment id--%>
    <div class="form-group">
		<label for="name">Assignment ID</label>
		<asp:TextBox type="text" class="form-control" id="aid" runat="server" maxlength="10"/>
	</div>

        <%--submit button--%>
            &nbsp;&nbsp;&nbsp;
	<asp:Button runat="server" text="Submit" class="btn btn-primary btn-lg" OnClick="Submit_Click"></asp:Button>
        </form>
    
</body>
</html>


