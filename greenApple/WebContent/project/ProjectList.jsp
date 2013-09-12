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
			<h2>프로젝트 목록</h2>
			<table style="table-layout: fixed; width: 700px; text-align: center;">
				<thead><tr>
					<td style="width: 400px;">프로젝트명</td>
					<td style="width: 100px">시작일</td>
					<td style="width: 100px">종료일</td>
					<td style="width: 80px">PL</td>
					<td style="width: 10px"></td>
				</tr></thead>
				<tbody>
<c:forEach var="project" items="${totalProjectList}">
					<tr>
						<td style="text-align: left;"><a href="${rootPath}/project/view.do?no=${project.no}">${project.title}</a></td>
						<td>${project.startDate}</td>
						<td>${project.endDate}</td>
						<td><c:choose>
							<c:when test="${project.plName != ''}">${project.plName}</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose></td>
						<td><c:if test="${project.plEmail == sessionScope.member.email}">★</c:if></td>
					</tr>
</c:forEach>					
				</tbody>
			</table>
			<c:if test="${!(member.level == 1)}">
			<p><a href="${rootPath}/project/addForm.do">[신규 프로젝트]</a></p>
			</c:if> 
		</div>
	</section>
	<!-- Section End -->
	
	

</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
