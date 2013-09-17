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
<link rel="stylesheet" href="${rootPath}/css/signup_1.css"
	type="text/css" />
<link rel="stylesheet" href="${rootPath}/css/signup_2.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Apple</title>
<link rel="stylesheet" href="${rootPath}/css/base.css">
</head>
<body>
	<jsp:include page="/Header.jsp"></jsp:include>


	<!-- Container Start -->
	<div id="container">

		<jsp:include page="/Sidebar.jsp"></jsp:include>


		<!-- Section Start -->
		<section class=main_content_section>
			<h1>작업변경</h1>
			<form action="update.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="projectNo" value="${task.projectNo}">
				<input type="hidden" name="taskNo" value="${task.taskNo}">
				프로젝트명: ${project.title}<br> 
				작업명: <input type="text" name="title" value="${task.title}"><br>
				UI프로토타입: <input type="file" name="uiProto" ><br>
				내용:<br>
				<textarea name="content" rows="4" cols="50">${task.content}</textarea><br> 
				시작일: <input type="text" name="startDate" value="${task.startDate}" placeholder="예)2013-4-5"><br> 
				종료일: <input type="text" name="endDate" value="${task.endDate}" placeholder="예)2013-6-5"><br> 
				상태: <select name="status">
						<option value="0" <c:if test="${task.status == 0}">selected</c:if>>등록</option>
						<option value="1" <c:if test="${task.status == 1}">selected</c:if>>진행</option>
						<option value="2" <c:if test="${task.status == 2}">selected</c:if>>완료</option>
						<option value="3" <c:if test="${task.status == 3}">selected</c:if>>지연</option>
					</select><br>
				<input type="submit" value="등록">
				<a href="view.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">취소</a><br>
			</form>
			<p>
				<a href="list.do?projectNo=${task.projectNo}">[목록]</a>
			</p>
		</section>
		<!-- Section End -->



	</div>
	<!-- Container End -->


	<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>