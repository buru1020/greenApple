<%@page import="java.util.Map"%>
<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="projectList" type="java.util.ArrayList<ProjectEx>" scope="session"></jsp:useBean>
<jsp:useBean id="project" type="net.bitacademy.java41.vo.ProjectEx" scope="session"></jsp:useBean>
<jsp:useBean id="memberList" type="java.util.ArrayList<java.util.Map>" scope="session"></jsp:useBean>


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
			<p><a href="list">[목록]</a>
			<a href="update?no=${project.no}">[변경]</a>
			<a href="delete?no=${project.no}">[삭제]</a>
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
<% 			for(Map map : memberList) { %>
				<tr>
					<td> <%=((Member)map.get("projectMember")).getName() %> <%=(Integer)map.get("level") == 0 ? "★" : "" %> </td>
					<td> <%=((Member)map.get("projectMember")).getEmail() %> </td>
					<td> <%=((Member)map.get("projectMember")).getTel() %> </td>
					<td> <%=(((Member)map.get("projectMember")).getBlog() == null) ? "-" : ((Member)map.get("projectMember")).getBlog() %> </td>
				</tr>
<%			} %>	
			</table>
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
