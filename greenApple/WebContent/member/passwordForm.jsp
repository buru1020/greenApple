<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<title>Green Apple</title>
<link rel="icon" type="image/png" href="../res/logo_sim.png">

<link rel="stylesheet" href="${rootPath}/css/base.css">
<link rel="stylesheet" href="${rootPath}/css/signup_1.css"
	type="text/css" />
<link rel="stylesheet" href="${rootPath}/css/signup_2.css"
	type="text/css" />


</head>


<body class="production workflow-layout">


	<jsp:include page="/Header.jsp"></jsp:include>



	<!-- Container Start -->
	<div id="container">

		<jsp:include page="/Sidebar.jsp"></jsp:include>


		<!-- Section Start -->
		<section class=main_content_section>
		<div>
		<h1>암호변경</h1>
<form action="passwordChange" method="post">
이메일: <input type="text" name="email" value="${member.email}" readonly><br>
이전 암호: <input type="password" name="password"><br>
새 암호: <input type="password" name="newPassword"><br>
새 암호 확인: <input type="password" name="newPassword2"><br>
<input type="submit" value="변경">

</form>
	
			
			<p>
				<a href="myInfoUpdate?email=${member.email}">[이전]</a> 
				<a href="../project/list">[목록]</a>
			</p>
		</div>
		</section>
		</div>

		
		
		<!-- Section End -->

		
	<!-- Container End -->

	<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>


