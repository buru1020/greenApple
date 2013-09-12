<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h1>신규 프로젝트 변경</h1>
			<form action="update.do" method="post">
				번호: <input type="text" name="no" value="${project.no}" readonly="readonly"><br>
				프로젝트명: <input type="text" name="title" value="${project.title}"><br> 
				내용:<br>
				<textarea name="content" rows="4" cols="50">${project.content}</textarea><br> 
				시작일: <input type="text" name="startDate" value="${project.startDate}" placeholder="예)2013-4-5"><br> 
				종료일: <input type="text" name="endDate" value="${project.endDate}" placeholder="예)2013-6-5"><br> 
				태그: <input type="text" name="tag" value="${project.tag}" placeholder="예)태그1 태그2 태그3 (공백으로 구분)"><br>
				<input type="submit" value="등록">
				<a href="${rootPath}/project/view.do?no=${project.no}">취소</a><br>
			</form>
			<p>
				<a href="list.do">[목록]</a>
			</p>
		</section>
		<!-- Section End -->



	</div>
	<!-- Container End -->


	<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>