<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="member" scope="session" type="net.bitacademy.java41.vo.Member"/>
<jsp:useBean id="projectService" scope="application" type="net.bitacademy.java41.services.ProjectService"/>
<%
pageContext.setAttribute("projectList", projectService.getMyProjects(member.getEmail()));
%>

	<!-- Side Menu Start -->
	<aside class="side_menu_aside">
		<!-- 프로필 -->
		<div class="side_photo_div">
			<img  alt="photo" src="${rootPath}/res/photo/yk.jpg" class="side_menu_member_photo">
		</div>
		<div>
			<p><a href="${rootPath}/member/myInfoUpdate.do">${member.name}</a><br>
			${member.email}<br>
			${member.tel}</p>
		</div>

<c:choose> 
	<c:when test="${member.level == 1}">
		<!-- 관리프로젝트 -->
		<div style="margin-top: 20px">
			<span>관리메뉴</span>
		</div>
		<div>
			<ul>
				<li><span><a href="${rootPath}/member/list.do">멤버관리</a></span></li>
				<li><span><a href="${rootPath}/project/list.do">프로젝트관리</a></span></li>				
			</ul>	
		</div>	
	</c:when>
	<c:otherwise>
		<!-- 참여프로젝트 -->
		<div style="margin-top: 20px">
			<span>참여 프로젝트</span>
			<span style="float: right;"><a href="${rootPath}/project/list.do">전체보기</a></span>
		</div>
		<div>
			<ul>
		<c:forEach var="myProject" items="${projectList}">			
				<li><span><a href="${rootPath}/project/view.do?no=${myProject.no}">${myProject.title}</a></span><c:if test="${myProject.level == 0}">★</c:if></li>
		</c:forEach>				
			</ul>	
		</div>
	</c:otherwise>
</c:choose>		
	</aside>
	<!-- Side Menu End -->