<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Refresh" content="2;url=myInfoUpdate.do?email=${param.email}">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<title>Green Apple</title>
<link rel="icon" type="image/png" href="${rootPath}/res/logo_sim.png">

<link rel="stylesheet" href="${rootPath}/css/base.css">
<link rel="stylesheet" href="${rootPath}/css/signup_1.css"
	type="text/css" />
<link rel="stylesheet" href="${rootPath}/css/signup_2.css"
	type="text/css" />


</head>


<body class="production workflow-layout">


	<jsp:include page="/Header.jsp"></jsp:include>

	<!-- Container Start -->
	<div id="container">

		<jsp:include page="/Sidebar.jsp"></jsp:include>

<section class=main_content_section>	
			<div>
		<c:choose>
<c:when test="${status == 'NEW_PASSWORD_ERROR'}">신규 암호가 일치하지 않습니다.</c:when>
<c:when test="${status == 'OLD_PASSWORD_ERROR'}">이전 암호가 맞지 않습니다.</c:when>
<c:when test="${status == 'SUCCESS'}">암호가 변경되었습니다.</c:when>
<c:otherwise>손님</c:otherwise>
</c:choose><br>
		</div>
</section>	
				
		<!-- Section End -->	
	</div>
	<!-- Container End -->

	<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>



