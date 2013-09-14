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
<link rel="icon" type="image/png" href="${rootPath}/res/logo_sim.png">
	
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
				<div id="submenu">
<p>
<a href="view.do?no=${project.no}">[기본정보]</a>	|	
<a href="../task/list.do?projectNo=${project.no}">[작업들]</a>	|	
<a href="../feed/list.do?projectNo=${project.no}">[게시판]</a>
</p>
</div>
			<h2>${project.title}</h2>
			번호: ${project.no}<br>
			PL: <c:choose>
				<c:when test="${project.plName == ''}">없음</c:when>
				<c:otherwise>${project.plName}</c:otherwise>
			 </c:choose><br>
			시작일: ${project.startDate}<br>
			종료일: ${project.endDate}<br>
			내용: <br>${project.content}	
			<br>
			<p><a href="list.do">[목록]</a>
			<a href="update.do?no=${project.no}">[변경]</a>
			<a href="delete.do?no=${project.no}">[삭제]</a>
			</p>
			<br>
			<h2>프로젝트 맴버</h2>
			<table style="text-align: center;">
				<tr>
					<th style="width: 5em;">이름</th>
					<th style="width: 10em;">이메일</th>
					<th style="width: 10em;">전화</th>
					<th style="width: 10em;">블로그</th>
				</tr>
<c:forEach var="projectMember" items="${projectMemberList}">
				<tr>
					<td>${projectMember.name} <c:if test="${projectMember.projectLevel == 0}">★</c:if></td>
					<td>${projectMember.email}</td>
					<td>${projectMember.tel}</td>
					<td><c:choose>
						<c:when test="${projectMember.blog != ''}">${projectMember.blog}</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose></td>
				</tr>
</c:forEach>
			</table>
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
