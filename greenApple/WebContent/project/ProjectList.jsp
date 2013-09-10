<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="member" type="net.bitacademy.java41.vo.Member" scope="session"></jsp:useBean>
<jsp:useBean id="projectList" type="java.util.ArrayList<ProjectEx>" scope="session"></jsp:useBean>
<jsp:useBean id="allProjectList" type="java.util.ArrayList<ProjectEx>" scope="session"></jsp:useBean>


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
		<div>
			<table style="table-layout: fixed; width: 700px; text-align: center;">
				<thead><tr>
					<td style="width: 400px;">프로젝트명</td>
					<td style="width: 100px">시작일</td>
					<td style="width: 100px">종료일</td>
					<td style="width: 80px">PL</td>
					<td style="width: 10px"></td>
				</tr></thead>
				<tbody>
<% 	for(ProjectEx p : allProjectList) { %>
					<tr>
						<td style="text-align: left;"><a href="javascript:clickProject(<%=p.getNo() %>)"><%=p.getTitle() %></a></td>
						<td><%=p.getStartDate() %></td>
						<td><%=p.getEndDate() %></td>
						<td><%=(p.getPlName() == null) ? "-" : p.getPlName()%></td>
						<td><%=( member.getEmail().equals(p.getPlEmail()) ) ? "★" : ""%></td>
					</tr>
			
<% 	} %>		</tbody>
			</table>
			<c:if test="${!(member.level == 1)}">
			<p><a href="${rootPath}/project/add">[신규 프로젝트]</a></p>
			</c:if> 
		</div>
	</section>
	<!-- Section End -->
	
	

</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
