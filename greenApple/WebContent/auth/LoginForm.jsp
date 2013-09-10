<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie[] cookies = request.getCookies();
String email = null;
String checked = "";
if (cookies != null) {
	for( Cookie c : cookies ) {
		if (c.getName().equals("email")) {
			email = " value='"+ c.getValue() +"'";
			checked = "checked";
			break;
		}
	}
}
%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Green Apple - Login</title>
  <link rel="icon" type="image/png" href="../res/logo_sim.png">
  
<link rel="stylesheet" href="../css/login_1.css" type="text/css" />
<link rel="stylesheet" href="../css/login_2.css" type="text/css" />
  
</head>
<body class="production workflow-layout">

<div id="page">
  <div id="wrapper">
    <div id="content" role="main">
	  <div class="login-box workflow-box small">
	  	<img alt="logo" src="${rootPath}/res/greenApple-2.png" id="log_img" >
	  </div>
    
	  <div id="login" class="login-box workflow-box small" data-method="standard">
<!-- 	    <header>
	      <h1>Log in</h1>
	    </header> -->
	    <section class="clearfix" id="log-in-container">
			<div>
			  <form action="login" method="post" id="login-form" class="aui login-form">
			  	<!-- <input type="hidden" name="tryLogin" value="true"> -->
		        <div class="field-group username">
		          <input type="text" class="text" id="id_username" name="email" <%=email %> autofocus="autofocus" placeholder="Email" />
		        </div>
			    <div class="field-group">
			      <input type="password" id="id_password" class="password" name="password" placeholder="password" />
			    </div>
			    <div class="buttons-container">
			      <div class="buttons">
			        <button type="submit" name="submit" class="aui-button aui-style aui-button-primary">
			            Log in
			        </button>
			        <Span style="margin-left: 10px">
			        	<input type="checkbox" name="saveId" <%=checked %>><span>save ID</span>
			        </span>
			      </div>
					<div class="sign-up">
			          <a href="${rootPath}/member/signUp">Need an account? Sign up free.</a>
			        </div>
			    </div>
			  </form>
			</div>
	    </section>
 	 </div>
 	 
 	 
    </div>
  </div>
</div>

</html>