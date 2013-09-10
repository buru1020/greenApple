<%@page import="java.util.Map"%>
<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<title>Green Apple</title>
<link rel="icon" type="image/png" href="../res/logo_sim.png">
	
<link rel="stylesheet" href="${rootPath}/css/base.css">	
<link rel="stylesheet" href="${rootPath}/css/signup_1.css" type="text/css" />
<link rel="stylesheet" href="${rootPath}/css/signup_2.css" type="text/css" />

</head>


<body class="production workflow-layout">


<jsp:include page="/Header.jsp"></jsp:include>



<!-- Container Start -->
<div id="container">

<jsp:include page="/Sidebar.jsp"></jsp:include>

	
	
	<!-- Section Start -->
	<section class=main_content_section>
		<div>
			<h2>회원정보</h2>
			<p>
			구분: <c:choose>
					<c:when test="${memberInfo.level == 0}">일반</c:when>
					<c:when test="${memberInfo.level == 1}">관리자</c:when>
					<c:when test="${memberInfo.level == 2}">PM강사</c:when>
					<c:when test="${memberInfo.level == 9}">손님</c:when>
				</c:choose><br>
			이름: ${memberInfo.name}<br>
			이메일: ${memberInfo.email}<br>
			전화: ${memberInfo.tel}<br>
			블로그: ${memberInfo.blog}<br>
			우편번호: <br>
			기본주소: <br>
			상세주소: <br>
			태그: ${memberInfo.tag}<br>
			</p> 
			<br>
			<h2>프로젝트</h2>
			<ul>
<c:forEach var="projectEx" items="${projectList}">
				<li><span>${projectEx.title}&nbsp;&nbsp;[${projectEx.plName}]<c:if test="${projectEx.level == 0}">★</c:if></span></li>
</c:forEach>
			</ul>			
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
