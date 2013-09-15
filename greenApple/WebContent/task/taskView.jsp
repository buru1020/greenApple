<%@page import="java.util.Map"%>
<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@page import="net.bitacademy.java41.vo.Task"%>
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

</div>
			<h2>작업 정보</h2>
						
			작업명: ${task.title}<br>
			프로젝트명: ${task.projectTitle}<br>
			UI프로토타입: ${task.uiProtoUrl}<br>
			내용: <br>
			${task.content}	<br>
			시작일: ${task.startDate}<br>
			종료일: ${task.endDate}<br>
			상태: <c:choose>
					<c:when test="${task.status == 0}">등록</c:when>
					<c:when test="${task.status == 1}">진행</c:when>
					<c:when test="${task.status == 2}">완료</c:when>
					<c:when test="${task.status == 3}">지연</c:when>
				</c:choose><br>
			<p><a href="list.do?projectNo=${task.projectNo}">[작업목록]</a>
			<a href="update.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">[변경]</a>
			<a href="delete.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">[삭제]</a>
			</p>
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
