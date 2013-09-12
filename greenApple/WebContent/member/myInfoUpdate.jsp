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
<link rel="icon" type="image/png" href="${rootPath}/res/logo_sim.png">

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
			<h1>개인 정보 변경</h1>
			<form action="myInfoUpdate.do" method="post">
				*이메일: <input type="text" name="email" value="${member.email}" readonly><br> 
				*암호: <input type="password" name="password" >
				<a href="${rootPath}/member/passwordChange.do">[비밀번호 변경]</a><br> 
				*이름: <input type="text" name="name" value="${member.name}"><br> 
				*전화: <input type="text" name="tel" value="${member.tel}"><br>
				블로그: <input type="text" name="blog" value="${member.blog}"><br> 
				우편번호: <input type="text" name="postno">
					<input type="button" value="우편번호찾기"><br> 
				기본주소: <input type="text" name="basicAddr"><br> 
				상세주소: <input type="text" name="detailAddr"><br> 
				태그: <input type="text" name="tag" value="${member.tag}"><br> 
				권한: <select name="level">
					<c:choose>
						<c:when test="${member.level == 0}"><option value="0" selected>일반회원</option></c:when>
						<c:when test="${member.level == 1}"><option value="1">관리자</option></c:when>
						<c:when test="${member.level == 2}"><option value="2">PM</option></c:when>
						<c:when test="${member.level == 9}"><option value="9">손님</option></c:when>
					</c:choose>
					</select><br>
				<input type="submit" value="변경"> 
			</form>
			
			<p>
				<a href="${rootPath}/main.do">[이전]</a> 
			</p>
		</div>
</section>	
		
		
		<!-- Section End -->

		</div>
	<!-- Container End -->

	<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>





