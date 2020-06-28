<%--
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:					T_MarkAss.aspx
*	Description:		Page for marking assignment.

*	Designer:		LIU MINGCHEN 
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_MarkAss.aspx.cs" Inherits="T_MarkAss" %>
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
            <p class="text-center"><strong>Student ID: <%=Sid %></strong> <br /><strong>Assignment <%=aid %></strong> <br />Marking assignment below. 
                Finally, click 'Submit' button. Then click 'Next Assignment' button for marking next assignment.</p>
       </div>
    </div>
    <%--button for next assignment--%>
     <form runat="server">
         &nbsp;&nbsp;
         <asp:Button runat="server" text="Next Assignment" class="btn btn-primary btn-lg" OnClick="Next_Click" ></asp:Button>
         <br />
         <br />
         <%--get each question, weight, answer--%>
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

		                    <div class="panel panel-primary">
	                            <div class="panel-heading">
		                            <h3 class="panel-title">Comment: </h3>
	                            </div>
	                        <div class="form-group"> <br />
                                <asp:textbox runat="server" MaxLength="100" TextMode="MultiLine" id="c1" class="form-control" rows="2" ></asp:textbox>
	                        </div>
			            <br />
                            <div class="form-group">
		<label for="name">Score:</label>
		<asp:TextBox type="text" class="form-control" id="s1" runat="server" placeholder="Full Score is 100 points" maxlength="3"/>
	</div></div>
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

		                    <div class="panel panel-primary">
	                            <div class="panel-heading">
		                            <h3 class="panel-title">Comment: </h3>
	                            </div>
	                        <div class="form-group"> <br />
                                <asp:textbox runat="server" MaxLength="100" TextMode="MultiLine" id="c2" class="form-control" rows="2" ></asp:textbox>
	                        </div>
			            <br />
                            <div class="form-group">
		                    <label for="name">Score:</label>
		                    <asp:TextBox type="text" class="form-control" id="s2" runat="server"  placeholder="Full Score is 100 points" maxlength="3"/>
	                    </div></div>
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

		                    <div class="panel panel-primary">
	                            <div class="panel-heading">
		                            <h3 class="panel-title">Comment: </h3>
	                            </div>
	                        <div class="form-group"> <br />
                                <asp:textbox runat="server" MaxLength="100" TextMode="MultiLine" id="c3" class="form-control" rows="2" ></asp:textbox>
	                        </div>
			            <br />
                            <div class="form-group">
		                        <label for="name">Score:</label>
		                        <asp:TextBox type="text" class="form-control" id="s3" runat="server"  placeholder="Full Score is 100 points" maxlength="3"/>
	                        </div></div>
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

		                    <div class="panel panel-primary">
	                            <div class="panel-heading">
		                            <h3 class="panel-title">Comment: </h3>
	                            </div>
	                        <div class="form-group"> <br />
                                <asp:textbox runat="server" MaxLength="100" TextMode="MultiLine" id="c4" class="form-control" rows="2" ></asp:textbox>
	                        </div>
			            <br />
                            <div class="form-group">
		                        <label for="name">Score:</label>
		                        <asp:TextBox type="text" class="form-control" id="s4" runat="server"  placeholder="Full Score is 100 points" maxlength="3"/>
	                        </div></div>
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

		                    <div class="panel panel-primary">
	                            <div class="panel-heading">
		                            <h3 class="panel-title">Comment: </h3>
	                            </div>
	                        <div class="form-group"> <br />
                                <asp:textbox runat="server" MaxLength="100" TextMode="MultiLine" id="c5" class="form-control" rows="2" ></asp:textbox>
	                        </div>
			            <br />
                                                    <div class="form-group">
		                        <label for="name">Score:</label>
		                        <asp:TextBox type="text" class="form-control" id="s5" runat="server"  placeholder="Full Score is 100 points" maxlength="3"/>
	                        </div></div>
		            </div>
	            </div>
            </div>
    </div>

         <%--submit button--%>
           <br />
                &nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" text="Submit" class="btn btn-primary btn-lg" OnClick="Submit_Click"></asp:Button>
        </form>
    
</body>
</html>

