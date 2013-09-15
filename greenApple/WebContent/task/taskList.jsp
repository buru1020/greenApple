<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
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

</div>
			<h2>작업 목록</h2>
			<p>${taskList.get(0).projectTitle}</p>
			<table style="text-align: center;">
				<tr>
					<th style="width: 10em;">작업명</th>
					<th style="width: 10em;">시작일</th>
					<th style="width: 10em;">종료일</th>
					<th style="width: 3em;">상태</th>
				</tr>
<c:forEach var="task" items="${taskList}">
				<tr>
					<td><a href="view.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">${task.title}</a></td>
					<td>${task.startDate}</td>
					<td>${task.endDate}</td>
					<td><c:choose>
						<c:when test="${task.status == 0}">등록</c:when>
						<c:when test="${task.status == 1}">진행</c:when>
						<c:when test="${task.status == 2}">완료</c:when>
						<c:when test="${task.status == 3}">지연</c:when>
					</c:choose></td>
				</tr>
</c:forEach>
			</table>
			<p><a href="${rootPath}/task/add.do?projectNo=${taskList.get(0).projectNo}">[새 작업]</a></p>
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
