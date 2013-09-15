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
			<form action="add.do" method="post">
				<input type="hidden" name="projectNo" value="${projectNo}">
				프로젝트명: ${task.projectTitle}<br> 
				작업명: <input type="text" name="title" placeholder="작업명"><br>
				UI프로토타입: <input type="text" name="uiProtoUrl" placeholder="/task/add.do"><br>
				내용:<br>
				<textarea name="content" rows="4" cols="50">${task.content}</textarea><br> 
				시작일: <input type="text" name="startDate" placeholder="예)2013-4-5"><br> 
				종료일: <input type="text" name="endDate" placeholder="예)2013-6-5"><br> 
				상태: <select name="status">
						<option value="0" selected="selected">등록</option>
						<option value="1">진행</option>
						<option value="2">완료</option>
						<option value="3">지연</option>
					</select><br>
				<input type="submit" value="등록">
				<input type="reset" value="취소">
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