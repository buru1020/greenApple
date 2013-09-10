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
		<h2>회원 관리</h2>
		<div>
			<table style="table-layout: fixed; width: 700px; text-align: center;">
				<thead><tr>
					<th>이름</th>
					<th>이메일</th>
					<th>전화</th>
					<th>구분</th>
				</tr></thead>
				<tbody>
<c:forEach var="member" items="${memberList}">				
					<tr>
						<td style="text-align: left;"><a href="${rootPath}/member/view?email=${member.email}">${member.name}</a></td>
						<td>${member.email}</td>
						<td>${member.tel}</td>
						<td><c:choose>
							<c:when test="${member.level == 0}">[일반]</c:when>
							<c:when test="${member.level == 1}">[관리자]</c:when>
							<c:when test="${member.level == 2}">[PM강사]</c:when>
							<c:when test="${member.level == 9}">[손님]</c:when>
						</c:choose></td>
					</tr>
</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<!-- Section End -->
	
	

</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
