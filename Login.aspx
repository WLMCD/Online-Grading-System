<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					Login.aspx
*	Description:		The Log page.
*
*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			5043932241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
        body
        {
            background-image:url("img/T_back.jpg");
            background-size:100%;
            background-repeat:no-repeat;
        }
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
          </div>
    <%--school logo--%>
    </nav>
        <div class="text-center">
         <img src="\school.png" class="auto-style1"/>
     </div>
    
    <%--For entering--%>
    <form runat="server">
         <div class="container">
           <div class="jumbotron">
               <%--For entering user id--%>
                <div class="form-group">
		        <label for="name">User ID</label>
		        <asp:TextBox type="text" class="form-control" id="uid"  runat="server" maxlength="18"/>
	            </div>
               <%--For entering password--%>
                <div class="form-group">
		        <label for="name">Password</label>
		        <asp:TextBox type="password" class="form-control" id="pw"  runat="server" maxlength="10"/>
	            </div>
               <%--submit button--%>
               <asp:Button runat="server" text="Log in" class="btn btn-primary btn-lg" OnClick="Log_Click"></asp:Button>
           </div>
        </div>
    </form>
</body>
</html>
