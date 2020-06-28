<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					S_MarkAss.aspx
*	Description:		Page for viewing assignment detail score.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_MarkAss.aspx.cs" Inherits="S_MarkAss" %>
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
        <p class="text-center"><strong>Assignment <%=aid %></strong> <br />
   </div>
</div>
    
     <%--print each question score--%>
     <form runat="server">
         <div class="panel-group" id="accordion">
	        <div class="panel panel-default">
		        <div class="panel-heading">
			        <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Question 1</a>
			        </h4>
		        </div>
                <%get_Ass(1); %>
		            <div id="collapseOne" class="panel-collapse collapse">
			            <div class="panel-body">
                            <strong>Question:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=question %>
                                </div>
                            </div>
                
                            <strong>Weight:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=weight %>
                                </div>
                            </div>

                            <strong>Answer:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=answer %>
                                </div>
                            </div>

                            <strong>Comment:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=comment %>
                                </div>
                            </div>

                            <strong>Question Score:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=score %>
                                </div>
                            </div>
		            </div>
	            </div>
            </div>
             </div>

                  <div class="panel-group" id="accordion1">
	        <div class="panel panel-default">
		        <div class="panel-heading">
			        <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo">Question 2</a>
			        </h4>
		        </div>
                <%get_Ass(2); %>
		            <div id="collapseTwo" class="panel-collapse collapse">
			            <div class="panel-body">
                            <strong>Question:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=question %>
                                </div>
                            </div>
                
                            <strong>Weight:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=weight %>
                                </div>
                            </div>

                            <strong>Answer:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=answer %>
                                </div>
                            </div>

		                     <strong>Comment:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=comment %>
                                </div>
                            </div>

                            <strong>Question Score:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=score %>
                                </div>
                            </div>
		            </div>
	            </div>
            </div>
                      </div>

                  <div class="panel-group" id="accordion3">
	        <div class="panel panel-default">
		        <div class="panel-heading">
			        <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion3" href="#collapseThree">Question 3</a>
			        </h4>
		        </div>
                <%get_Ass(3); %>
		            <div id="collapseThree" class="panel-collapse collapse">
			            <div class="panel-body">
                            <strong>Question:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=question %>
                                </div>
                            </div>
                
                            <strong>Weight:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=weight %>
                                </div>
                            </div>

                            <strong>Answer:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=answer %>
                                </div>
                            </div>

		                     <strong>Comment:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=comment %>
                                </div>
                            </div>

                            <strong>Question Score:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=score %>
                                </div>
                            </div>

                        </div>
		            </div>
	            </div>
            </div>

                  <div class="panel-group" id="accordion4">
	        <div class="panel panel-default">
		        <div class="panel-heading">
			        <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion4" href="#collapseFour">Question 4</a>
			        </h4>
		        </div>
                <%get_Ass(4); %>
		            <div id="collapseFour" class="panel-collapse collapse">
			            <div class="panel-body">
                            <strong>Question:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=question %>
                                </div>
                            </div>
                
                            <strong>Weight:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=weight %>
                                </div>
                            </div>

                            <strong>Answer:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=answer %>
                                </div>
                            </div>

		                     <strong>Comment:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=comment %>
                                </div>
                            </div>

                            <strong>Question Score:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=score %>
                                </div>
                            </div>
		            </div>
	            </div>
            </div>
                      </div>

                  <div class="panel-group" id="accordion5">
	        <div class="panel panel-default">
		        <div class="panel-heading">
			        <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion5" href="#collapseFive">Question 5</a>
			        </h4>
		        </div>
                <%get_Ass(5); %>
		            <div id="collapseFive" class="panel-collapse collapse">
			            <div class="panel-body">
                            <strong>Question:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=question %>
                                </div>
                            </div>
                
                            <strong>Weight:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=weight %>
                                </div>
                            </div>

                            <strong>Answer:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=answer %>
                                </div>
                            </div>

		                     <strong>Comment:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=comment %>
                                </div>
                            </div>

                            <strong>Question Score:</strong> 
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <%=score %>
                                </div>
                            </div>
		            </div>
	            </div>
            </div>
                      </div>

            <div class="panel panel-primary">
     <%--print GPA--%>
    <div class="panel-heading">
        <h3 class="panel-title">GPA</h3>
    </div>
    <div class="panel-body">
        <%=GPA %>
    </div>
                </div>

           <%--Back button--%>
                  &nbsp;&nbsp;
         <asp:Button runat="server" text="Back" class="btn btn-primary btn-lg" OnClick="Back_Click" ></asp:Button>
        </form>
    
</body>
</html>


