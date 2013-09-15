<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Refresh" content="2;url=${returnUrl}">
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
		<c:choose>
		<%-- 프로젝트 수정 --%>
		<c:when test="${resultStatus == 'UPDATE_FAIL'}">작업 정보 변경 실패하였습니다..</c:when>
		<c:when test="${resultStatus == 'UPDATE_SUCCESS'}">작업 정보가 변경되었습니다.</c:when>
		<%-- 프로젝트 삭제 --%>
		<c:when test="${resultStatus == 'DELETE_FAIL'}">작업이 삭제 실패하였습니다.</c:when>
		<c:when test="${resultStatus == 'DELETE_SUCCESS'}">작업이 삭제되었습니다.</c:when>
		<c:otherwise>오류상황</c:otherwise>
		</c:choose><br>
	</section>
	<!-- Section End -->
	
	

</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>

