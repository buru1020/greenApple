<%@page import="java.util.Map"%>
<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="projectList" type="java.util.ArrayList<ProjectEx>" scope="session"></jsp:useBean>
<jsp:useBean id="project" type="net.bitacademy.java41.vo.ProjectEx" scope="session"></jsp:useBean>
<jsp:useBean id="memberList" type="java.util.ArrayList<java.util.Map>" scope="session"></jsp:useBean>


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
<% 	if (project != null) { %>				
			<h2><%=project.getTitle() %></h2>
			번호: <%=project.getNo() %><br>
			PL: <%=(project.getPlName() == null) ? "없음" : project.getPlName()%><br>
			시작일: <%=project.getStartDate() %><br>
			종료일: <%=project.getEndDate() %><br>
			내용: <br><%=project.getContent().replace("\n", "<br>") %>	
			<br>
			<br>
			<h2>프로젝트 맴버</h2>
<% 		if (memberList != null && memberList.size() > 0) {
	System.out.println(memberList.size());
			for(Map map : memberList) { %>
				<%=((Member)map.get("projectMember")).getName() %>
				<%=(Integer)map.get("level") == 0 ? "★" : "" %>
				<br>
<%			}
		} else {%>	
			<span>프로젝트 맴버가 없습니다.</span>
<% 		} %>	
<% 	} else { %>
<span>프로젝트 정보가 없습니다.</span>
<% 	} %>					
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>
